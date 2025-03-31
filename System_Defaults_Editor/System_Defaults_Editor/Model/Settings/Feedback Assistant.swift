//
//  Feedback Assistant.swift
//  System_Defaults_EditorApp
//
//  Created by 1ris_W
//

// MARK: - Feedback Assistant setting
extension SystemDefaultItem {

    static let feedbackAssistantAutogather = SystemDefaultItem(
        id: "feedback_assistant_autogather",
        key: "Autogather",
        displayName: "Autogather",
        description: "Choose whether to autogather large files when submitting a feedback report.",
        group: .feedbackAssistant,
        defaultValue: .boolean(BooleanValue(bool: true))
    )
}
