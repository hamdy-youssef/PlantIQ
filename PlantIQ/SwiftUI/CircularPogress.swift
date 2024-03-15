//
//  PircularPogress.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 02/03/2024.
//

import Foundation
import SwiftUI


class TimerManager: ObservableObject {
    @Published var displayedValue = 0.0
    @Published var showvalue = false
    var value = 0.50
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

struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            DashBoardContentView()
                .background(Color.white) // Set the background color of the root view
        }
    }
}


struct DashBoardContentView: View {
    @ObservedObject var tm = TimerManager()
    init() {
        
        // Change the accent color to white
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
    }
    var body: some View {
       
        ZStack{
            Color(.white)
            Circle()
                .stroke(lineWidth: 24)
                .frame(width: 125, height: 125)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
            Circle()
                .stroke(lineWidth: 0.34)
                .frame(width: 100, height: 100)
                .foregroundStyle(LinearGradient(gradient: Gradient (colors:
                                                                        [.black.opacity(0.3),.clear]), startPoint: .bottomTrailing, endPoint:
                        .topLeading))
                .overlay {
                    Circle()
                        .stroke(.black.opacity(0.1),lineWidth: 2)
                        .blur(radius: 5)
                        .mask {
                            Circle()
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors:
                                                                                    [.black, .clear]),
                                                                startPoint: .topLeading,
                                                                endPoint: .bottomTrailing))
                        }
                }
            Circle()
                .trim(from: 0, to:tm.showvalue ? tm.value: 0)
                .stroke(style: StrokeStyle(lineWidth: 24, lineCap: .round) )
                .frame(width: 125, height: 125)
                .rotationEffect(.degrees(-90))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.purple,.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
            NumValue(displayedValue: tm.displayedValue, color: .black)
        }
        .ignoresSafeArea()
        .onTapGesture {
            withAnimation(.spring().speed(0.2 )){
                tm.showvalue.toggle()
                tm.startTimer()
            }
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardContentView()
            .environmentObject(TimerManager())
    }
}

struct NumValue: View {
    var displayedValue = 0.0
    var color : Color
    var body: some View {
        Text("\(Int(displayedValue * 100 ))%").bold()
            .font(.system(size: 25))
            .foregroundColor(color)
    }
}

