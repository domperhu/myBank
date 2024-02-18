//
//  UserResponse.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 18/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import Foundation

struct UserResponse: Decodable {
    let name        : String?
    let lastname    : String?
    let email       : String?
}
