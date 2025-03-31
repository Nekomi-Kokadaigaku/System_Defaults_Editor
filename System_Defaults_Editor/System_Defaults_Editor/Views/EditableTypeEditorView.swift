//
//  EditableTypeEditorView.swift
//  System_Defaults_EditorApp
//
//  Created by 1ris_W
//
//  Description: Automatically generates the corresponding editing view based on the type

import SwiftUI

/// Dynamically generates an editing view based on the EditableType type
struct EditableTypeEditorView: View {

    /// Bound to the EditableType instance being edited
    @Binding var item: EditableType

    var body: some View {
        HStack {
            switch item {
            case .boolean(var boolValue):
                boolValue.makeEditView(
                    value: Binding(
                        get: { boolValue.value },
                        set: {
                            boolValue.value = $0
                            item = .boolean(boolValue)
                        }
                    ))
            case .decimal(var decimalValue):
                decimalValue.makeEditView(
                    value: Binding(
                        get: { decimalValue.value },
                        set: {
                            decimalValue.value = $0
                            item = .decimal(decimalValue)
                        }
                    ))
            case .text(var textValue):
                textValue.makeEditView(
                    value: Binding(
                        get: { textValue.value },
                        set: {
                            textValue.value = $0
                            item = .text(textValue)
                        }
                    ))
            case .integer(var intValue):
                intValue.makeEditView(
                    value: Binding(
                        get: { intValue.value },
                        set: {
                            intValue.value = $0
                            item = .integer(intValue)
                        }
                    ))
            case .options(var optionsValue):
                optionsValue.makeEditView(
                    value: Binding(
                        get: { optionsValue.value },
                        set: {
                            optionsValue.value = $0
                            item = .options(optionsValue)
                        }
                    ))
            }
        }
    }
}
