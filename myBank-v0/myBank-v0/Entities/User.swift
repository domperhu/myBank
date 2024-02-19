//
//  User.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 18/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import Foundation

struct User {
    
    let name        : String
    let lastname    : String
    let email       : String
    let account     : String
    
    var fullname: String {
        "\(self.name) \(self.lastname)"
    }
    
    init(dto: UserResponse) {
        self.name       = dto.name      ?? ""
        self.email      = dto.email     ?? ""
        self.lastname   = dto.lastname  ?? ""
        self.account    = dto.account   ?? ""
    }
}

extension UserResponse {
    var toUser: User { User(dto: self) }
}
