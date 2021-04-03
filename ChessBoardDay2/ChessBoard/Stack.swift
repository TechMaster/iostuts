//
//  Stack.swift
//  ChessBoard
//
//  Created by Techmaster on 5/30/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import Foundation
struct Stack {
    fileprivate var array: [(row : Int, col : Int)] = []
    
    mutating func push(_ element: (row : Int, col : Int)) {
        array.append(element)
    }
    
    mutating func pop() -> (row : Int, col : Int)? {
        return array.popLast()
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
}
