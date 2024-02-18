//
//  StringManager.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 18/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import Foundation

extension String {
    public var hasEmailFormat: Bool {
        let regex = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$"
        return self.hasCorrectFormatToRegex(regex)
    }
        
    public func hasCorrectFormatToRegex(_ regex: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
    
    public func toSecureText(charactersToShow: Int = 3) -> String {
        "****\(self.suffix(charactersToShow))"
    }
    
    public func toSecureEmail(charactersToShow: Int = 3) -> String {
        if self.hasEmailFormat {
            let emailComponents = self.components(separatedBy: "@")
            if emailComponents.count == 2 {
                let user    = emailComponents.first ?? ""
                let domain  = emailComponents.last ?? ""
                return "\(user.toSecureText(charactersToShow: charactersToShow))@\(domain)"
            } else { return self.toSecureText(charactersToShow: charactersToShow) }
        } else { return self.toSecureText(charactersToShow: charactersToShow) }
    }
}
