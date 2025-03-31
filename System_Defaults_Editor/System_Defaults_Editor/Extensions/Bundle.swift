//
//  Bundle.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

import Foundation

// Returns the current build number
extension Bundle {

    var appName: String {
        getInfo("CFBundleName") ?? "⚠️"
    }

    var displayName: String {
        getInfo("CFBundleDisplayName") ?? "⚠️"
    }

    var bundleID: String {
        getInfo("CFBundleIdentifier") ?? "⚠️"
    }

    var copyright: String {
        getInfo("NSHumanReadableCopyright") ?? "⚠️"
    }

    var appBuild: Int? {
        Int(getInfo("CFBundleVersion") ?? "")
    }

    var appVersion: String? {
        getInfo("CFBundleShortVersionString")
    }

    // system version
    var systemVersion: String? {
        getInfo("SystemVersion")
    }

    func getInfo(_ str: String) -> String? {
        infoDictionary?[str] as? String
    }
}
