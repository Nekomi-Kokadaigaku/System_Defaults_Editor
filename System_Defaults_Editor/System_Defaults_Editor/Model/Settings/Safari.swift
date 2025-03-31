//
//  Safari.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

// MARK: - Safari setting
extension SystemDefaultItem {

    static let safariShowFullURL = SystemDefaultItem(
        id: "safari_show_full_url",
        key: "ShowFullURLInSmartSearchField",
        displayName: "Full address",
        description: "Show full website address.",
        group: .safari,
        defaultValue: .boolean(BooleanValue(bool: false))
    )
}
