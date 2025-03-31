//
//  Mission Control.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

// MARK: - Mission Control settings
extension SystemDefaultItem {

    static let missionControlRearrangeAutomatically = SystemDefaultItem(
        id: "mission_control_rearrange_automatically",
        key: "mru-spaces",
        displayName: "Rearrange Spaces automatically",
        description: "Choose whether to rearrange Spaces automatically.",
        group: .missionControl,
        defaultValue: .boolean(BooleanValue(bool: true))
    )

    static let missionControlGroupWindowsByApplication = SystemDefaultItem(
        id: "mission_control_group_windows_by_application",
        key: "expose-group-apps",
        displayName: "Group windows by application",
        description:
            "If you have several windows from multiple apps open simultaneously, have the windows organised by app in Mission Control.",
        group: .missionControl,
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let missionControlSwitchToSpaceWithOpenWindows = SystemDefaultItem(
        id: "mission_control_switch_to_space_with_open_windows",
        key: "AppleSpacesSwitchOnActivate",
        displayName: "Switch to space with open windows",
        description: "When switching to an app, switch to a space with open windows for this app.",
        group: .missionControl,
        notDefaultDomain: "NSGlobalDomain",
        defaultValue: .boolean(BooleanValue(bool: true))
    )

    static let missionControlDisplaysHaveSeparateSpaces = SystemDefaultItem(
        id: "mission_control_displays_have_separate_spaces",
        key: "spans-displays",
        displayName: "Separate spaces for each display",
        description:
            "Set up separate spaces for each display (if you use Spaces and have multiple displays).",
        group: .missionControl,
        notDefaultDomain: "com.apple.spaces",
        tipString: "Requires a logout to take effect.",
        defaultValue: .boolean(BooleanValue(bool: false))
    )
}
