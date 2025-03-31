//
//  Xcode.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

// MARK: - Xcode setting
extension SystemDefaultItem {

    static let xcodeAddAdditionalCounterpartSuffixes = SystemDefaultItem(
        id: "xcode_add_additional_counterpart_suffixes",
        key: "IDEAdditionalCounterpartSuffixes",
        displayName: "Additional counterpart suffixes",
        description:
            "Add additional counterpart suffixes that Xcode should consider in the \"Related Items > Counterparts\" menu.",
        group: .xcode,
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let xcodeShowBuildDuraions = SystemDefaultItem(
        id: "xcode_show_build_durations",
        key: "ShowBuildOperationDuration",
        displayName: "Show build durations",
        description:
            "Show build durations in the Activity Viewer in Xcode's toolbar at the top of the workspace window.",
        group: .xcode,
        defaultValue: .boolean(BooleanValue(bool: false))
    )
}
