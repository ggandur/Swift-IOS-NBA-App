//
//  ContentView.swift
//  MobileApp
//
//  Created by Gabriel Gandur on 16/03/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State var myArrayOfPlayers: [PlayerType] = []
    var body: some View {
        ZStack {
            VStack {
                Text("NBA Players")
                    .bold()
                    .font(.system(size: 48))
                Text("2022 Season")
                    .bold()
                    .font(.system(size: 24))
                Divider()
                PlayerListView(players: myArrayOfPlayers)
            }
            .onAppear {
                getNbaPlayers { playersJson in
                    if let playersJson = playersJson {
                        myArrayOfPlayers = playersJson
                    } else {
                        print("Erro ao obter informações")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
