//
//  Keyboard.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

// MARK: - Keyboard setting
extension SystemDefaultItem {

    static let keyboardKeyHeldDownBehavior = SystemDefaultItem(
        id: "keyboard_key_held_down_behavior",
        key: "",
        displayName: "Key held down behavior",
        description:
            "Allows you to select the behavior when a key is held down for a long time. The two possible behaviors are:",
        group: .keyboard,
        notDefaultDomain: "NSGlobalDomain ApplePressAndHoldEnabled",
        tipString:
            "Restarting the Mac, closing the session or restarting the application is necessary to take into effect the changes.",
        defaultValue: .boolean(BooleanValue(bool: true))
    )

    static let keyboardFnKeyUsage = SystemDefaultItem(
        id: "keyboard_fn_key_usage",
        key: "AppleFnUsageType",
        displayName: "Fn key usage",
        description: "Allows you to select the behavior when a key is held down for a long time.",
        group: .keyboard,
        notDefaultDomain: "com.apple.HIToolbox",
        tipString:
            "Restarting the Mac, closing the session or restarting the application is necessary to take into effect the changes.",
        defaultValue: .integer(IntegerValue(value: 0, suffix: nil))
    )

    static let keyboardFunctionKeysBehavior = SystemDefaultItem(
        id: "keyboard_function_keys_behavior",
        key: "",
        displayName: "Function keys behavior",
        description: "Allows you to change the behavior of the function keys",
        group: .keyboard,
        notDefaultDomain: "NSGlobalDomain com.apple.keyboard.fnState",
        tipString: "A restart of your Mac is required to apply these changes.",
        defaultValue: .integer(IntegerValue(value: 0, suffix: nil))
    )

    static let keyboardKeyboardNavigation = SystemDefaultItem(
        id: "keyboard_keyboard_navigation",
        key: "AppleKeyboardUIMode",
        displayName: "Keyboard navigation",
        description: "Choose whether to enable moving focus with Tab and Shift Tab.",
        group: .keyboard,
        notDefaultDomain: "NSGlobalDomain",
        defaultValue: .integer(IntegerValue(value: 0, suffix: nil))
    )

    static let keyboardToggleLanguageIndicator = SystemDefaultItem(
        id: "keyboard_toggle_language_indicator",
        key: "TSMLanguageIndicatorEnabled",
        displayName: "Language indicator",
        description: "Turn off the language indicator while switching input sources.",
        group: .keyboard,
        notDefaultDomain: "kCFPreferencesAnyApplication",
        defaultValue: .boolean(BooleanValue(bool: true))
    )
}
