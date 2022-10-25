//
//  LoadingView.swift
//  LoadingView
//
//  Created by Jacob and Shalise on 10/15/22.
//

import SwiftUI

struct LoadingView: View {
        
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
        @State private var counter = -1
        @State private var isActive = true
        @State private var hasTimeElapsed = false
    
        let row: [GridItem] = Array(repeating: GridItem(.flexible()), count: 5)
    
        
        var body: some View {
            
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                LightsOut()
               
                VStack(alignment: .center) {
                    
                    LazyVGrid(columns: row, alignment: .center) {
                        
                        if hasTimeElapsed {
                            ForEach(0...counter, id: \.self) { circle in
                                ZStack{
                                    Circle()
                                        .foregroundColor(.orange)
                                        .shadow(color: .orange, radius: 5)
                                    Circle()
                                        .scale(0.95)
                                        .foregroundColor(.red)
                                        .shadow(color: .red, radius: 15)
                                        .opacity(0.9)
                                }
                            }
                        }
                    }
                    .padding()
                    
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.hasTimeElapsed = true
                        }
                    }
                        .onReceive(timer) { time in
                            guard isActive else { return }
                            if counter < 4 {
                                counter += 1
                            }
                        }
                    
                    Spacer()
                }.padding()
                
                
            }
               
        }
        
    }


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
