//
//  OffersMock.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 19/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import Foundation

struct OffersMock {
    func GetOffersMock(_ completion: @escaping ServicesHandlers.GetOffersResponse) {
        guard let offersResponse = try? JSONDecoder().decode(OffersResponse.self, from: FileManager().getFromJSON(forResource: "offersMock")) else { return }
        completion(offersResponse)
    }
}
