//
//  SystemSettingsView.swift
//  System_Defaults_EditorApp
//
//  Created by 1ris_W
//

import Luminare
import SwiftUI

/// Displays a view for each SettingItem
struct SystemSettingsView: View {

    @State private var selectedGroup: SettingsGroup? = .dock

    var body: some View {

        NavigationSplitView {
            List(selection: $selectedGroup) {
                ForEach(SettingsGroup.allCases, id: \.self) { group in
                    Label(group.displayName, systemImage: group.iconForDisplay)
                        .tag(group)
                }
            }
            .listStyle(.sidebar)
        } detail: {
            if let selectedGroup = selectedGroup {
                SettingGroupDetailView(
                    settings: SystemDefaultItem.settingsInGroup(selectedGroup)
                )
            } else {
                Text("Please select a setting category from the left.")
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct SettingGroupDetailView: View {

    @State var settings: [SystemDefaultItem]

    var body: some View {

        if settings.isEmpty {
            Text("No setting item in this group.")
                .font(.title3)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            List(settings, id: \.id) { item in
                SettingItemView(settingItem: item)
            }
        }
    }
}

struct LuminareSettingGroupDetailView: View {

    @State var settings: [SystemDefaultItem]

    var body: some View {

        if settings.isEmpty {
            Text("No setting item in this group.")
                .font(.title3)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            LuminareSection {
                ForEach(settings) { setting in
                    LuminareSettingItemView(settingItem: setting)
                }
            }
        }
    }
}

#Preview {
    SystemSettingsView()
}
