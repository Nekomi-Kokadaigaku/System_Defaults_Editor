//
//  LuminareSettingItemView.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

import Luminare
import SwiftUI

struct LuminareSettingItemView: View {

    @State var settingItem: SystemDefaultItem

    @State private var fetchedValue: EditableType? = nil
    @State private var isLoading = true
    @State private var needsSync = false
    @State private var needSyncImmediately = false
    @State private var timer: Timer? = nil

    var body: some View {
        renderSettingControl()
            .onAppear {
                loadSettingValue()
                // 创建一个5秒的定时器
                timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
                #if DEBUG
                    print("定时同步信息")
                #endif
                    if needsSync {
                        syncValueToSystem()
                        loadSettingValue()
                    }
                }
            }
            .onDisappear {
                if needsSync {                
                    syncValueToSystem()
                }
                timer?.invalidate()
                timer = nil
            }
    }

    @ViewBuilder
    private func renderSettingControl() -> some View {
        let valueToUse = fetchedValue ?? settingItem.defaultValue

        switch valueToUse {
        case .boolean(var boolValue):
            LuminareToggle(
                settingItem.displayName,
                info: .init(settingItem.description),
                isOn: Binding(
                    get: { boolValue.value },
                    set: { newValue in
                        boolValue.value = newValue
                        needSyncImmediately = true
                        updateValue(.boolean(boolValue))
                    }
                )
            )

        case .integer(let integerValue):
            LuminareValueAdjuster(
                settingItem.displayName,
                info: .init(settingItem.description),
                value: Binding(
                    get: {
                        Double(integerValue.value)
                    },
                    set: {
                        let newIntegerValue = IntegerValue(
                            value: Int($0),
                            suffix: integerValue.suffix
                        )
                        updateValue(.integer(newIntegerValue))
                    }
                ),
                sliderRange: 10...200,
                suffix: integerValue.suffix,
                lowerClamp: true,
                upperClamp: true
            )

        case .decimal(let decimalValue):
            LuminareValueAdjuster(
                settingItem.displayName,
                info: .init(settingItem.description),
                value: Binding(
                    get: {
                        Double(decimalValue.value)
                    },
                    set: {
                        let newDecimalValue = DecimalValue(
                            value: Float($0),
                            decimalValue.range,
                            suffix: decimalValue.suffix
                        )
                        updateValue(.decimal(newDecimalValue))
                    }
                ),
                sliderRange: decimalValue.range,
                suffix: decimalValue.suffix,
                step: 0.1,
                lowerClamp: true,
                decimalPlaces: 1
            )

        case .options(let optionsValue):
            LuminareSliderPicker(
                settingItem.displayName,
                optionsValue.options,
                selection: Binding(
                    get: { optionsValue.selectedOption },
                    set: { newSelection in
                        let newIndex =
                            optionsValue.options.firstIndex(of: newSelection)
                            ?? 0
                        let newOptionsValue = OptionsValue(
                            options: optionsValue.options,
                            selectedIndex: newIndex
                        )
                        needSyncImmediately = true
                        updateValue(.options(newOptionsValue))
                    }
                )
            ) { _ in
                LocalizedStringKey(optionsValue.selectedOption)
            }

        case .text(let textValue):
            fixableTextField(
                settingItem.displayName,
                text: Binding(
                    get: { textValue.value },
                    set: { newValue in
                        let newTextValue = TextValue(value: newValue)
                        needsSync = true
                        updateValue(.text(newTextValue))
                    }
                )
            )
        }
    }

    private func updateValue(_ newValue: EditableType) {
        fetchedValue = newValue
        needsSync = true
        if needSyncImmediately {
            syncValueToSystem()
        }
    }

    private func syncValueToSystem() {
        guard let value = fetchedValue else { return }

        // Once set the settingItem value will excute the `defaults write command` and change system value
        settingItem.valueType = value
        needsSync = false
        needSyncImmediately = false

        loadSettingValue()
    }

    private func loadSettingValue() {

        isLoading = true
        
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
        // Task {
        //     let task = await Task.detached(priority: .userInitiated) {
        //         return await settingItem.valueType
        //     }
        //     let result = await task.value

        //     await MainActor.run {
        //         self.fetchedValue = result
        //         self.isLoading = false
        //     }
        // }
    }
}
