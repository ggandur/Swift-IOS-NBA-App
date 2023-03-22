//
//  ContentView.swift
//  MobileApp
//
//  Created by Gabriel Gandur on 16/03/23.
//

import SwiftUI

struct ContentView: View {
    @State var myArrayOfPlayers: [PlayerType] = PlayerData.players
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PlayerContainerView: View {
    var playerName: String
    var playerImage: String

    var body: some View {
        VStack {
            ZStack {
                Color(uiColor: .lightGray)
                    .cornerRadius(12)
                HStack {
                    Image(playerImage)
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                    Text(playerName)
                        .bold()
                        .font(.system(size: 24))
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
                    PlayerContainerView(playerName: player.name, playerImage: player.image)
                }
            }
        }
    }
}

struct PlayerType: Hashable {
    var name: String
    var image: String
}
