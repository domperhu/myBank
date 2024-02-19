//
//  ListOffersAdapter.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 19/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

protocol ListOffersAdapterDelegate: NSObjectProtocol {
    func listOffersAdapter(_ adapter: ListOffersAdapter, didSelect offer: OffersResponse.List)
}

class ListOffersAdapter: NSObject {
    
    private weak var collectionView : UICollectionView?
    unowned private let delegate    : ListOffersAdapterDelegate
    
    var arrayData = [Any]() {
        didSet { arrayData.first is OffersResponse.List ? self.setOffersLayout() : self.setErrorLayout() }
    }
    
    init(delegate: ListOffersAdapterDelegate) {
        self.delegate = delegate
    }
    
    func setCollectionView(_ collectionView: UICollectionView) {
        collectionView.delegate     = self
        collectionView.dataSource   = self
        self.collectionView         = collectionView
        self.setOffersLayout()
    }
    
    private func setOffersLayout() {
        let layoutSize          = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item                = NSCollectionLayoutItem(layoutSize: layoutSize)
        item.contentInsets      = NSDirectionalEdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)
        
        let group               = NSCollectionLayoutGroup.horizontal(layoutSize: layoutSize, subitems: [item])
        group.interItemSpacing  = NSCollectionLayoutSpacing.fixed(0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        self.collectionView?.collectionViewLayout = layout
    }
    
    private func setErrorLayout() {
        let layoutSize  = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item        = NSCollectionLayoutItem(layoutSize: layoutSize)
        let group       = NSCollectionLayoutGroup.horizontal(layoutSize: layoutSize, subitems: [item])
        let section     = NSCollectionLayoutSection(group: group)
        let layout      = UICollectionViewCompositionalLayout(section: section)
        self.collectionView?.collectionViewLayout = layout
    }
}

extension ListOffersAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.arrayData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let element = self.arrayData[indexPath.row]
        
        if let offer = element as? OffersResponse.List {
            return ListOfferCollectionViewCell.buildIn(collectionView, indexPath: indexPath, offer: offer)
        } else if let message = element as? String {
            return ErrorCollectionViewCell.buildIn(collectionView, indexPath: indexPath, errorMessage: message)
        } else { return UICollectionViewCell() }
    }
}

extension ListOffersAdapter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let offer = self.arrayData[indexPath.row] as? OffersResponse.List else { return }
        self.delegate.listOffersAdapter(self, didSelect: offer)
    }
}
