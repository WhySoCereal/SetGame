//
//  SetGameModel.swift
//  SetGame
//
//  Created by Brian Alldred on 07/09/2020.
//  Copyright © 2020 Brian Alldred. All rights reserved.
//

import Foundation

struct SetGameModel {
    private(set) var deck: Array<Card>
    private(set) var cards: Array<Card>
    
    // Create a new deck of cards
    init() {
        deck = [Card]()
        cards = [Card]()
        
        var index = 0
        for number in CardNumberOfShapes.allCases {
            for shape in CardShape.allCases {
                for shading in CardShading.allCases {
                    for color in CardColor.allCases {
                        deck.append(Card(id: index, number, shading, shape, color))
                        index += 1
                    }
                }
            }
        }
        
        deck.shuffle()
        
        for _ in 0..<12 {
            cards.append(deck.removeLast())
        }
    }
    
    // MARK: - Card definition
    
    struct Card: Identifiable {
        var id: Int
        
        let number: CardNumberOfShapes
        let shading: CardShading
        let shape: CardShape
        let color: CardColor
        
        init(id: Int, _ number: CardNumberOfShapes, _ shading: CardShading, _ shape: CardShape, _ color: CardColor) {
            self.id = id
            self.number = number
            self.shading = shading
            self.shape = shape
            self.color = color
        }
    }

    enum CardNumberOfShapes: Int, CaseIterable {
        case one = 1, two = 2, three = 3
    }

    enum CardShading: Double, CaseIterable {
        case none = 0, light = 0.25, full = 1
    }

    enum CardShape: CaseIterable {
        case diamond, capsule, rectangle
    }

    enum CardColor: CaseIterable {
        case red, green, blue
        
        func getRGB() -> (r: Double, g: Double, b: Double) {
            switch self {
            case .red:
                return (0.60, 0.00, 0.10)
            case .green:
                return (0.23, 0.70, 0.00)
            case .blue:
                return (0.00, 0.00, 0.70)
            }
        }
    }
    
    
}
