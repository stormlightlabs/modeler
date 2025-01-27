//
//  Actions.swift
//  Mental Modeler
//
//  Created by Owais Jamil on 1/27/25.
//
import Foundation
import SwiftData

@Model()
class Action {
    var id: UUID
    var name: String
    var fields: [Field]
    var records: [Record]

    init(id: UUID, name: String, fields: [Field], records: [Record]) {
        self.id = id
        self.name = name
        self.fields = fields
        self.records = records
    }
}

@Model()
class Record {
    var id: UUID
    var date: Date
    var values: [FieldValue]
    init(id: UUID, date: Date, values: [FieldValue]) {
        self.id = id
        self.date = date
        self.values = values
    }
}
