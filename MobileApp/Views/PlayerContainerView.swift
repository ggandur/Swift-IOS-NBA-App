//
//  PlayerContainerView.swift
//  MobileApp
//
//  Created by Gabriel Gandur on 24/03/23.
//

import Foundation
import SwiftUI

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
