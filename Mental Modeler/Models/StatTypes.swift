//
//  StatTypes.swift
//  Mental Modeler
//
//  Created by Owais Jamil on 1/27/25.
//

enum StatType {
    case numeric(NumericConfig)
    case counter
    case percentage
    case duration

    case scale(ScaleConfig)
    case range(RangeConfig)

    case multiValue(MultiValueConfig)
    case categorical(CategoricalConfig)
    case checklist(ChecklistConfig)

    case composite([StatType])
    case custom(CustomConfig)
}

struct NumericConfig {
    let unit: String?
    let format: NumberFormat
    let bounds: ClosedRange<Double>?
    let step: Double?
}

struct ScaleConfig {
    let range: ClosedRange<Int>
    let labels: [Int: String]?
    let increment: Int
}

struct RangeConfig {
    let upperBound: NumericConfig
    let lowerBound: NumericConfig
    let allowOverlap: Bool
}

protocol StatValidator {
    func validate(_ value: Double) throws -> Bool
}

protocol StatFormatter {
    mutating func format(_ value: Double) -> String
}

protocol StatParser {
    func format(_ input: String) throws -> Double
    mutating func parse(_ input: String) throws -> Double
}

struct MultiValueConfig {
    let fields: [Field]
    let required: [String]
    let computed: [String: ComputationRule]?
}

struct CategoricalConfig {
    let options: [String]
    let allowMultiple: Bool
    let customEnabled: Bool
}

struct ChecklistConfig {
    let items: [String]
    let minimumRequired: Int?
    let maximumAllowed: Int?
}

struct CustomConfig {
    let validator: StatValidator
    let formatter: StatFormatter
    let parser: StatParser
}

enum NumberFormat {
    case decimal(places: Int)
    case integer
    case scientific
    case percentage
    case currency(code: String)
}
