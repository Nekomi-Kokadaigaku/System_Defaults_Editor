//
//  Activity Monitor.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

// MARK: - Activity Monitor setting
extension SystemDefaultItem {

    static let activityMonitorUpdateFrequency = SystemDefaultItem(
        id: "activity_monitor_update_frequency",
        key: "UpdatePeriod",
        displayName: "Update frequency",
        description: "The frequency of the Activity Monitor to update.",
        group: .activityMonitor,
        defaultValue: .integer(
            IntegerValue(
                value: 5,
                suffix: .init(.init(localized: "aaa", defaultValue: "s"))
            )
        )
    )

    static let activityMonitorDockIconType = SystemDefaultItem(
        id: "activity_monitor_dock_icon_type",
        key: "IconType",
        displayName: "Icon type",
        description:
            "Choose what information should be shown in the app's Dock icon, if any.",
        group: .activityMonitor,
        defaultValue: .integer(IntegerValue(value: 0, suffix: nil))
    )
}
