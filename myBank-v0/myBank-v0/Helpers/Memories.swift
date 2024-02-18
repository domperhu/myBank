//
//  Memories.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 17/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import Foundation

struct Memories {
    
    struct Onboarding {
        
        static var userDefaultsEarnmark: String { "welcomeWasViewed" }
        
        static func wasViewed() -> Bool {
            UserDefaults.standard.bool(forKey: self.userDefaultsEarnmark)
        }
        
        static func setViewed() {
            UserDefaults.standard.set(true, forKey: self.userDefaultsEarnmark)
        }
    }
}