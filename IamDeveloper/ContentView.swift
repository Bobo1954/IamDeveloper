//
//  ContentView.swift
//  IamDeveloper
//
//  Created by Mbam3 on 5/19/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .shadow(radius: 40)
                .padding(20)
                
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            
            Spacer()
            
            Button("Show Message") {
                
                let strAwesome = "You Are Awesome!"
                let strGreate = "You Are Greate!"
                //let imageZero = "image0"
                //let imageOne = "image1"
                
                message = (message == strAwesome ? strGreate : strAwesome)
                if imageNumber == 8 {
                    imageNumber = 0
                }
                imageName = "image\(imageNumber)"
                imageNumber += 1
            }
        }
        .buttonStyle(.borderedProminent)
        .font(.title2)
        
        Spacer()
    }
}

#Preview {
    ContentView()
}
