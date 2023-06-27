//
//  Note.swift
//  Notes Watch App
//
//  Created by Patrick Masterson on 10/13/22.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
