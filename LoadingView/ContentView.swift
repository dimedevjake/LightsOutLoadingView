//
//  ContentView.swift
//  LoadingView
//
//  Created by Jacob and Shalise on 10/1/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoading = false
    @State var hasEnded = false

    
    var body: some View {
        ZStack {
            
            
            if hasEnded {
                ZStack {
                    Color(.red)
                        .ignoresSafeArea()
                    
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.gray)
                        .opacity(0.1)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .strokeBorder(.secondary, lineWidth: 5).opacity(0.6))
                        .opacity(0.5)
                        .padding()
                        
                    VStack{
                        RoundedRectangle(cornerRadius: 15)
                            .padding()
                        RoundedRectangle(cornerRadius: 15)
                            .padding()
                        RoundedRectangle(cornerRadius: 15)
                            .padding()
                        RoundedRectangle(cornerRadius: 15)
                            .padding()
                    }.foregroundColor(.gray)
                        .opacity(0.4).overlay(RoundedRectangle(cornerRadius: 15)
                            .strokeBorder(.secondary, lineWidth: 2).opacity(0.6))
                        .padding()
                }
            } else{
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                LightsOut()

                
                
                if isLoading {
                    
                    LoadingView()
                        
                    
                }
            }
            
           
           
        }
        .onAppear { startSignal() }
    }
    
    func startSignal() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            isLoading = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            hasEnded = true
        }
    }
   
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


