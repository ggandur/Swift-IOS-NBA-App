//
//  PlayerListView.swift
//  MobileApp
//
//  Created by Gabriel Gandur on 24/03/23.
//

import Foundation
import SwiftUI

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
