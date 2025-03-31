//
//  Miscellaneous.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

// MARK: - Miscellaneous setting
extension SystemDefaultItem {

    static let miscellaneousToggleAppleIntelligence = SystemDefaultItem(
        id: "miscellaneous_toggle_apple_intelligence",
        key: "545129924",
        displayName: "Apple Intelligence",
        description: "Toggle Apple Intelligence.",
        group: .miscellaneous,
        notDefaultDomain: "com.apple.CloudSubscriptionFeatures.optIn",
        defaultValue: .boolean(BooleanValue(bool: true))
    )

    static let miscellaneousHelpMenuPosition = SystemDefaultItem(
        id: "miscellaneous_help_menu_position",
        key: "DevMode",
        displayName: "Help menu position",
        description: "Choose whether the Help Menu should be always-on-top.",
        group: .miscellaneous,
        notDefaultDomain: "com.apple.helpviewer",
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let miscellaneousSpringLoadingForAllDock = SystemDefaultItem(
        id: "miscellaneous_spring_loading_for_all_dock",
        key: "enable-spring-load-actions-on-all-items",
        displayName: "Spring loading for all Dock",
        description:
            "Drag a file over an icon in the Dock, hover, and the application will open. The behaviour is unchanged if the app is already open. This behaviour has been observed with Preview, Quicktime, and iWork (Keynote, Pages, Numbers).",
        group: .miscellaneous,
        notDefaultDomain: "com.apple.dock",
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let miscellaneousShowMusicSoneNotifications = SystemDefaultItem(
        id: "miscellaneous_show_music_sone_notifications",
        key: "userWantsPlaybackNotifications",
        displayName: "Music notifications",
        description: "Show notifications for songs that are playing in the Music app.",
        group: .miscellaneous,
        notDefaultDomain: "com.apple.Music",
        defaultValue: .boolean(BooleanValue(bool: true))
    )

    static let miscellaneousDisableApplicationQuarantine = SystemDefaultItem(
        id: "miscellaneous_disable_application_quarantine",
        key: "LSQuarantine",
        displayName: "Application quarantine",
        description: "Turn off the “Application Downloaded from Internet” quarantine warning.",
        group: .miscellaneous,
        notDefaultDomain: "com.apple.LaunchServices",
        tipString: " Stopped working on Big Sur.",
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let miscellaneousCloseConfirmChangesPopup = SystemDefaultItem(
        id: "miscellaneous_close_confirm_changes_popup",
        key: "NSCloseAlwaysConfirmsChanges",
        displayName: "Close confirm changes popup",
        description:
            "Should you be asked to keep changes when closing documents or just have changes saved automatically. Requires closing and opening the app before working. Tested on Apple Preview.",
        group: .miscellaneous,
        notDefaultDomain: "NSGlobalDomain",
        defaultValue: .boolean(BooleanValue(bool: true))
    )

    static let miscellaneousKeepWindowsWhenQuittingAnApplication = SystemDefaultItem(
        id: "miscellaneous_keep_windows_when_quitting_an_application",
        key: "NSQuitAlwaysKeepsWindow",
        displayName: "Keep windows when quitting an application",
        description:
            "When enabled, open documents and windows will be restored when you re-open an application.",
        group: .miscellaneous,
        notDefaultDomain: "NSGlobalDomain",
        tipString:
            "Restarting the Mac or closing the session is necessary to take the changes into effect.",
        defaultValue: .boolean(BooleanValue(bool: true))
    )
}
