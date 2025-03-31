//
//  Dock.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

// MARK: - Dock settings items
extension SystemDefaultItem {

    static let dockPosition = SystemDefaultItem(
        id: "dock_position",
        key: "orientation",
        displayName: "Dock Position",
        description: "The position of the Dock.",
        group: .dock,
        defaultValue: .options(
            OptionsValue(options: ["left", "right", "bottom"]))
    )

    static let dockIconSize = SystemDefaultItem(
        id: "dock_icon_size",
        key: "tilesize",
        displayName: "Icon size",
        description: "The size of the Dock items.",
        group: .dock,
        defaultValue: .integer(
            IntegerValue(
                value: 36, suffix: .init(.init(localized: "dock icon size", defaultValue: "px"))))
    )

    static let dockAutoHide = SystemDefaultItem(
        id: "dock_autohide",
        key: "autohide",
        displayName: "Autohides the Dock",
        description: "The Dock will automatically hide when it is not in use.",
        group: .dock,
        defaultValue: .boolean(BooleanValue(str: "true"))
    )

    static let dockAutohideAnimationTime = SystemDefaultItem(
        id: "dock_autohide_animation_time",
        key: "autohide-time-modifier",
        displayName: "Autohide animation time",
        description: "The time it takes for the Dock to autohide.",
        group: .dock,
        defaultValue: .decimal(
            DecimalValue(
                value: 0.5, 0.1...1.5,
                suffix: .init(.init(localized: "dock auto hide animation time", defaultValue: "s")))
        )
    )

    static let dockAutohideDelay = SystemDefaultItem(
        id: "dock_autohide_delay",
        key: "autohide-delay",
        displayName: "Autohide delay",
        description: "The delay time for the Dock to autohide.",
        group: .dock,
        defaultValue: .decimal(
            DecimalValue(
                value: 0.2, 0.1...1.5,
                suffix: .init(.init(localized: "dock auto hide delay", defaultValue: "s"))))
    )

    static let dockShowRecentApps = SystemDefaultItem(
        id: "dock_show_recent_apps",
        key: "show-recents",
        displayName: "Recent apps",
        description: "Show recent apps in Dock.",
        group: .dock,
        defaultValue: .boolean(BooleanValue(str: "true"))
    )

    static let dockMinimizeAnimationEffect = SystemDefaultItem(
        id: "dock_minimize_animation_effect",
        key: "mineffect",
        displayName: "Animation effect",
        description: "The animation effect for the Dock to minimize.",
        group: .dock,
        defaultValue: .options(
            OptionsValue(options: ["scale", "genie", "suck"]))
    )

    static let dockActiveApplicationsOnly = SystemDefaultItem(
        id: "dock_active_applications_only",
        key: "static-only",
        displayName: "Active apps",
        description: "Only show active applications in Dock.",
        group: .dock,
        defaultValue: .boolean(BooleanValue(str: "true"))
    )

    static let dockScrollToExposéApp = SystemDefaultItem(
        id: "dock_scroll_to_exposé_app",
        key: "scroll-to-open",
        displayName: "Scroll up mode",
        description:
            "Scroll up on a Dock icon to show all Space's opened windows for an app, or open stack.",
        group: .dock,
        defaultValue: .boolean(BooleanValue(str: "true"))
    )
    
    static let dockSingleAppMode = SystemDefaultItem(
        id: "dock_single_app_mode",
        key: "single-app",
        displayName: "Single App Mode",
        description: "Active single app mode",
        group: .dock,
        defaultValue: .boolean(BooleanValue(bool: false))
    )
    
    static let dockShowWallpaperLocation = SystemDefaultItem(
        id: "dock_show_wallpaper_location",
        key: "desktop-picture-show-debug-text",
        displayName: "Show wallpaper location",
        description: "Show the location of the wallpaper in the Dock.",
        group: .dock,
        defaultValue: .boolean(BooleanValue(str: "false"))
    )
    
    static let dockDisableAnimations = SystemDefaultItem(
        id: "dock_disable_animations",
        key: "launchanim",
        displayName: "Disable Dock animations",
        description: "disable animations when you open an application from the Dock",
        group: .dock,
        defaultValue: .boolean(BooleanValue(str: "false"))
        )
}
