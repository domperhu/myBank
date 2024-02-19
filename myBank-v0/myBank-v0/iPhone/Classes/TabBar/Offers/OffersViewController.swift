//
//  OffersViewController.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 19/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

class OffersViewController: UIViewController {
    
    private var offersView: OffersView? { self.view as? OffersView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.offersView?.delegate = self
        self.offersView?.setupAdapters()
        self.getOffers()
    }
    
    private func getOffers() {
        OffersMock().GetOffersMock { offersResponse in
            self.offersView?.setOffers(offersResponse.toOffer)
        }
    }
}

extension OffersViewController: OffersViewDelegate {
    func offersView(view: OffersView, didSelect offer: OffersResponse.List) {
    }
}
