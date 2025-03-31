//
//  SettingItemView.swift
//  System_Defaults_EditorApp
//
//  Created by 1ris_W
//

import SwiftUI

/// Displays a view for each SettingItem
struct SettingItemView: View {

    @State var settingItem: SystemDefaultItem
    @State private var fetchedValue: EditableType? = nil
    @State private var isLoading = true

    var body: some View {
        HStack {
            Text(settingItem.displayName)
                .fontWeight(.bold)

            Spacer()

            Group {
                if isLoading {
                    EditableTypeEditorView(item: $settingItem.defaultValue)
                } else if let value = fetchedValue {
                    EditableTypeEditorView(
                        item: Binding(
                            get: { value },
                            set: {
                                self.fetchedValue = $0
                                settingItem.valueType = $0
                                loadSettingValue()
                            }
                        ))
                } else {
                    Text("No data")
                        .foregroundColor(.gray)
                }
            }
            .frame(width: 150)
            .animation(.easeInOut, value: isLoading)
            .transition(.opacity)

            Button {
                loadSettingValue()
            } label: {
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(.blue)
                    .padding(8)
                    .background(Color.blue.opacity(0.1))
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
        }
        .padding()
        .onAppear {
            loadSettingValue()
        }
    }

    func loadSettingValue() {
        // Asynchronously load data to avoid blocking the main thread
        self.isLoading = true
        DispatchQueue.global(qos: .userInitiated).async {
            // Assume valueType returns an EditableType
            if let result = settingItem.valueType {
                DispatchQueue.main.async {
                    self.fetchedValue = result
                    self.isLoading = false
                }
            } else {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }
}
