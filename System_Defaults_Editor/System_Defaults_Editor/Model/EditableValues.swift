//
//  EditableValues.swift
//  System_Defaults_EditorApp
//
//  Created by 1ris_W
//

import SwiftUI

/// Editable value for boolean types
struct BooleanValue: EditableValue {
    /// Stored boolean value
    var value: Bool

    /// Initializes a boolean value
    /// - Parameter value: Initial value, default is false
    init(bool value: Bool = false) {
        self.value = value
    }

    init(str value: String?) {
        if let a = value,
            a.isNotEmpty,
            a == "1" || a == "true"
        {
            self.value = true
        } else {
            self.value = false
        }
    }

    /// Creates a toggle view for editing the boolean value
    /// - Parameter value: Binding to the boolean value
    /// - Returns: A toggle view
    func makeEditView(value: Binding<Bool>) -> some View {
        Toggle("", isOn: value)
            .padding(.horizontal, 12)
            .toggleStyle(.switch)
            .scaleEffect(0.8)
    }
}

/// Editable value for floating-point numbers
struct DecimalValue: EditableValue {
    /// Stored floating-point value
    var value: Float
    var suffix: LocalizedStringKey?
    var range: ClosedRange<Double>

    /// Initializes a floating-point value
    /// - Parameter value: Initial value, default is 0.0
    init(value: Float = 0.0, _ range: ClosedRange<Double> = 0...10, suffix: LocalizedStringKey?) {
        self.value = value
        self.range = range
        self.suffix = suffix
    }

    init(fromString: String?, _ range: ClosedRange<Double> = 0...10, suffix: LocalizedStringKey?) {
        if let a = fromString, !a.isEmpty {
            self.value = Float(a) ?? 0.0
        } else {
            self.value = 0.0
        }
        self.range = range
        self.suffix = suffix
    }

    /// Creates a slider view for editing the floating-point value
    /// - Parameter value: Binding to the floating-point value
    /// - Returns: A combined view of a slider and value display
    func makeEditView(value: Binding<Float>) -> some View {
        HStack(spacing: 12) {
            Slider(
                value: Binding(
                    get: { Double(value.wrappedValue) },
                    set: { value.wrappedValue = Float($0) }
                ), in: self.range)

            Text("\(value.wrappedValue, specifier: "%.1f")")
                .font(.system(.caption, design: .rounded))
                .foregroundColor(.secondary)
                .frame(minWidth: 40)
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(4)
        }
        .padding(.horizontal, 12)
    }
}

/// Editable value for string types
struct TextValue: EditableValue {
    /// Stored string value
    var value: String

    /// Initializes a string value
    /// - Parameter value: Initial value, default is an empty string
    init(value: String?) {
        self.value = value ?? ""
    }

    /// Creates a text field view for editing the string value
    /// - Parameter value: Binding to the string value
    /// - Returns: A text field view
    func makeEditView(value: Binding<String>) -> some View {
        TextField("Input text", text: value)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(.system(.body))
            .padding(.horizontal, 12)
    }
}

/// Editable value for integer types
struct IntegerValue: EditableValue {

    /// Stored integer value
    var value: Int

    ///
    var suffix: LocalizedStringKey?

    /// Initializes an integer value
    /// - Parameter value: Initial value, default is 0
    public init(value: Int = 0, suffix: LocalizedStringKey?) {
        self.value = value
        self.suffix = suffix
    }

    public init(str: String?, suffix: LocalizedStringKey?) {
        self.value = Int(str ?? "0") ?? 0
        self.suffix = suffix
    }

    /// Creates a stepper view for editing the integer value
    /// - Parameter value: Binding to the integer value
    /// - Returns: A stepper view
    func makeEditView(value: Binding<Int>) -> some View {
        HStack {
            Stepper("", value: value)
                .labelsHidden()

            Text("\(value.wrappedValue)")
                .font(.system(.body, design: .rounded))
                .frame(minWidth: 40)
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(4)
        }
        .padding(.horizontal, 12)
    }
}

/// Editable value for selector types
struct OptionsValue: EditableValue {
    /// Stored list of options
    var options: [String]

    /// Currently selected option index
    var value: Int

    /// Initializes a selector type
    /// - Parameters:
    ///   - options: List of options
    ///   - selectedIndex: Initial selected index, default is 0
    init(options: [String], selectedIndex: Int = 0) {
        self.options = options
        self.value = min(max(0, selectedIndex), options.isEmpty ? 0 : options.count - 1)
    }

    init(options: [String], selectedOption: String) {
        self.options = options
        self.value = options.firstIndex(of: selectedOption) ?? 0
    }

    /// Creates a picker view for editing the selected option
    /// - Parameter value: Binding to the selected index
    /// - Returns: A picker view
    func makeEditView(value: Binding<Int>) -> some View {
        Picker("", selection: value) {
            ForEach(0..<options.count, id: \.self) { index in
                Text(options[index])
                    .tag(index)
                    .font(.system(.body))
            }
        }
        .pickerStyle(.menu)
        .padding(.horizontal, 12)
    }

    /// Gets the currently selected option text
    var selectedOption: String {
        guard !options.isEmpty, value >= 0, value < options.count else { return "" }
        return options[value]
    }

    mutating func changeValue(a: Int) {
        self.value = a
    }
}
