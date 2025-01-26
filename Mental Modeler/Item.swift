//
//  Item.swift
//  Mental Modeler
//
//  Created by Owais Jamil on 1/26/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
