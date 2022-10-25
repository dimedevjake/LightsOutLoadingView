//
//  LightsOut.swift
//  LoadingView
//
//  Created by Jacob and Shalise on 10/15/22.
//

import SwiftUI

struct LightsOut: View {
    
    let row: [GridItem] = Array(repeating: GridItem(.flexible()), count: 5)
    
    var body: some View {
        VStack(alignment: .center) {
            LazyVGrid(columns: row, alignment: .center) {
            
                ForEach(0..<row.count, id: \.self) { circle in
                                    Circle()
                                        .foregroundColor(.primary)
                                        .shadow(radius: 3)
                                        .overlay(Circle()
                                        .strokeBorder(.secondary, lineWidth: 2).opacity(0.6))
                                }
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 15) 
            .strokeBorder(.secondary, lineWidth: 2).opacity(0.6))
            .shadow(radius: 3)
          
            Spacer()
        }.padding()

            
    }
}

struct LightsOut_Previews: PreviewProvider {
    static var previews: some View {
        LightsOut()
    }
}
