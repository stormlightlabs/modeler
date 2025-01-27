//
//  Errors.swift
//  Mental Modeler
//
//  Created by Owais Jamil on 1/27/25.
//

enum ValidatorError : Error {
    case invalidValue
}

enum FormattingError : Error {
    case invalidValue
    case outOfBounds
}

enum ParsingError  : Error {
    case invalidFormat
    case outOfBounds
}

enum ComputationError : Error {
    case invalidValue
    case divisionByZero
    case invalidOperation
    case invalidArguments
}
