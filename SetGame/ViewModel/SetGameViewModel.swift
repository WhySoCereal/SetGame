//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by Brian Alldred on 08/09/2020.
//  Copyright © 2020 Brian Alldred. All rights reserved.
//

import Foundation

class SetGameViewModel: ObservableObject {
    @Published private var setGameModel: SetGameModel
    
    init() {
        setGameModel = SetGameModel()
    }
    
    // MARK: - Access to the model
    var cards: [SetGameModel.Card] {
        setGameModel.cards
    }
    
    // MARK: - Intents
    func choose(card: SetGameModel.Card) {
        setGameModel.choose(card)
    }
}
