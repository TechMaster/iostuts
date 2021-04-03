//
//  TileDelegate.swift
//  MemoryGame
//
//  Created by Techmaster on 3/24/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import Foundation

protocol TileDelegate : class {
    func onTileFlip (tile: Tile)
}
