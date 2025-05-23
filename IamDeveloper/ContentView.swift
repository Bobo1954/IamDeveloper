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
            
            Button("Press Me!") {
                
                let strAwesome = "You Are Awesome!"
                let strGreate = "You Are Greate!"
                let imageZero = "image0"
                let imageOne = "image1"
                
                message = (message == strAwesome ? strGreate : strAwesome)
                imageName = (imageName == imageZero ? imageOne: imageZero)
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
