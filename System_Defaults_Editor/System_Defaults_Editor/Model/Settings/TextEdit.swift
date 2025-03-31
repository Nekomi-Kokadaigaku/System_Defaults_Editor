//
//  TextEdit.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

// MARK: - TextEdit setting
extension SystemDefaultItem {

    static let textEditDefaultDocumentFormat = SystemDefaultItem(
        id: "text_edit_default_document_format",
        key: "RichText",
        displayName: "Default document format",
        description: "Set default document format as rich text (.rtf) or plain text (.txt).",
        group: .textEdit,
        defaultValue: .boolean(BooleanValue(bool: true))
    )

    static let textEditSmartQuotes = SystemDefaultItem(
        id: "text_edit_smart_quotes",
        key: "SmartQuotes",
        displayName: "Smart quotes",
        description:
            "Set if quotation marks should be converted from neutral form to opening/closing variants.",
        group: .textEdit,
        defaultValue: .boolean(BooleanValue(bool: true))
    )
}
