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
            VStack {
                Spacer()
                ForEach(0..<card.number.rawValue) {_ in
                    ZStack {
                        if self.card.shape == .rectangle {
                            Rectangle()
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color(
                                    red: self.card.color.getRGB().r,
                                    green: self.card.color.getRGB().g,
                                    blue: self.card.color.getRGB().b))
                            
                            Rectangle()
                                .foregroundColor(Color(.sRGB,
                                                       red: self.card.color.getRGB().r,
                                                       green: self.card.color.getRGB().g,
                                                       blue: self.card.color.getRGB().b,
                                                       opacity: self.card.shading.rawValue))
                        } else if self.card.shape == .capsule {
                            Capsule()
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color(
                                    red: self.card.color.getRGB().r,
                                    green: self.card.color.getRGB().g,
                                    blue: self.card.color.getRGB().b))
                            
                            Capsule()
                                .foregroundColor(Color(.sRGB,
                                                       red: self.card.color.getRGB().r,
                                                       green: self.card.color.getRGB().g,
                                                       blue: self.card.color.getRGB().b,
                                                       opacity: self.card.shading.rawValue))
                        } else {
                            Diamond()
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color(
                                    red: self.card.color.getRGB().r,
                                    green: self.card.color.getRGB().g,
                                    blue: self.card.color.getRGB().b))
                            Diamond()
                                .foregroundColor(Color(.sRGB,
                                                       red: self.card.color.getRGB().r,
                                                       green: self.card.color.getRGB().g,
                                                       blue: self.card.color.getRGB().b,
                                                       opacity: self.card.shading.rawValue))
                        }
                    }.aspectRatio(2.5, contentMode: .fit)
                    Spacer()
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: SetGameModel.Card(id: 0,
                              SetGameModel.CardNumberOfShapes.one,
                              SetGameModel.CardShading.light,
                              SetGameModel.CardShape.capsule,
                              SetGameModel.CardColor.green))
        .padding(10)
    }
}
