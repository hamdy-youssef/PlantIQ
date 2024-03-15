//
//  test SwiftUI.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 03/03/2024.
//

import Foundation
import SwiftUI

class TimerManager1: ObservableObject {
    @Published var displayedValue = 0.0
    @Published var showvalue = false
    var value = 0.50
    
    init(initialValue: Double) {
        self.value = initialValue
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { [self] timer in
            if showvalue {
                if self.displayedValue < self.value {
                    self.displayedValue += 0.01
                } else {
                    timer.invalidate()
                }
            }else{
                if self.displayedValue > 0 {
                    self.displayedValue -= 0.01
                }
                else {
                    timer.invalidate()
                }
            }
        }
    }
}

struct CircleView: View {
    @ObservedObject var tm: TimerManager1
    var x: CGFloat
    var y: CGFloat
    
    var firstColor: Color
    var secondeColor: Color
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 24)
                .frame(width: 125, height: 125)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
                .position(x: x, y: y) // Position of the circle
            
            Circle()
                .stroke(lineWidth: 0.34)
                .frame(width: 100, height: 100)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.3),.clear]), startPoint: .bottomTrailing, endPoint: .topLeading))
                .position(x: x, y: y) // Position of the inner circle
            
            Circle()
                .trim(from: 0, to: tm.showvalue ? tm.value : 0)
                .stroke(style: StrokeStyle(lineWidth: 24, lineCap: .round))
                .frame(width: 125, height: 125)
                .rotationEffect(.degrees(-90))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [firstColor,secondeColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .position(x: x, y: y) // Position of the animated circle
            
            NumValue1(displayedValue: tm.displayedValue, color: .black)
                .position(x: x, y: y) // Position of the percentage text
        }
    }
}


struct DashBoardContentView1: View {
    @ObservedObject var tm = TimerManager1(initialValue: 0.10)
    
    @ObservedObject var tm1 = TimerManager1(initialValue: 0.25)
    @ObservedObject var tm2 = TimerManager1(initialValue: 0.75)
    @ObservedObject var tm3 = TimerManager1(initialValue: 0.40)
    @ObservedObject var tm4 = TimerManager1(initialValue: 0.60)
    
    var body: some View {
        ZStack {
            Color(.white)
            
            
            // Title with Image
            HStack {
                GeometryReader { geo in
                    Image("Logo-Green")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width * 0.3, height: geo.size.height * 0.25)
                        .foregroundColor(.blue)
                        .position(x: 80, y: 120)
                }
                
                Text("Dashboard").bold()
                    .foregroundColor(Color(red: 0.0, green: 168.0/255.0, blue: 107.0/255.0))
                    .font(.system(size: 30))
                    .font(.title)
                    .position(x: 5, y: 115)
            }
            .padding(.top, 20)
            
            // First Circle
            VStack {
                CircleView(tm: tm1, x: 110, y: 350, firstColor: Color(red: 00, green: 204.0/255.0, blue: 204.0/255.0), secondeColor: Color(red: 0.0, green: 64.0/255.0, blue: 128.0/255.0))
                Text("Water In Tank!").bold()
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .position(x: 110, y: -230)
            }
           
            // Second Circle
            VStack {
                CircleView(tm: tm2, x: 310, y: 350, firstColor:  Color(red: 128.0/255.0, green: 64.0/255.0, blue: 0.0), secondeColor: Color(red: 0.0/255.0, green: 128.0/255.0, blue: 0.0))
                Text("Soil Fertility").bold()
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .position(x: 300, y: -231)
            }
            
            // Third Circle
            VStack {
                CircleView(tm: tm3, x: 110, y: 650, firstColor: Color(red: 192.0/255.0, green: 192.0/255.0, blue: 192.0/255.0), secondeColor: Color(red: 173.0/255.0, green: 216.0/255.0, blue: 230.0/255.0))
                Text("Air Humidity!").bold()
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .position(x: 110, y: 70)
            }
            
            // Fourth Circle
            VStack {
                CircleView(tm: tm4, x: 310, y: 650, firstColor: Color(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0), secondeColor: Color(red: 0.0, green: 100.0/255.0, blue: 0.0))
                Text("Co2").bold()
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .position(x: 310, y: 69)
            }
            
        }
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.spring().speed(0.2)){
                tm1.showvalue.toggle()
                tm1.startTimer()
                
                tm2.showvalue.toggle()
                tm2.startTimer()
                
                tm3.showvalue.toggle()
                tm3.startTimer()
                
                tm4.showvalue.toggle()
                tm4.startTimer()
            }
        }
        .onDisappear(perform: {
            withAnimation(.spring().speed(0.2)){
                tm1.showvalue.toggle()
                tm1.startTimer()
                
                tm2.showvalue.toggle()
                tm2.startTimer()
                
                tm3.showvalue.toggle()
                tm3.startTimer()
                
                tm4.showvalue.toggle()
                tm4.startTimer()
            }
        })
    }
}

struct ContentView_Previews1: PreviewProvider {
    static var previews: some View {
        Group {
            DashBoardContentView1()
                .environmentObject(TimerManager1(initialValue: 0.0))
                .previewLayout(.fixed(width: 400, height: 400)) // Adjust preview size as needed
        }
    }
}

struct NumValue1: View {
    var displayedValue = 0.0
    var color : Color
    
    var body: some View {
        Text("\(Int(displayedValue * 100 ))%").bold()
            .font(.system(size: 25))
            .foregroundColor(color)
    }
}
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0x00FF00) >> 8) / 255.0
        let blue = Double(hex & 0x0000FF) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}
