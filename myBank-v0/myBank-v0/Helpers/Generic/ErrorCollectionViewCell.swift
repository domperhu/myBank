//
//  ErrorCollectionViewCell.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 19/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

class ErrorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var lblErrorMessage: UILabel!
    
    private func updateData(_ errorMessage: String) {
        self.lblErrorMessage.text = errorMessage
    }
}

extension ErrorCollectionViewCell {
    
    private static var identifier: String { "ErrorCollectionViewCell" }
    
    class func buildIn(_ collectionView: UICollectionView, indexPath: IndexPath, errorMessage: String) -> Self {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identifier, for: indexPath) as? Self
        cell?.updateData(errorMessage)
        return cell ?? Self()
    }
}

