//
//  SystemDefaultItem.swift
//  System_Defaults_EditorApp
//
//  Created by 1ris_W
//

import SwiftUI

/// ActionType
enum ActionType: Codable {

    case write
    case delete
    case read

    var cliFlag: String {
        switch self {
        case .write: return "write"
        case .delete: return "delete"
        case .read: return "read"
        }
    }
}

/// SystemSettingTypeProtocol
protocol SystemDefaultItemProtocol: Identifiable, Hashable {

    var id: String { get }
    var key: String { get }
    var displayName: LocalizedStringKey { get }
    var group: SettingsGroup { get }
    var notDefaultDomain: String? { get }
    var postCommand: String? { get }
    var tipString: LocalizedStringKey? { get }

    var valueType: EditableType? { get }
}

struct SystemDefaultItem: SystemDefaultItemProtocol {

    let id: String
    /// Key used to generate commands
    let key: String
    /// Display name for user options
    let displayName: LocalizedStringKey
    /// Description for user options
    let description: LocalizedStringKey
    /// Group
    let group: SettingsGroup
    /// Not grouped by default domain
    var notDefaultDomain: String?
    /// Post-command with higher priority than the group
    var postCommand: String?
    /// Used to display tips such as "requires restart"
    var tipString: LocalizedStringKey?
    /// Default value
    var defaultValue: EditableType
    /// Command to read the value
    var readCommand: String {
        return "defaults read \(self.notDefaultDomain ?? self.group.domain) \(key)"
    }
    /// Command to modify the value
    var writeCommand: String {
        let a = self.defaultValue.writeKey
        return "defaults write \(self.notDefaultDomain ?? self.group.domain) \(key) \(a)"
    }
    /// Retrieves the value
    var valueType: EditableType? {
        get {
            let result = executeShellCommand(readCommand)
            #if DEBUG
            print(readCommand)
            #endif
            switch result {
            case .success(let commandResult):
                if commandResult.succeeded {
                    #if DEBUG
                    print("Command succeeded: \(commandResult.output ?? "No output")")
                    #endif
                    
                    switch defaultValue {
                        
                    case .boolean(_):
                        return .boolean(BooleanValue(str: commandResult.output))
                        
                    case .decimal(let decimalValue):
                        return .decimal(
                            DecimalValue(
                                fromString: commandResult.output,
                                decimalValue.range,
                                suffix: decimalValue.suffix
                            )
                        )
                        
                    case .text(_):
                        return .text(TextValue(value: commandResult.output))
                        
                    case .integer(let integerValue):
                        return .integer(
                            IntegerValue(
                                str: commandResult.output,
                                suffix: integerValue.suffix
                            )
                        )
                        
                    case .options(let optionsValue):
                        return .options(
                            OptionsValue(
                                options: optionsValue.options,
                                selectedOption: commandResult.output!
                            )
                        )
                    }
                } else {
                    let a =
                        "Command failed: \(commandResult.error ?? "Unknown error"), Exit code: \(commandResult.exitCode)"
                    print(a)
                    return defaultValue
                }
            case .failure(let error):
                let a = "Execution error: \(error.localizedDescription)"
                print(a)
                switch error {
                case .executionFailed(let errorMessage):
                    print("Execution failed with error: \(errorMessage)")
                case .commandNotFound:
                    print("Command not found")
                case .timeout:
                    print("Command execution timed out")
                }
                return self.defaultValue
            }
        }
        set {
            guard let newValue = newValue else { return }

            // Retrieve the setting value
            let newSettingValue =
                switch newValue {
                case .options(let optionsValue): optionsValue.selectedOption
                default: newValue.getValueObject().value
                }

            // Build the base command
            let basicWriteCommand = writeCommand

            // Determine if a post-command is needed
            let effectivePostCommand: String? =
                if let customPostCommand = self.postCommand {
                    customPostCommand.isEmpty ? nil : customPostCommand
                } else {
                    self.group.postCommand.isEmpty
                        ? nil : self.group.postCommand
                }

            // Build the final command
            let finalCommand =
                if let postCmd = effectivePostCommand {
                    "\(basicWriteCommand) \(newSettingValue) && \(postCmd)"
                } else {
                    "\(basicWriteCommand) \(newSettingValue)"
                }

            // Execute the command
            print("Executing: \n\(finalCommand)")
            let result = executeShellCommand(finalCommand)

            // Handle the result
            switch result {
            case .success(let commandResult):
                if commandResult.succeeded {
                    print("Command succeeded: \(commandResult.output ?? "No output")")
                } else {
                    print(
                        "Command failed: \(commandResult.error ?? "Unknown error"), Exit code: \(commandResult.exitCode)"
                    )
                }
            case .failure(let error):
                print("Execution error: \(error)")
            }
        }
    }

