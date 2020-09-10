//
//  CardContents.swift
//  SetGame
//
//  Created by Brian Alldred on 10/09/2020.
//  Copyright © 2020 Brian Alldred. All rights reserved.
//

import SwiftUI

struct CardContents: View {
    var card : SetGameModel.Card
    
    var body: some View {
        VStack {
            Spacer()
            ForEach(0..<card.number.rawValue) { _ in
                ZStack {
                // Shape outline
                Group {
                    if self.card.shape == .rectangle {
                        Rectangle()
                            .stroke(lineWidth: self.shapeLineWidth)
                    } else if self.card.shape == .capsule {
                        Capsule()
                            .stroke(lineWidth: self.shapeLineWidth)
                    } else {
                        Diamond()
                            .stroke(lineWidth: self.shapeLineWidth)
                    }
                }
                .foregroundColor(Color(
                    red: self.card.color.getRGB().r,
                    green: self.card.color.getRGB().g,
                    blue: self.card.color.getRGB().b))

                // Shape fill
                Group {
                    if self.card.shape == .rectangle {
                        Rectangle()
                    } else if self.card.shape == .capsule {
                        Capsule()
                    } else {
                        Diamond()
                    }
                }
                .foregroundColor(Color(.sRGB,
                                       red: self.card.color.getRGB().r,
                                       green: self.card.color.getRGB().g,
                                       blue: self.card.color.getRGB().b,
                                       opacity: self.card.shading.rawValue))
                }
            }
            .aspectRatio(self.shapeAspectRatio, contentMode: .fit)
            .padding([.trailing, .leading], self.shapePadding)
            
            Spacer()
        }
    }
    
    let shapePadding: CGFloat = 20
    let shapeAspectRatio: CGFloat = 2.5
    let shapeLineWidth: CGFloat = 3
}



struct CardContents_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: SetGameModel.Card(id: 0,
                      SetGameModel.CardNumberOfShapes.three,
                      SetGameModel.CardShading.light,
                      SetGameModel.CardShape.rectangle,
                      SetGameModel.CardColor.green))
    }
}
