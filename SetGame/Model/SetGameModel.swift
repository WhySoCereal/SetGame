//
//  SetGameModel.swift
//  SetGame
//
//  Created by Brian Alldred on 07/09/2020.
//  Copyright © 2020 Brian Alldred. All rights reserved.
//

import Foundation

struct SetGameModel {
    private var deck: [Card]
    private(set) var cards: [Card]
    
    // stores the index of the selected cards
    private var selectedCardIndices: [Int]
    
    // Create a new deck of cards
    init() {
        deck = [Card]()
        cards = [Card]()
        selectedCardIndices = [Int]()
        
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
    

    // Choose at most 3 cards, if a card is already selected, deselect that card,
    // if the card is the 3rd card that was chosen, check if the chosen cards are a valid set
    
    mutating func choose(_ card: Card) {
        if let index = indexInCardArray(id: card.id) {
            if cards[index].isSelected {
                cards[index].isSelected = false
                selectedCardIndices.removeElement(withValue: index)
            } else {
                cards[index].isSelected = true
                selectedCardIndices.append(index)
                
                if selectedCardIndices.count == 3 {
                    if matchFound() {
                        // remove cards from the card array
                        // add three new cards from the deck if available
                        for cardIndex in selectedCardIndices {
                            cards.remove(at: cardIndex)
                            if !deck.isEmpty {
                                print("card inserted")
                                cards.insert(deck.removeLast(), at: cardIndex)
                            }
                        }
                        selectedCardIndices.removeAll(keepingCapacity: true)
 
                    } else {
                        // deselect the cards
                        for index in selectedCardIndices {
                            cards[index].isSelected = false
                        }
                        selectedCardIndices.removeAll(keepingCapacity: true)
                    }
                }
            }
        }
    }
    
    // Check whether the 3 cards selected are a match, if they are then return true,
    // if not a match, return false
    // A 'Set' consists of three cards in which each feature is EITHER the same on each card OR is different on each card.
    private mutating func matchFound() -> Bool {
        // features: shape, shading, numberOfShapes, colour
        // check shape
        
        if !(cards[selectedCardIndices[0]].shape == cards[selectedCardIndices[1]].shape
            && cards[selectedCardIndices[0]].shape == cards[selectedCardIndices[2]].shape ||
            
            cards[selectedCardIndices[0]].shape != cards[selectedCardIndices[1]].shape &&
            cards[selectedCardIndices[1]].shape != cards[selectedCardIndices[2]].shape &&
            cards[selectedCardIndices[0]].shape != cards[selectedCardIndices[2]].shape)
        {
            print("failed shape")
            return false
        }
        
        if !(cards[selectedCardIndices[0]].shading == cards[selectedCardIndices[1]].shading
            && cards[selectedCardIndices[0]].shading == cards[selectedCardIndices[2]].shading ||
            
            cards[selectedCardIndices[0]].shading != cards[selectedCardIndices[1]].shading &&
            cards[selectedCardIndices[1]].shading != cards[selectedCardIndices[2]].shading &&
            cards[selectedCardIndices[0]].shading != cards[selectedCardIndices[2]].shading)
        {
            print("failed shading")
            return false
        }
        
        if !(cards[selectedCardIndices[0]].number == cards[selectedCardIndices[1]].number
            && cards[selectedCardIndices[0]].number == cards[selectedCardIndices[2]].number ||
            
            cards[selectedCardIndices[0]].number != cards[selectedCardIndices[1]].number &&
            cards[selectedCardIndices[1]].number != cards[selectedCardIndices[2]].number &&
            cards[selectedCardIndices[0]].number != cards[selectedCardIndices[2]].number)
        {
            print("failed number")
            return false
        }
        
        
        if !(cards[selectedCardIndices[0]].color == cards[selectedCardIndices[1]].color
            && cards[selectedCardIndices[0]].color == cards[selectedCardIndices[2]].color ||
            
            cards[selectedCardIndices[0]].color != cards[selectedCardIndices[1]].color &&
            cards[selectedCardIndices[1]].color != cards[selectedCardIndices[2]].color &&
            cards[selectedCardIndices[0]].color != cards[selectedCardIndices[2]].color)
        {
            print("failed color")
            return false
        }
        print("match")
        return true
    }
    
    
    private func indexInCardArray(id: Int) -> Int? {
        for i in cards.indices {
            if cards[i].id == id {
                return i
            }
        }
        return nil
    }
        
    // MARK: - Card definition
    
    struct Card: Identifiable {
        var id: Int
        var isSelected: Bool
        
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
            self.isSelected = false
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
                return (0.39, 0.08, 0.55)
            case .green:
                return (0.07, 0.62, 0.19)
            case .blue:
                return (0.83, 0.60, 0.09)
            }
        }
    }
}
