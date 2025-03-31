//
//  EditableValueProtocol.swift
//  System_Defaults_EditorApp
//
//  Created by 1ris_W
//

import SwiftUI

/// Protocol for editable values, defining editing behavior for different value types
protocol EditableValue {
    /// Associated value type
    associatedtype ValueType

    /// Associated edit view type
    associatedtype EditView: View

    /// The actual stored value
    var value: ValueType { get set }

    /// Creates a SwiftUI view for editing the value
    /// - Parameter value: A binding to the value
    /// - Returns: The edit view
    func makeEditView(value: Binding<ValueType>) -> EditView
}
