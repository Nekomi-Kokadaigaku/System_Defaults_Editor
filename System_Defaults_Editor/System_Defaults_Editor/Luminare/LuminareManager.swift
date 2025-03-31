//
//  LuminareManager.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

import Combine
import Defaults
import Luminare
import SwiftUI

@ViewBuilder func tempView() -> some View {
    Text("Developing...")
}

class LuminareManager {

    static var luminare: LuminareWindow?

    static func open() {
        if luminare == nil {
            luminare = LuminareWindow(blurRadius: 20) {
                LuminareContentView()
            }
            luminare?.center()
        }

        luminare?.show()
        NSApp.setActivationPolicy(.regular)
    }

    static func fullyClose() {
        luminare?.close()
        luminare = nil
    }
}

class LuminareWindowModel: ObservableObject {

    static let shared = LuminareWindowModel()
    private init() {}

    @Published var currentTab: SettingsGroup = .dock

    @Published var showInspector: Bool = true
    @Published var timer: AnyCancellable?
}

struct LuminareContentView: View {

    @ObservedObject var model = LuminareWindowModel.shared

    var body: some View {
        LuminareDividedStack {
            LuminareSidebar {
                ScrollView(showsIndicators: false) {
                    ForEach(SettingsGroup.allCases) { item in
                        LuminareSidebarTab(item, $model.currentTab)
                    }
                }
                .menuIndicator(.hidden)
            }
            .frame(width: 260)

            LuminarePane {
                HStack {
                    model.currentTab.iconView()

                    Text(model.currentTab.title)
                        .font(.title2)

                    Spacer()

                    Button {
                        model.showInspector.toggle()
                    } label: {
                        Image(systemName: "circle")
                    }
                }
            } content: {
                let settings = SystemDefaultItem.settingsInGroup(
                    model.currentTab)
                LuminareSettingGroupDetailView(settings: settings)
                    .id(model.currentTab)
                    .transition(.opacity.animation(.easeInOut(duration: 0.1)))
            }
            .frame(width: 390)

            if model.showInspector {
                ZStack {
                    tempView()
                }
                .ignoresSafeArea()
                .frame(width: 520)
            }
        }
        .onChange(of: model.currentTab) { oldValue, newValue in
            print("CurrentTab change from \(oldValue) to \(newValue).")
        }
    }
}
