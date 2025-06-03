//
//  ContentView.swift
//  IamDeveloper
//
//  Created by Mbam3 on 5/19/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var message = ""
    @State private var imageName = ""
    
    //for message rand code
    @State private var current = 0
    @State private var next = -1
    
    //for Image rand code
    //@State private var currentImage = 0
    @State private var nextImage = -1
    
    //@State private var currentSound = 0
    @State private var nextSound = -1
    
    @State private var soundName = ""
    
    @State private var audioPlayer: AVAudioPlayer!
    
    @State private var soundIsOn: Bool = true
    
    var body: some View {
        VStack {
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .frame(height: 100)
                .minimumScaleFactor(0.5)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .shadow(radius: 40)
                .padding(20)
                .animation(.default, value: imageName)
            
            Spacer()
            
            HStack {
                Text("Sound On:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {
                        if audioPlayer != nil {
                            if audioPlayer.isPlaying {
                                audioPlayer.stop()
                            }
                        }
                    }
                Spacer()
                Button("Show Message") {
                    
                    let messArry = ["You Are Awesome!",
                                    "You Are Greate!",
                                    "Fabulous? That's You!",
                                    "You are braver than you believe, stronger than you seem, and smarter than you think.",
                                    "Believe you can and you're halfway there.",
                                    "The future belongs to those who believe in the beauty of their dreams.",
                                    "Your time is limited, don't waste it living someone else's life."]
                    
                    //Message code
                    var next = -1
                    next = nonRepeatingRandom(
                        lastNumber: next,
                        upperBounds: messArry.count - 1
                    )
                    message = messArry[next]
                    
                    //Image code
                    var nextImage = -1
                    nextImage = nonRepeatingRandom(lastNumber: nextImage, upperBounds: Int.random(in: 0...7))
                    imageName = "image\(nextImage)"
                    
                    //Audi code
                    nextSound = nonRepeatingRandom(lastNumber: nextSound, upperBounds: Int.random(in: 0...5))
                    soundName = "sound\(nextSound)"
                    
                    if soundIsOn{
                        playSound(soundName: soundName)
                    }
                }
            }
            .padding()
            .tint(.accentColor)
        }
        .buttonStyle(.borderedProminent)
        .font(.title2)
        
        Spacer()
    }
    
    func playSound(soundName: String){
        if audioPlayer != nil && audioPlayer.isPlaying{
            audioPlayer?.stop()
        }
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😂 Couldn't find the sound file \(soundName)")
            return }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
            audioPlayer.volume = 0.05
            
        } catch  {
            print("😱 Couldn't play the sound file \(soundName)")
        }
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int{
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBounds)
        } while newNumber == lastNumber
        return newNumber
    }
}

#Preview {
    ContentView()
}
#Preview ("Light Mode"){
    ContentView()
        .preferredColorScheme(.light)
}
#Preview ("Dark Mode"){
    ContentView()
        .preferredColorScheme(.dark)
}
