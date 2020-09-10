//
//  SetGameView.swift
//  SetGame
//
//  Created by Brian Alldred on 05/09/2020.
//  Copyright © 2020 Brian Alldred. All rights reserved.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var setGameVM: SetGameViewModel
    
    var body: some View {
        // Grid of 12 cards to play the game with
        Grid(setGameVM.cards) { card in
            CardView(card: card)
                .padding(self.cardPadding)
                .onTapGesture {
                    self.setGameVM.choose(card: card)
            }
        }
    }
    
    let cardPadding: CGFloat = 10
}

struct SetGameView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(setGameVM: SetGameViewModel())
    }
}
