//
//  Screenshots.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

// MARK: - Screenshots settings
extension SystemDefaultItem {

    static let screenshotsDisableShadow = SystemDefaultItem(
        id: "screenshots_disable_shadow",
        key: "disable-shadow",
        displayName: "Screenshot shadow",
        description:
            "Disable screenshot shadow when capturing an app (⌘ cmd+⇧ shift+4 then space).",
        group: .screenshots,
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let screenshotsIncludeDate = SystemDefaultItem(
        id: "screenshots_include_date",
        key: "include-date",
        displayName: "Date and time",
        description: "Include date and time in screenshot filenames.",
        group: .screenshots,
        defaultValue: .boolean(BooleanValue(bool: true))
    )

    static let screenshotsLocation = SystemDefaultItem(
        id: "screenshots_location",
        key: "location",
        displayName: "Default screenshot location",
        description: "Set default screenshot location.",
        group: .screenshots,
        defaultValue: .text(TextValue(value: "~/Desktop"))
    )

    static let screenshotsDisplayThumbnail = SystemDefaultItem(
        id: "screenshots_display_thumbnail",
        key: "show-thumbnail",
        displayName: "Thumbnail",
        description: "Choose whether to display a thumbnail after taking a screenshot.",
        group: .screenshots,
        defaultValue: .boolean(BooleanValue(bool: true))
    )

    static let screenshotsChooseScreenshotFormat = SystemDefaultItem(
        id: "screenshots_choose_screenshot_format",
        key: "type",
        displayName: "Screenshot format",
        description: "Choose the screenshots image format.",
        group: .screenshots,
        defaultValue: .options(
            OptionsValue(
                options: ["png", "jpg", "pdf", "psd", "gif", "tga", "tiff", "bmp", "heic"],
                selectedOption: "png"
            )
        )
    )
}
