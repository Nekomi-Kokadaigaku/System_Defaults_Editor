//
//  Finder.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

// MARK: - Finder setting
extension SystemDefaultItem {

    static let finderQuit = SystemDefaultItem(
        id: "finder_quit",
        key: "QuitMenuItem",
        displayName: "Quit option",
        description:
            "Add a quit option to the Finder. Behaves strangely when activated, would not recommend.",
        group: .finder,
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let finderShowExtensions = SystemDefaultItem(
        id: "finder_show_extensions",
        key: "AppleShowAllExtensions",
        displayName: "Show extensions",
        description: "Show all file extensions in the Finder.",
        group: .finder,
        notDefaultDomain: "NSGlobalDomain",
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let finderShowHiddenFiles = SystemDefaultItem(
        id: "finder_show_hidden_files",
        key: "AppleShowAllFiles",
        displayName: "Hidden files",
        description:
            "Show hidden files in the Finder. You can toggle the value using ⌘ cmd+⇧ shift+..",
        group: .finder,
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let finderPathBar = SystemDefaultItem(
        id: "finder_path_bar",
        key: "ShowPathbar",
        displayName: "Path bar",
        description: "Show path bar in the bottom of the Finder windows",
        group: .finder,
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let finderDefaultViewStyle = SystemDefaultItem(
        id: "finder_default_view_style",
        key: "FXPreferredViewStyle",
        displayName: "Default view style",
        description:
            "Set the default view style for folders without custom setting",
        group: .finder,
        defaultValue: .options(
            OptionsValue(
                options: ["clmv", "Nlsv", "glyv", "icnv"],
                selectedOption: "icnv"))
    )

    static let finderKeepFoldersOnTop = SystemDefaultItem(
        id: "finder_keep_folders_on_top",
        key: "_FXSortFoldersFirst",
        displayName: "Keep folders on top",
        description: "Keep folders on top when sorting by name.",
        group: .finder,
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let finderOpenFolderDestionation = SystemDefaultItem(
        id: "finder_open_folder_destination",
        key: "FinderSpawnTab",
        displayName: "Open folder destination",
        description:
            "Set whether folders shown in the Finder open in a new tab or a new window when using ⌘ cmd+double-click, and which option is shown in the context menu.",
        group: .finder,
        defaultValue: .boolean(BooleanValue(bool: true))
    )

    static let finderDefaultSearchScope = SystemDefaultItem(
        id: "finder_default_search_scope",
        key: "FXDefaultSearchScope",
        displayName: "Default search scope",
        description: "Set the default search scope when performing a search",
        group: .finder,
        defaultValue: .options(
            OptionsValue(
                options: ["SCcf", "SCsp", "SCev"], selectedOption: "SCev"))
    )

    static let finderEmptyBinItemAfter30Days = SystemDefaultItem(
        id: "finder_empty_bin_item_after_30_days",
        key: "FXRemoveOldTrashItems",
        displayName: "Auto-empty bin",
        description: "Remove items in the bin after 30 days",
        group: .finder,
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let finderChangingFileExtensionWarning = SystemDefaultItem(
        id: "finder_changing_file_extension_warning",
        key: "FXEnableExtensionChangeWarning",
        displayName: "Change extension warning",
        description:
            "Choose whether to display a warning when changing a file extension",
        group: .finder,
        defaultValue: .boolean(BooleanValue(bool: true))
    )

    static let finderSaveToDiskLocation = SystemDefaultItem(
        id: "finder_save_to_disk_location",
        key: "NSDocumentSaveNewDocumentsToCloud",
        displayName: "Save to disk location",
        description: "Set the default location for saving files to disk",
        group: .finder,
        notDefaultDomain: "NSGlobalDomain",
        defaultValue: .boolean(BooleanValue(bool: true))
    )

    static let finderTitleBarIcons = SystemDefaultItem(
        id: "finder_title_bar_icons",
        key: "showWindowTitlebarIcons",
        displayName: "Title bar icons",
        description: "Always show folder icon before title in the title bar",
        group: .finder,
        notDefaultDomain: "com.apple.universalaccess",
        tipString:
            "This command requires to grant full disk access to the terminal (System Preferences → Security & Privacy → Full Disk Access)",
        defaultValue: .boolean(BooleanValue(bool: false))
    )

    static let finderToolbatTitleRolloverDelay = SystemDefaultItem(
        id: "finder_toolbat_title_rollover_delay",
        key: "NSToolbarTitleViewRolloverDelay",
        displayName: "Title rollover delay",
        description: "Choose the delay of the auto-hidden document-proxy icon.",
        group: .finder,
        notDefaultDomain: "NSGlobalDomain",
        tipString:
            "com.apple.universalaccess showWindowTitlebarIcons must be set to false",
        defaultValue: .decimal(DecimalValue(value: 0.5, 0.0...1.0, suffix: nil))
    )

    static let finderSidebarIconSize = SystemDefaultItem(
        id: "finder_sidebar_icon_size",
        key: "NSTableViewDefaultSizeMode",
        displayName: "Sidebar icon size",
        description: "Choose the size of Finder sidebar icons",
        group: .finder,
        notDefaultDomain: "NSGlobalDomain",
        defaultValue: .integer(IntegerValue(value: 2, suffix: nil))
    )
}
