//
//  OffersResponse.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 19/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import Foundation

struct OffersResponse: Decodable {
    let title       : String?
    let subheading  : String?
    let list        : [OffersResponse.List]?
}

extension OffersResponse {
    struct List: Decodable {
        let image           : String?
        let name            : String?
        let shortDescription: String?
        let description     : String?
    }
}
