//
//  Menu Bar.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

// MARK: - Menu Bar setting
extension SystemDefaultItem {

    static let menuBarFlashClockTimeSeparators = SystemDefaultItem(
        id: "menu_bar_flash_clock_time_separators",
        key: "FlashDateSeparators",
        displayName: "Clock separators",
        description:
            "When enabled, the clock indicator (which by default is the colon) will flash on and off each second.",
        group: .menuBar,
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let menuBarDigitalClockFormat = SystemDefaultItem(
        id: "menu_bar_digital_clock_format",
        key: "DateFormat",
        displayName: "Time and date format",
        description:
            "This setting configures the time and date format for the Menu Bar digital clock. Accepted values depend on your Language & Region settings.",
        group: .menuBar,
        defaultValue: .text(TextValue(value: "EEE d MMM HH:mm:ss"))
    )
}
