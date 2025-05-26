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
    @State private var messNumber = 0
    
    var body: some View {
        VStack {
            
            //Spacer()
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .frame(height: 100)
                .minimumScaleFactor(0.5)
                .animation(.easeInOut(duration: 0.15), value: message)
                
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .shadow(radius: 40)
                .padding(20)
                .animation(.default, value: imageNumber)
            
            Spacer()
            
            Button("Show Message") {
                
                let messArry = ["You Are Awesome!", "You Are Greate!", "Fabulous? That's You!", "You are braver than you believe, stronger than you seem, and smarter than you think.","Believe you can and you're halfway there.","The future belongs to those who believe in the beauty of their dreams.", "Your time is limited, don't waste it living someone else's life."]
                
                if messNumber == messArry.count{
                    messNumber = 0
                }
                message = messArry[messNumber]
                messNumber += 1
                
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
