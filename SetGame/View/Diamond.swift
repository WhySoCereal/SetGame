//
//  Diamond.swift
//  SetGame
//
//  Created by Brian Alldred on 07/09/2020.
//  Copyright © 2020 Brian Alldred. All rights reserved.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        let top = CGPoint(x: rect.midX, y: rect.minY)
        let bottom = CGPoint(x: rect.midX, y: rect.maxY)
        let left = CGPoint(x: rect.minX, y: rect.midY)
        let right = CGPoint(x: rect.maxX, y: rect.midY)
        
        var p = Path()
        p.move(to: top)
        p.addLine(to: left)
        p.addLine(to: bottom)
        p.addLine(to: right)
        p.addLine(to: top)
        
        return p
    }
}


struct Diamond_Previews: PreviewProvider {
    static var previews: some View {
        Diamond()
    }
}
