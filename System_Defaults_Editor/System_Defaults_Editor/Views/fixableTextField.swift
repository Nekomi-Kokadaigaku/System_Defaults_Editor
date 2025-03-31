//
//  fixableTextField.swift
//  System_Defaults_Editor
//
//  Created by Iris
//


import Luminare
import SwiftUI

struct fixableTextField: View {
    let horizontalPadding: CGFloat = 8
    let verticalHeight: CGFloat = 34
    var displayName: LocalizedStringKey
    @Binding var text: String

    enum FocusedField {
        case textbox
    }

    @FocusState var focusedField: FocusedField?

    @State var isShowingTextBox = false

    init(_ a: LocalizedStringKey, text: Binding<String>) {
        self.displayName = a
        self._text = text
    }

    var body: some View {

        HStack {
            Text(displayName)

            Spacer()

            HStack {

                if isShowingTextBox {
                    TextField("", text: $text)
                        .textFieldStyle(.plain)
                        .focused($focusedField, equals: .textbox)
                        .onSubmit {
                            withAnimation(LuminareConstants.animation) {
                                isShowingTextBox.toggle()
                            }
                        }
                        .onChange(of: focusedField) { _, newValue in
                            if newValue != .textbox {
                                withAnimation(LuminareConstants.animation) {
                                    isShowingTextBox = false
                                }
                            }
                        }
                        .multilineTextAlignment(.trailing)
                        .labelsHidden()
                        .textFieldStyle(.plain)
                        .padding(.leading, -4)
                } else {
                    Button {
                        withAnimation(.easeOut(duration: 0.1)) {
                            isShowingTextBox.toggle()
                            focusedField = .textbox
                        }
                    } label: {
                        Text(text)
                            .contentTransition(.numericText())
                            .multilineTextAlignment(.trailing)
                            .lineLimit(1)
                            .truncationMode(.middle)
                    }
                    .buttonStyle(.plain)
                }
            }
            .monospaced()
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .padding(.all, isShowingTextBox ? 5 : 0)
            .frame(maxWidth: 150)
            .background {
                ZStack {
                    RoundedRectangle(cornerRadius: isShowingTextBox ? 10 : 20)
                        .strokeBorder(.quaternary, lineWidth: 1)
                    RoundedRectangle(cornerRadius: isShowingTextBox ? 10 : 20)
                        .foregroundStyle(
                            .quinary.opacity(isShowingTextBox ? 1 : 0.5))
                }
            }
            .fixedSize()
        }
        .animation(LuminareConstants.animation, value: isShowingTextBox)
        .animation(LuminareConstants.animation, value: text)
        .padding(.horizontal, horizontalPadding)
        .frame(height: verticalHeight)
    }
}
