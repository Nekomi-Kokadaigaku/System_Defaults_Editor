//
//  Mouse.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

// MARK: - Mouse setting
extension SystemDefaultItem {

    static let mouseAcceleration = SystemDefaultItem(
        id: "mouse_acceleration",
        key: "",
        displayName: "Mouse acceleration",
        description: "Enable or disable mouse acceleration.",
        group: .mouse,
        notDefaultDomain: "NSGlobalDomain com.apple.mouse.linear",
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let mouseSpeed = SystemDefaultItem(
        id: "mouse_speed",
        key: "",
        displayName: "Mouse speed",
        description: "Set movement speed of the mouse cursor.",
        group: .mouse,
        notDefaultDomain: "NSGlobalDomain com.apple.mouse.scaling",
        tipString: "A restart of your Mac is required to apply these changes.",
        defaultValue: .integer(IntegerValue(value: 1, suffix: nil))
    )

    static let mouseFocusFollowsMouse = SystemDefaultItem(
        id: "mouse_focus_follows_mouse",
        key: "FocusFollowsMouse",
        displayName: "Focus follows mouse",
        description:
            "Focus of the Terminal windows when the mouse cursor hovers over them. The focus change only works between the Terminal windows.",
        group: .mouse,
        notDefaultDomain: "com.apple.Terminal",
        postCommand: "killall Terminal",
        tipString: "A restart of your Mac is required to apply these changes.",
        defaultValue: .boolean(BooleanValue(bool: false))
    )
}
