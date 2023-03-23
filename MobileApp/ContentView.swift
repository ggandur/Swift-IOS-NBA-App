//
//  ContentView.swift
//  MobileApp
//
//  Created by Gabriel Gandur on 16/03/23.
//

import Kingfisher
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

struct PlayerContainerView: View {
    var player: PlayerType

    var body: some View {
        VStack {
            ZStack {
                Color(uiColor: .lightGray)
                    .cornerRadius(12)
                HStack {
                    if let playerId = player.personId {
                        let url = "https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/\(playerId).png"
                        
                        AsyncImage(url: URL(string: url)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .padding(EdgeInsets(top: 10, leading: 40, bottom: 0, trailing: 0))
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 70)
                    }
                    if let nomeJogador = player.firstName {
                        if let sobrenomeJogador = player.lastName {
                            Text("\(nomeJogador) \(sobrenomeJogador)")
                                .bold()
                                .font(.system(size: 24))
                                .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                        }
                    }
                    Spacer()
                }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .frame(width: .infinity, height: 64)
    }
}

struct PlayerListView: View {
    var players: [PlayerType]

    var body: some View {
        ScrollView {
            VStack {
                ForEach(players, id: \.self) { player in
                    if let player = player {
                        PlayerContainerView(player: player)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    }
                }
            }
            .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
        }
    }
}
