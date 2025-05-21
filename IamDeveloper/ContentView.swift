//
//  ContentView.swift
//  IamDeveloper
//
//  Created by Mbam3 on 5/19/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message = ""
    @State private var image = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundStyle(.black)
            
            Spacer()
            
            Button("Press Me!") {
                
                let strAwesome = "You Are Awesome!"
                let strGreate = "You Are Greate!"
                let imageSun = "sun.max.fill"
                let imageThumbsUp = "hand.thumbsup"
                
                if message == strAwesome {
                    image = imageThumbsUp
                    message = strGreate
                } else {
                    image = imageSun
                    message = strAwesome
                }
            }
        }
        .buttonStyle(.borderedProminent)
        .font(.title2)
        .tint(.orange)
        
        Spacer()
    }
}

#Preview {
    ContentView()
}
