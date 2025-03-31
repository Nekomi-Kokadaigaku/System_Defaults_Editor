//
//  AppDelegate.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_: Notification) {
        // set a global value tell app what system os is using
        UserDefaults.standard.set(a.getSystemVersion(), forKey: "systemVersion")
        print(Bundle.main.systemVersion)
        LuminareManager.open()
    }

    func applicationShouldTerminateAfterLastWindowClosed(_: NSApplication) -> Bool {
        LuminareManager.fullyClose()
        return false
    }

    func applicationShouldHandleReopen(_: NSApplication, hasVisibleWindows _: Bool) -> Bool {
        LuminareManager.open()
        return true
    }
}

class a {
    enum OSVersion {
    case sonoma      // macOS 14
    case ventura     // macOS 13
    case monterey    // macOS 12
    case bigSur      // macOS 11
    case catalina    // macOS 10.15
    case mojave      // macOS 10.14
    case unknown

    static func from(majorVersion: Int, minorVersion: Int = 0) -> OSVersion {
        switch (majorVersion, minorVersion) {
        case (14, _): return .sonoma
        case (13, _): return .ventura
        case (12, _): return .monterey
        case (11, _): return .bigSur
        case (10, 15): return .catalina
        case (10, 14): return .mojave
        default: return .unknown
        }
    }

    var marketingName: String {
        switch self {
        case .sonoma: return "Sonoma"
        case .ventura: return "Ventura"
        case .monterey: return "Monterey"
        case .bigSur: return "Big Sur"
        case .catalina: return "Catalina"
        case .mojave: return "Mojave"
        case .unknown: return "未知版本"
        }
    }
}

    @available(OSX 10.15, *)
    public static func getSystemVersion() -> String {
        let version = ProcessInfo.processInfo.operatingSystemVersion
        print(version)
        return "\(version.majorVersion).\(version.minorVersion).\(version.patchVersion)"
    }
}