    /// Initializes a system setting type
    ///
    /// - Parameters:
    ///   - id: Unique identifier
    ///   - key: Key used to generate commands
    ///   - displayName: Display name
    ///   - group: Group the setting belongs to
    ///   - notDefaultDomain: Non-default domain
    ///   - postCommand: Command to execute after the main command
    ///   - tipString: Tip string
    ///   - defaultValue: Default value
    init(
        id: String,
        key: String,
        displayName: LocalizedStringKey,
        description: LocalizedStringKey,
        group: SettingsGroup,
        notDefaultDomain: String? = nil,
        postCommand: String? = nil,
        tipString: LocalizedStringKey? = nil,
        defaultValue: EditableType
    ) {
        self.id = id
        self.key = key
        self.displayName = displayName
        self.group = group
        self.notDefaultDomain = notDefaultDomain
        self.postCommand = postCommand
        self.tipString = tipString
        self.defaultValue = defaultValue
        self.description = description
    }
}

// MARK: - Equality and Hashing
extension SystemDefaultItem {

    static func == (lhs: SystemDefaultItem, rhs: SystemDefaultItem) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - All Settings and Groups
extension SystemDefaultItem {

    static var allSettings: [SystemDefaultItem] {
        return [
            // Dock
            .dockPosition,
            .dockIconSize,
            .dockAutoHide,
            .dockAutohideAnimationTime,
            .dockAutohideDelay,
            .dockShowRecentApps,
            .dockMinimizeAnimationEffect,
            .dockActiveApplicationsOnly,
            .dockScrollToExposéApp,
            .dockSingleAppMode,
            .dockShowWallpaperLocation,

            // Screenshots
            .screenshotsDisableShadow,
            .screenshotsIncludeDate,
            .screenshotsLocation,
            .screenshotsDisplayThumbnail,
            .screenshotsChooseScreenshotFormat,

            // Safari
            .safariShowFullURL,

            // Finder
            .finderQuit,
            .finderShowExtensions,
            .finderShowHiddenFiles,
            .finderPathBar,
            .finderDefaultViewStyle,
            .finderKeepFoldersOnTop,
            .finderOpenFolderDestionation,
            .finderDefaultSearchScope,
            .finderEmptyBinItemAfter30Days,
            .finderChangingFileExtensionWarning,
            .finderSaveToDiskLocation,
            .finderTitleBarIcons,
            .finderToolbatTitleRolloverDelay,
            .finderSidebarIconSize,

            // Desktop
            .desktopKeepFoldersOnTop,
            .desktopAllIcons,
            .desktopDisks,
            .desktopExternalDisks,
            .desktopRemovabeleMedia,
            .desktopConnectedServers,

            // Menu Bar
            .menuBarFlashClockTimeSeparators,
            .menuBarDigitalClockFormat,

            // Mouse
            .mouseAcceleration,
            .mouseSpeed,
            .mouseFocusFollowsMouse,

            // Trackpad
            .trackpadClickWeight,
            .trackpadDraggingWithDragLock,
            .trackpadDraggingWithoutDragLock,
            .trackpadDragingWithThreeFinderDrag,

            // Keyboard
            .keyboardKeyHeldDownBehavior,
            .keyboardFnKeyUsage,
            .keyboardFunctionKeysBehavior,
            .keyboardKeyboardNavigation,
            .keyboardToggleLanguageIndicator,

            // Mission Control
            .missionControlRearrangeAutomatically,
            .missionControlGroupWindowsByApplication,
            .missionControlSwitchToSpaceWithOpenWindows,
            .missionControlDisplaysHaveSeparateSpaces,

            // Feedback Assistant
            .feedbackAssistantAutogather,

            // Xcode
            .xcodeAddAdditionalCounterpartSuffixes,
            .xcodeShowBuildDuraions,

            // Simulator

            // TextEdit
            .textEditDefaultDocumentFormat,
            .textEditSmartQuotes,

            // Time Machine
            .timeMachineDontOfferNewDisksForTimeMachineBackup,

            // Activity Monitor
            .activityMonitorUpdateFrequency,
            .activityMonitorDockIconType,

            // Messages
            .messagesShowSubjectField,

            // Miscellaneous
            .miscellaneousToggleAppleIntelligence,
            .miscellaneousHelpMenuPosition,
            .miscellaneousSpringLoadingForAllDock,
            .miscellaneousShowMusicSoneNotifications,
            .miscellaneousDisableApplicationQuarantine,
            .miscellaneousCloseConfirmChangesPopup,
            .miscellaneousKeepWindowsWhenQuittingAnApplication,
        ]
    }

    static func settingsInGroup(
        _ group: SettingsGroup
    ) -> [SystemDefaultItem] {
        return allSettings.filter { $0.group == group }
    }
}
