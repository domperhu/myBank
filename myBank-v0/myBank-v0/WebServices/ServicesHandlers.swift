//
//  ServicesHandlers.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 18/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import Foundation

struct ServicesHandlers {
    typealias SuccessProcess    = () -> Void
    typealias SuccessMessage    = (_ message: String) -> Void
    typealias GetUserResponse   = (_ userResponse: UserResponse) -> Void
}
