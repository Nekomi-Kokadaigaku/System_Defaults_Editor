//
//  System_Defaults_EditorApp.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

import SwiftUI

@main
struct System_Defaults_EditorApp: App {

    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {

        MenuBarExtra(Bundle.main.appName, systemImage: "square.grid.3x3") {
            #if DEBUG
                let text =
                    "DEV BUILD: \(Bundle.main.appVersion ?? "Unknown") (\(Bundle.main.appBuild ?? 0))"
                Text(text)
                    .font(.system(size: 11, weight: .semibold))
            #endif

            Button("Settings…") {
                LuminareManager.open()
            }
            .keyboardShortcut(",", modifiers: .command)

            Button("Quit") {
                NSApp.terminate(nil)
            }
            .keyboardShortcut("q", modifiers: .command)
        }
        .menuBarExtraStyle(.menu)
    }
}
