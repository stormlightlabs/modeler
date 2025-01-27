//
//  Users.swift
//  Mental Modeler
//
//  Created by Owais Jamil on 1/27/25.
//

import Foundation
import SwiftData

@Model
class User {
    var id: UUID
    var firstName: String
    var lastName: String

    init(id: UUID, firstName: String, lastName: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
    }
}
