//
//  ListOfferCollectionViewCell.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 19/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

class ListOfferCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var imgOffer             : UIImageView!
    @IBOutlet private weak var lblNameOffer         : UILabel!
    @IBOutlet private weak var lblShortDescription  : UILabel!
    
    private var offer: OffersResponse.List! {
        didSet { self.updateData() }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor                = .clear
        self.contentView.backgroundColor    = .white
        self.layer.shadowOffset             = .zero
        self.layer.shadowRadius             = 2
        self.layer.shadowOpacity            = 0.3
        self.contentView.layer.cornerRadius = 12
        self.clipsToBounds                  = false
    }
    
    private func animateAppear() {
        self.alpha      = 0
        self.transform  = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.5) {
            self.alpha      = 1
            self.transform  = .identity
        }
    }
    
    private func updateData() {
        self.animateAppear()
        self.imgOffer.downloadImageWithThis(self.offer.image ?? "")
        self.lblNameOffer.text          = self.offer.name ?? ""
        self.lblShortDescription.text   = self.offer.shortDescription ?? ""
    }
}

extension ListOfferCollectionViewCell {
    
    private static var identifier: String { "ListOfferCollectionViewCell" }
    
    class func buildIn(_ collectionView: UICollectionView, indexPath: IndexPath, offer: OffersResponse.List) -> Self {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identifier, for: indexPath) as? Self
        cell?.offer = offer
        return cell ?? Self()
    }
}
