//
//  Desktop.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

// MARK: - Finder setting
extension SystemDefaultItem {

    static let desktopKeepFoldersOnTop = SystemDefaultItem(
        id: "desktop_keep_folders_on_top",
        key: "_FXSortFoldersFirstOnDesktop",
        displayName: "Keep folders",
        description: "Keep folders on top when sorting.",
        group: .desktop,
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let desktopAllIcons = SystemDefaultItem(
        id: "desktop_all_icons",
        key: "CreateDesktop",
        displayName: "Hide icons",
        description: "Hide all icons on desktop.",
        group: .desktop,
        defaultValue: .boolean(BooleanValue(bool: true))
    )

    static let desktopDisks = SystemDefaultItem(
        id: "desktop_disks",
        key: "ShowHardDrivesOnDesktop",
        displayName: "Hard disks",
        description: "Show hard disks on desktop.",
        group: .desktop,
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let desktopExternalDisks = SystemDefaultItem(
        id: "desktop_external_disks",
        key: "ShowExternalHardDrivesOnDesktop",
        displayName: "External disks",
        description: "Show external disks on desktop.",
        group: .desktop,
        defaultValue: .boolean(BooleanValue(bool: true))
    )

    static let desktopRemovabeleMedia = SystemDefaultItem(
        id: "desktop_removable_media",
        key: "ShowRemovableMediaOnDesktop",
        displayName: "Removable media",
        description: "Show removable media (CDs, DVDs and iPods) on desktop.",
        group: .desktop,
        defaultValue: .boolean(BooleanValue(bool: true))
    )

    static let desktopConnectedServers = SystemDefaultItem(
        id: "desktop_connected_servers",
        key: "ShowMountedServersOnDesktop",
        displayName: "Connected servers",
        description: "Show connected servers on desktop.",
        group: .desktop,
        defaultValue: .boolean(BooleanValue(bool: false))
    )
}
