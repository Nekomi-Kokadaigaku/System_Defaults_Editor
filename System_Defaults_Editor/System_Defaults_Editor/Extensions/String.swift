//
//  String.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

import Foundation

extension String: @retroactive Identifiable {

    var isNotEmpty: Bool {
        return !self.isEmpty
    }

    public var id: String { self }
}
