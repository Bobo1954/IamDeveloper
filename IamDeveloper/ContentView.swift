//
//  ContentView.swift
//  IamDeveloper
//
//  Created by Mbam3 on 5/19/25.
//

import SwiftUI

struct ContentView: View {
    @State
    private var message = "I Am A Programmer!"
    
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.red)
            Button("Click Me!") {
                message = "Hello, World!"
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
