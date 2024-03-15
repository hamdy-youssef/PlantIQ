//
//  CameraView.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 04/03/2024.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    var body: some View {
        CameraScan()
    }
}

#Preview {
    CameraView()
}

struct CameraScan: View {
    
    @StateObject var camera = CamerModel()
    
    var body: some View {
        
        ZStack {
            // going to be camera preview
            CameraPreview(camera: camera)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack {
                
                if camera.isTaken {
                    HStack {
                        Spacer()
                        Button(action: camera.reTake, label: {
                            Image(systemName: "arrow.triangle.2.circlepath.camera")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        })
                        .padding(.trailing, 10)
                    }
                }
                
                Spacer()
                
               
                    
                    // if taken showing save and again take button
                    
                    if camera.isTaken {
                        
                        Button(action: {if !camera.isSaved{camera.savePic()}}, label: {
                            Text(camera.isSaved ? "Saved" : "Save")
                                .foregroundColor(Color.black)
                                .fontWeight(.semibold)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .background(Color.white)
                                .clipShape(Capsule())
                        })
                        .padding(.leading)
                        .position(x: 80, y: 600)
                        
                        Spacer()
                    }else {
                        HStack {
                            Button(action: camera.takePic, label: {
                                ZStack {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 65, height: 65, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                        .frame(width: 75, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }
                            })
                        }
                        .frame(height: 75)
                    }
                
            }
        }
        .onAppear(perform: {
            camera.check()
            camera.session.startRunning()
        })
        .onDisappear(perform: {
            camera.session.stopRunning()
        })
        .alert(isPresented: $camera.alert) {
            Alert(title: Text("Camera Access Denied"), message: Text("Please allow access to the camera in Settings."), dismissButton: .default(Text("OK")))
        }
    }
}
 // Camera Model
class CamerModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    
    @Published var isTaken = false
    
    @Published var session = AVCaptureSession()
    
    @Published var alert = false
    
    // read out pic data
    @Published var outPut = AVCapturePhotoOutput()
    
    // preview
    @Published var preview: AVCaptureVideoPreviewLayer!
    
    @Published var isSaved = false
    
    @Published var picData = Data(count: 0)
    
    func check() {
        // first chiking camera has got premission
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setUp()
            return
            // setting up session
            
        case .notDetermined:
            // re asking for premission
            AVCaptureDevice.requestAccess(for: .video) { status in
                if status {
                    self.setUp()
                }
            }
            
        case .denied:
            self.alert.toggle()
            return
            
        default: 
            return
        }
    }
    
    func setUp() {
        // setting up camera
        do {
            // setting config
            self.session.beginConfiguration()
            
            guard let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back) else {
                print("Failed to get the camera device")
                return
            }
            
            let input = try AVCaptureDeviceInput(device: device)
            // cheaking and add session
            if self.session.canAddInput(input) {
                self.session.addInput(input)
            } else {
                print("Failed to add input to the session")
            }
            
            // same for output
            if self.session.canAddOutput(self.outPut) {
                self.session.addOutput(self.outPut)
            } else {
                print("Failed to add output to the session")
            }
            
            self.session.commitConfiguration()
        }catch {
            print("Error setting up camera: \(error.localizedDescription)")
        }
    }
    
    func capturePhoto() {
           let settings = AVCapturePhotoSettings()
           self.outPut.capturePhoto(with: settings, delegate: self)
       }
    
    // tacke and retacke func
    func takePic() {
        DispatchQueue.global(qos: .background).async {
            self.outPut.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            self.session.stopRunning()
            DispatchQueue.main.async {
                withAnimation{self.isTaken.toggle()}
            }
        }
    }
    
    func reTake() {
        DispatchQueue.global(qos: .background).async {
            self.outPut.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            self.session.startRunning()
            DispatchQueue.main.async {
                withAnimation{self.isTaken.toggle()}
                self.isSaved = false
            }
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            print("Error capturing photo: \(error.localizedDescription)")
            return
        }
        print("Photo captured")
        
        // Convert AVCapturePhoto to UIImage
        guard let imageData = photo.fileDataRepresentation(),
              let uiImage = UIImage(data: imageData),
              let finalImageData = uiImage.jpegData(compressionQuality: 1.0) else {
            print("Failed to convert photo to image data")
            return
        }
        
        print("Image data size: \(finalImageData.count)")
        self.picData = finalImageData
    }

    
    func savePic() {
        if !self.picData.isEmpty {
            if let image = UIImage(data: self.picData) {
                UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
            } else {
                print("Failed to convert data to UIImage.")
            }
        } else {
            print("No image data to save.")
        }
    }

    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            print("Error saving image: \(error.localizedDescription)")
        } else {
            print("Image saved successfully")
            self.isSaved = true
        }
    }

    
}



// setting view for preview
struct CameraPreview: UIViewRepresentable {
    
    @ObservedObject var camera: CamerModel
    
    func makeUIView(context: Context) ->  UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        //properties
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
	        camera.session.startRunning()
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
}

