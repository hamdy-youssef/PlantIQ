//import SwiftUI
//import AVFoundation
//
//
//#Preview {
//    CameraScanView()
//}
//
//
//import SwiftUI
//import AVFoundation
//
//struct CameraScanView: View {
//    @State private var isScanning = false
//    @State private var scannedImage: UIImage?
//    @State private var showScanAnimation = false
//    
//    var body: some View {
//        ZStack {
//            CameraPreview(isScanning: $isScanning, scannedImage: $scannedImage)
//                .edgesIgnoringSafeArea(.all)
//            
//            VStack {
//                Spacer()
//                
//                Button(action: {
//                    self.isScanning.toggle()
//                    self.showScanAnimation.toggle()
//                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                        self.showScanAnimation.toggle()
//                        // Capture image
//                        self.captureImage()
//                    }
//                }) {
//                    Image(systemName: "camera.viewfinder")
//                        .font(.system(size: 60))
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .clipShape(Circle())
//                        .overlay(
//                            Circle()
//                                .stroke(Color.white, lineWidth: 4)
//                                .scaleEffect(showScanAnimation ? 2 : 1)
//                                .opacity(showScanAnimation ? 0 : 1)
//                                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false))
//                        )
//                }
//                .padding(.bottom, 50)
//            }
//        }
//        .onAppear {
//            self.isScanning = true
//        }
//    }
//    
//    func captureImage() {
//        guard let captureSession = AVCaptureDevice.default(for: .video) else { return }
//        let photoOutput = AVCapturePhotoOutput()
//        guard let deviceInput = try? AVCaptureDeviceInput(device: captureSession) else { return }
//        
//        let capturePhotoSession = AVCaptureSession()
//        capturePhotoSession.addInput(deviceInput)
//        capturePhotoSession.addOutput(photoOutput)
//        
//        photoOutput.capturePhoto(with: AVCapturePhotoSettings(), delegate: PhotoCaptureDelegate(scannedImage: $scannedImage))
//    }
//}
//
//struct CameraPreview: UIViewRepresentable {
//    @Binding var isScanning: Bool
//    @Binding var scannedImage: UIImage?
//    
//    func makeUIView(context: Context) -> some UIView {
//        let view = UIView(frame: UIScreen.main.bounds)
//        return view
//    }
//    
//    func updateUIView(_ uiView: UIViewType, context: Context) {
//        if isScanning {
//            // Start camera session
//            startCameraSession(uiView)
//        } else {
//            // Stop camera session
//            stopCameraSession()
//        }
//    }
//    
//    private func startCameraSession(_ view: UIViewType) {
//        guard let cameraView = view as? UIView else { return }
//        
//        // Initialize AVCaptureSession
//        let captureSession = AVCaptureSession()
//        
//        // Configure AVCaptureDevice
//        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
//        do {
//            let input = try AVCaptureDeviceInput(device: captureDevice)
//            captureSession.addInput(input)
//        } catch {
//            print("Error: \(error.localizedDescription)")
//        }
//        
//        // Configure AVCaptureVideoPreviewLayer
//        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
//        previewLayer.videoGravity = .resizeAspectFill
//        previewLayer.frame = cameraView.layer.bounds
//        cameraView.layer.addSublayer(previewLayer)
//        
//        // Start AVCaptureSession
//        captureSession.startRunning()
//    }
//    
//    private func stopCameraSession() {
//        // Stop AVCaptureSession
//        // You can add additional cleanup code here if needed
//    }
//}
//
//class PhotoCaptureDelegate: NSObject, AVCapturePhotoCaptureDelegate {
//    @Binding var scannedImage: UIImage?
//    
//    init(scannedImage: Binding<UIImage?>) {
//        _scannedImage = scannedImage
//    }
//    
//    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
//        guard let data = photo.fileDataRepresentation(), let image = UIImage(data: data) else { return }
//        
//        // Save the captured image to the device's photo library
//        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:context:)), nil)
//        
//        // Set the captured image to the scannedImage binding
//        self.scannedImage = image
//    }
//    
//    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
//        if let error = error {
//            print("Error saving image: \(error.localizedDescription)")
//        } else {
//            print("Image saved successfully")
//        }
//    }
//}
//class PhotoCaptureDelegate: NSObject, AVCapturePhotoCaptureDelegate {
//    @Binding var scannedImage: UIImage?
//    
//    init(scannedImage: Binding<UIImage?>) {
//        _scannedImage = scannedImage
//    }
//    
//    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
//        guard let data = photo.fileDataRepresentation(), let image = UIImage(data: data) else { return }
//        
//        // Save the captured image to the device's photo library
//        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
//        
//        // Set the captured image to the scannedImage binding
//        self.scannedImage = image
//    }
//}
//
