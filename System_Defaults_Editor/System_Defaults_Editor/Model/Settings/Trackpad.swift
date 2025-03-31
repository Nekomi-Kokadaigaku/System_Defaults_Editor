//
//  Trackpad.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

// MARK: - Tackpad setting
extension SystemDefaultItem {

    static let trackpadClickWeight = SystemDefaultItem(
        id: "trackpad_click_weight",
        key: "FirstClickThreshold",
        displayName: "Click weight",
        description: "Choose between Light/Medium/Firm.",
        group: .trackpad,
        defaultValue: .options(
            OptionsValue(options: ["0", "1", "2"], selectedOption: "1"))
    )

    static let trackpadDraggingWithDragLock = SystemDefaultItem(
        id: "trackpad_dragging_with_drag_lock",
        key: "DragLock",
        displayName: "Drag lock",
        description: "Mutually exclusive with Dragging and TrackpadThreeFingerDrag.",
        group: .trackpad,
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let trackpadDraggingWithoutDragLock = SystemDefaultItem(
        id: "trackpad_dragging_without_drag_lock",
        key: "Dragging",
        displayName: "Dragging",
        description: "Mutually exclusive with DragLock and TrackpadThreeFingerDrag.",
        group: .trackpad,
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let trackpadDragingWithThreeFinderDrag = SystemDefaultItem(
        id: "trackpad_draging_with_three_finder_drag",
        key: "TrackpadThreeFingerDrag",
        displayName: "Three finger drag",
        description: "Mutually exclusive with Dragging and DragLock.",
        group: .trackpad,
        defaultValue: .boolean(BooleanValue(bool: false))
    )
}
