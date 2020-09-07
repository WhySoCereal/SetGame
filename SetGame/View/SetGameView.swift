//
//  SetGameView.swift
//  SetGame
//
//  Created by Brian Alldred on 05/09/2020.
//  Copyright © 2020 Brian Alldred. All rights reserved.
//

import SwiftUI

struct SetGameView: View {
    var deck = SetGameModel()
    
    var body: some View {
        Grid(deck.cards) { card in
            CardView(card: card)
                .aspectRatio(2/3, contentMode: .fit)
                .padding(5)
        }
    }
}

struct SetGameView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView()
    }
}
