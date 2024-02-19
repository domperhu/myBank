//
//  Offer.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 19/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import Foundation

struct Offer {
    
    let title           : String
    let subheading      : String
    let list            : [OffersResponse.List]
    
    init(dto: OffersResponse) {
        self.title          = dto.title         ?? ""
        self.subheading     = dto.subheading    ?? ""
        self.list           = dto.list          ?? []
    }
}

extension OffersResponse {
    var toOffer: Offer { Offer(dto: self) }
}
