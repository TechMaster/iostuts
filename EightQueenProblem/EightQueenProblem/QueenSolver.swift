//
//  QueenSolver.swift
//  EightQueenProblem
//
//  Created by Techmaster on 4/4/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import Foundation

struct Position {
    var row: Int
    var col: Int
}


class QueenSolver {
    var size: Int
    init (size: Int) {
        self.size = size
    }
    
    func solveQueen() -> [[Position]] {
        return [[Position]]()
    }
}
