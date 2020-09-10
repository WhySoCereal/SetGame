//
//  Array+RemoveIntElement.swift
//  SetGame
//
//  Created by Brian Alldred on 09/09/2020.
//  Copyright © 2020 Brian Alldred. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    mutating func removeElement(withValue removeValue: Element) {
        for i in self.indices {
            if self[i] == removeValue {
                self.remove(at: i)
                return
            }
        }
    }
}
