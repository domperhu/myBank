//
//  UserMock.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 18/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import Foundation

struct UserMock {
    func GetUserMock(_ completion: @escaping ServicesHandlers.GetUserResponse) {
        guard let userResponse = try? JSONDecoder().decode(UserResponse.self, from: FileManager().getFromJSON(forResource: "userMock")) else { return }
        completion(userResponse)
    }
}
