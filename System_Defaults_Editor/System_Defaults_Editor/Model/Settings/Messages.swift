//
//  Messages.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

// MARK: - Messages setting
extension SystemDefaultItem {

    static let messagesShowSubjectField = SystemDefaultItem(
        id: "messages_show_subject_field",
        key: "MMSShowSubject",
        displayName: "Subject field",
        description:
            "Show the subject field which appears above the iMessage/Text Message field in Messages. Text entered in the subject field will be sent in bold (unless there is no text in the iMessage/Text Message field; in this case, the text in the subject field will be sent without the bold effect).",
        group: .messages,
        defaultValue: .boolean(BooleanValue(bool: false))
    )
}
