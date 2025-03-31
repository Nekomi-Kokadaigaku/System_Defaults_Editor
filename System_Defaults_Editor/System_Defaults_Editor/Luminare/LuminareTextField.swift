//
//  LuminareTextField.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

import Luminare
import SwiftUI

public struct LuminareTextField1<F>: View
where F: ParseableFormatStyle, F.FormatOutput == String {
    let elementMinHeight: CGFloat = 34
    let horizontalPadding: CGFloat = 8

    @State var isShowingTextBox = false

    @Binding var value: F.FormatInput?
    var format: F
    let placeholder: LocalizedStringKey
    let onSubmit: (() -> Void)?

    @State var monitor: Any?

    public init(
        _ placeholder: LocalizedStringKey, value: Binding<F.FormatInput?>,
        format: F, onSubmit: (() -> Void)? = nil
    ) {
        self._value = value
        self.format = format
        self.placeholder = placeholder
        self.onSubmit = onSubmit
    }

    public init(
        _ placeholder: LocalizedStringKey, text: Binding<String>,
        onSubmit: (() -> Void)? = nil
    ) where F == StringFormatStyle {
        self.init(
            placeholder, value: .init(text), format: StringFormatStyle(),
            onSubmit: onSubmit)
    }

    public var body: some View {
        TextField(placeholder, value: $value, format: format)
            .padding(.horizontal, horizontalPadding)
            .fixedSize()
            .clipShape(.capsule)
            .frame(minHeight: elementMinHeight)
            .textFieldStyle(.plain)
            .background {
                ZStack {
                    Capsule()
                        .strokeBorder(.quaternary, lineWidth: 1)

                    if isShowingTextBox {
                        Capsule()
                            .foregroundStyle(.quinary)
                    } else {
                        Capsule()
                            .foregroundStyle(.quinary.opacity(0.5))
                    }
                }
            }
            .onSubmit {
                if let onSubmit {
                    onSubmit()
                }
            }
            .onAppear {
                guard monitor != nil else { return }

                monitor = NSEvent.addLocalMonitorForEvents(matching: .keyDown) {
                    event in
                    if let window = NSApp.keyWindow,
                        window.animationBehavior == .documentWindow
                    {
                        window.keyDown(with: event)

                        // Fixes cmd+w to close window.
                        let wKey = 13
                        if event.keyCode == wKey,
                            event.modifierFlags.contains(.command)
                        {
                            return nil
                        }
                    }
                    return event
                }
            }
            .onDisappear {
                if let monitor {
                    NSEvent.removeMonitor(monitor)
                }
                monitor = nil
            }
    }
}

public struct StringFormatStyle: Codable, Equatable, Hashable,
    ParseableFormatStyle
{
    public var parseStrategy: Strategy = .identity

    public typealias FormatInput = String
    public typealias FormatOutput = String

    public enum Strategy: Codable, Equatable, Hashable, ParseStrategy {
        public typealias ParseInput = String
        public typealias ParseOutput = String

        case identity
        case hex(HexStrategy)

        public func parse(_ value: String) throws -> String {
            switch self {
            case .identity:
                value
            case let .hex(strategy):
                try strategy.parse(value)
            }
        }
    }

    public enum HexStrategy: Codable, Equatable, Hashable, ParseStrategy {
        public typealias ParseInput = String
        public typealias ParseOutput = String

        /// `#42ab0E` -> `42ab0e`
        case lowercased

        /// `#42ab0E` -> `42AB0E`
        case uppercased

        /// `42ab0E` -> `#42ab0e`
        case lowercasedWithWell

        /// `42ab0E` -> `#42AB0E`
        case uppercasedWithWell

        public func parse(_ value: String) throws -> String {
            switch self {
            case .lowercased:
                value.lowercased()
                    .replacing(#/[^a-f0-9]/#, with: "")
            case .uppercased:
                value.uppercased()
                    .replacing(#/[^A-F0-9]/#, with: "")
            case .lowercasedWithWell:
                try "#" + Self.lowercased.parse(value)
            case .uppercasedWithWell:
                try "#" + Self.uppercased.parse(value)
            }
        }
    }

    public func format(_ value: String) -> String {
        do {
            return try parseStrategy.parse(value)
        } catch {
            print("Error: \(error)")
            return value
        }
    }
}
