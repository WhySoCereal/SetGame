//
//  CardView.swift
//  SetGame
//
//  Created by Brian Alldred on 07/09/2020.
//  Copyright © 2020 Brian Alldred. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var card : SetGameModel.Card
    
    var body: some View {
        GeometryReader { (geometry) in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
            
            // AnyTransition.offset(CGSize)

            if card.isSelected {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
            } else {
                RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
            }
            
            CardContents(card: self.card)
        }
    }
    
    let shapePadding: CGFloat = 20
    let shapeAspectRatio: CGFloat = 2.5
    let shapeLineWidth: CGFloat = 3
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: SetGameModel.Card(id: 0,
                              SetGameModel.CardNumberOfShapes.three,
                              SetGameModel.CardShading.light,
                              SetGameModel.CardShape.rectangle,
                              SetGameModel.CardColor.green))
    }
}
