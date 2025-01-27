//
//  Stats.swift
//  Mental Modeler
//
//  Created by Owais Jamil on 1/27/25.
//

import Foundation
import SwiftData
 

@Model()
class Stats {
    var id: UUID
    var name: String
    var type: StatType
    var unit: String?
    var actions: [Action] = []
    var records: [Record] = []
    
    init(id: UUID, name: String, type: StatType, unit: String? = nil, actions: [Action], records: [Record]) {
        self.id = id
        self.name = name
        self.type = type
        self.unit = unit
        self.actions = actions
        self.records = records
    }
}
