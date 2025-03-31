//
//  SettingsGroup.swift
//  System_Defaults_EditorApp
//
//  Created by 1ris_W
//

import Foundation
import Luminare
import SwiftUI

// MARK: - SettingsGroup
enum SettingsGroup: LuminareTabItem, CaseIterable {
    var id: String { title }

    case dock
    case screenshots
    case safari
    case finder
    case desktop
    case menuBar
    case mouse
    case trackpad
    case keyboard
    case missionControl
    case feedbackAssistant
    case xcode
    case simulator
    case textEdit
    case timeMachine
    case activityMonitor
    case messages
    case miscellaneous

    var displayName: LocalizedStringKey {
        switch self {
        case .dock: return "Dock"
        case .screenshots: return "Screenshots"
        case .safari: return "Safari"
        case .finder: return "Finder"
        case .desktop: return "Desktop"
        case .menuBar: return "Menu Bar"
        case .mouse: return "Mouse"
        case .trackpad: return "Trackpad"
        case .keyboard: return "Keyboard"
        case .missionControl: return "Mission Control"
        case .feedbackAssistant: return "Feedback Assistant"
        case .xcode: return "Xcode"
        case .simulator: return "Simulator"
        case .textEdit: return "Text Edit"
        case .timeMachine: return "Time Machine"
        case .activityMonitor: return "Activity Monitor"
        case .messages: return "Messages"
        case .miscellaneous: return "Miscellaneous"
        }
    }

    var domain: String {
        switch self {
        case .dock: return "com.apple.dock"
        case .screenshots: return "com.apple.screencapture"
        case .safari: return "com.apple.Safari"
        case .finder: return "com.apple.finder"
        case .desktop: return "com.apple.finder"
        case .menuBar: return "com.apple.menuextra.clock"
        case .mouse: return ""
        case .trackpad: return "com.apple.AppleMultitouchTrackpad"
        case .keyboard: return ""
        case .missionControl: return "com.apple.dock"
        case .feedbackAssistant: return "com.apple.appleseed.FeedbackAssistant"
        case .xcode: return "com.apple.dt.Xcode"
        case .simulator: return "com.apple.iphonesimulator"
        case .textEdit: return "com.apple.TextEdit"
        case .timeMachine: return "com.apple.TimeMachine"
        case .activityMonitor: return "com.apple.ActivityMonitor"
        case .messages: return "com.apple.MobileSMS"
        case .miscellaneous: return ""
        }
    }

    var settings: [SystemDefaultItem] {
        switch self {
        case .dock: return []
        default: return []
        }
    }

    var iconForDisplay: String {
        switch self {
        case .dock: return "dock.rectangle"
        case .screenshots: return "camera"
        case .safari: return "safari"
        case .finder: return "folder"
        case .desktop: return "desktopcomputer"
        case .menuBar: return "menubar.rectangle"
        case .mouse: return "magicmouse"
        case .trackpad: return "rectangle.and.hand.point.up.left.filled"
        case .keyboard: return "keyboard"
        case .missionControl: return "square.grid.3x3"
        case .feedbackAssistant: return "exclamationmark.bubble"
        case .xcode: return "hammer"
        case .simulator: return "iphone"
        case .textEdit: return "text.cursor"
        case .timeMachine: return "clock.arrow.circlepath"
        case .activityMonitor: return "chart.bar"
        case .messages: return "message"
        case .miscellaneous: return "ellipsis.circle"
        }
    }

    var postCommand: String {
        switch self {
        case .dock: return "killall Dock"
        case .screenshots: return "killall SystemUIServer"
        case .safari: return "killall Safari"
        case .finder: return "killall Finder"
        case .desktop: return "killall Finder"
        case .menuBar: return "killall SystemUIServer"
        case .mouse: return ""
        case .trackpad: return ""
        case .keyboard: return ""
        case .missionControl: return "killall Dock"
        case .feedbackAssistant: return ""
        case .xcode: return "killall Xcode"
        case .simulator: return ""
        case .textEdit: return "killall TextEdit"
        case .timeMachine: return ""
        case .activityMonitor: return "killall Activity\\ Monitor"
        case .messages: return "killall Messages"
        case .miscellaneous: return ""
        }
    }

    var title: String {
        switch self {
        case .dock:
            .init(localized: "Settings tab: Dock", defaultValue: "Dock")
        case .screenshots:
            .init(localized: "Settings tab: Screenshots", defaultValue: "Screenshots")
        case .safari:
            .init(localized: "Settings tab: Safari", defaultValue: "Safari")
        case .finder:
            .init(localized: "Settings tab: Finder", defaultValue: "Finder")
        case .desktop:
            .init(localized: "Settings tab: Desktop", defaultValue: "Desktop")
        case .menuBar:
            .init(localized: "Settings tab: Menu Bar", defaultValue: "Menu Bar")
        case .mouse:
            .init(localized: "Settings tab: Mouse", defaultValue: "Mouse")
        case .trackpad:
            .init(localized: "Settings tab: Trackpad", defaultValue: "Trackpad")
        case .keyboard:
            .init(localized: "Settings tab: Keyboard", defaultValue: "Keyboard")
        case .missionControl:
            .init(localized: "Settings tab: Mission Control", defaultValue: "Mission Control")
        case .feedbackAssistant:
            .init(localized: "Settings tab: Feedback Assistant", defaultValue: "Feedback Assistant")
        case .xcode:
            .init(localized: "Settings tab: Xcode", defaultValue: "Xcode")
        case .simulator:
            .init(localized: "Settings tab: Simulator", defaultValue: "Simulator")
        case .textEdit:
            .init(localized: "Settings tab: TextEdit", defaultValue: "TextEdit")
        case .timeMachine:
            .init(localized: "Settings tab: Time Machine", defaultValue: "Time Machine")
        case .activityMonitor:
            .init(localized: "Settings tab: Activity Monitor", defaultValue: "Activity Monitor")
        case .messages:
            .init(localized: "Settings tab: Messages", defaultValue: "Messages")
        case .miscellaneous:
            .init(localized: "Settings tab: Miscellaneous", defaultValue: "Miscellaneous")
        }
    }

    var icon: Image {
        switch self {
        case .dock:
            Image(systemName: "dock.rectangle")
        case .screenshots:
            Image(systemName: "camera")
        case .safari:
            Image(systemName: "safari")
        case .finder:
            Image(systemName: "folder")
        case .desktop:
            Image(systemName: "desktopcomputer")
        case .menuBar:
            Image(systemName: "menubar.rectangle")
        case .mouse:
            Image(systemName: "magicmouse")
        case .trackpad:
            Image(systemName: "rectangle.and.hand.point.up.left.filled")
        case .keyboard:
            Image(systemName: "keyboard")
        case .missionControl:
            Image(systemName: "square.grid.3x3")
        case .feedbackAssistant:
            Image(systemName: "exclamationmark.bubble")
        case .xcode:
            Image(systemName: "hammer")
        case .simulator:
            Image(systemName: "iphone")
        case .textEdit:
            Image(systemName: "text.cursor")
        case .timeMachine:
            Image(systemName: "clock.arrow.circlepath")
        case .activityMonitor:
            Image(systemName: "chart.bar")
        case .messages:
            Image(systemName: "message")
        case .miscellaneous:
            Image(systemName: "ellipsis.circle")
        }
    }

    var showIndicator: Bool {
        switch self {
        default: false
        }
    }
}
