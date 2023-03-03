//
//  ContentView.swift
//  War Card Game
//
//  Created by Monika Šličiūtė on 03/03/2023.
//

import SwiftUI

struct ContentView: View {
    // set the displayed cards to card back
   @State var playerCard = "back"
   @State var cpuCard = "back"
    
    // set the scores to 0
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack{
            // green background covers whole phone area
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            // all UI elements
            VStack{
                Spacer()
                // game logo
                Image("logo")
                Spacer()
                
                // card images
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                // deal button
                Button{
                    deal()
                }label: {
                    Image("button")
                }
                Spacer()
                
                // player and cpu scores with labels
                HStack{
                    Spacer()
                    // player score and label
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    // cpu score and label
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }.foregroundColor(.white)
                Spacer()
            }
        }
    }
    func deal() {
        // randomise player's card
        var playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        // randomise cpu's card
        var cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        // update the scores
        if playerCardValue > cpuCardValue {
            playerScore += 1
        }else if cpuCardValue > playerCardValue{
            cpuScore += 1
        } else {
            // it's a draw
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
