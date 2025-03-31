//
//  EditableTypes.swift
//  System_Defaults_EditorApp
//
//  Created by 1ris_W
//
//  Description: Defines an enum type with properties of different types

import SwiftUI

/// Represents an enum with editable values of different types
enum EditableType {
    /// Boolean value type
    case boolean(BooleanValue)

    /// Floating-point number type
    case decimal(DecimalValue)

    /// String value type
    case text(TextValue)

    /// Integer value type
    case integer(IntegerValue)

    /// Selector type
    case options(OptionsValue)

    /// Retrieves the value object corresponding to the type
    /// - Returns: An instance of an editable value
    func getValueObject() -> any EditableValue {
        switch self {
        case .boolean(let value):
            return value
        case .decimal(let value):
            return value
        case .text(let value):
            return value
        case .integer(let value):
            return value
        case .options(let value):
            return value
        }
    }

    /// Gets the display name of the type
    var displayName: LocalizedStringKey {
        switch self {
        case .boolean: return "Bool"
        case .decimal: return "Decimal"
        case .text: return "String"
        case .integer: return "Integer"
        case .options: return "Selected"
        }
    }

    /// Gets the write key for the type
    var writeKey: String {
        switch self {
        case .boolean: return "-bool"
        case .decimal: return "-float"
        case .text: return "-string"
        case .integer: return "-int"
        case .options: return "-string"
        }
    }

    /// Converts the value to a string representation
    var toString: String {
        switch self {
        case .boolean(let value):
            return value.value ? "true" : "false"
        case .decimal(let value):
            return value.value.description
        case .text(let value):
            return value.value
        case .integer(let value):
            return value.value.description
        case .options(let value):
            return String(value.value)
        }
    }
}
