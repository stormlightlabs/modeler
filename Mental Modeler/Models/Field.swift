//
//  Field.swift
//  Mental Modeler
//
//  Created by Owais Jamil on 1/27/25.
//

import Foundation
import SwiftData

enum FieldType {
    case text(TextConfig)
    case number(NumericConfig)
    case date(DateConfig)
    case select(SelectConfig)
    case boolean
    case image
    case location
}

@Model()
class Field {
    var id: UUID
    var name: String
    var type: FieldType
    var required: Bool
    
    var defaultValue: Any?
    var computedValue: ComputationRule?
    var validation: [ValidationRule] = []
    var metadata: [String: Any]
    
    init(id: UUID, name: String, type: FieldType, required: Bool, defaultValue: Any? = nil, computedValue: ComputationRule? = nil, validation: [ValidationRule], metadata: [String : Any]) {
        self.id = id
        self.name = name
        self.type = type
        self.required = required
        self.defaultValue = defaultValue
        self.computedValue = computedValue
        self.validation = validation
        self.metadata = metadata
    }
}

@Model()
class FieldValue {
    var id: UUID
    var fieldId: UUID
    var value: Any
    var metadata: ValueMetadata?
    
    init(id: UUID, fieldId: UUID, value: Any, metadata: ValueMetadata? = nil) {
        self.id = id
        self.fieldId = fieldId
        self.value = value
        self.metadata = metadata
    }
}

// TODO: TextFormatter
struct TextConfig {
    let maxLength: Int?
    let minLength: Int?
    let allowMultiline: Bool
    let autocorrect: Bool
    let format: StatFormatter?
}

struct DateConfig {
    let mode: DateMode
    let range: Range<Date>?
    let calendar: Calendar
    let includeTime: Bool
}

struct SelectConfig {
    let options: [[String:Bool]]
    let allowMultiple: Bool
    let allowCustom: Bool
    let maxSelections: Int?
}

enum DateMode {
    case date
    case time
    case dateTime
    case duration
}

struct ComputationRule {
    let formula: String
    let dependencies: [UUID]
    let resultType: FieldType
    let compute: ([String: Any]) -> Any?
}

enum ComputingStrategy {
    case immediate
    case onSave
    case manual
    case scheduled(TimeInterval)
}

enum CachingStrategy {
    case none
    case memory(expiresAfter: TimeInterval?)
    case persistent
}



struct ValueMetadata {
    let timestamp: Date
    let computedFrom: [UUID]?
    let validationState: Bool
}

struct ValidationRule {
    let type: ValidationType
    let message: String
    let validate: (Any) -> Bool
}

enum ValidationType {
    case required
    case range(ClosedRange<Double>)
    case regex(String)
    case custom((Any) -> Bool)
    case dependency([String], (Any, [String: Any]) -> Bool)
}
