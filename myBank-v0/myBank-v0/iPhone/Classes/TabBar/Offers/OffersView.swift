//
//  OffersView.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 19/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

protocol OffersViewDelegate: NSObjectProtocol {
    func offersView(view: OffersView, didSelect offer: OffersResponse.List)
}

class OffersView: UIView {
    
    @IBOutlet private weak var lblTitle         : UILabel!
    @IBOutlet private weak var lblSubHeading    : UILabel!
    @IBOutlet private weak var clvOffers        : UICollectionView!
    
    private lazy var listOffersAdapter = ListOffersAdapter(delegate: self)
    
    unowned var delegate: OffersViewDelegate?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    func setupAdapters() {
        self.listOffersAdapter.setCollectionView(self.clvOffers)
    }
    
    func setOffers(_ offer: Offer) {
        self.lblTitle.text      = offer.title
        self.lblSubHeading.text = offer.subheading
        self.reloadCollectionData(offer.list)
    }
    
    private func reloadCollectionData(_ arrayData: [Any]) {
        self.listOffersAdapter.arrayData = arrayData.isEmpty ? ["Error al obtener las ofertas"] : arrayData
        self.clvOffers.reloadData()
    }
}

extension OffersView: ListOffersAdapterDelegate {
    func listOffersAdapter(_ adapter: ListOffersAdapter, didSelect offer: OffersResponse.List) {
        self.delegate?.offersView(view: self, didSelect: offer)
    }
}
