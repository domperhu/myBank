//
//  ImageDownloadManager.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 18/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

extension UIImageView {
        
    fileprivate func downloadImage(_ urlString: String, awaitImage image: UIImage?) {
        
        let url     = URL(string: urlString) ?? nil
        let task    = URLSession.shared.dataTask(with: url ?? URL(fileURLWithPath: "")) { (data, response, error) in
        
            guard error == nil else { return }
            guard let imageDownloaded = data else { return }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: imageDownloaded) {
                    DispatchQueue.main.async {
                        self.image = image
                        print("\nImageDownloadManager: Success.\n")
                    }
                } else { print("\nImageDownloadManager: Failure.\n") }
            }
        }
        task.resume()
    }
    
    func downloadImageWithThis(_ url: String, awaitImage image: UIImage? = nil) {
        
        self.image      = image
        guard let url   = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        var name        = url.replacingOccurrences(of: "/", with: "")
        
        switch name {
        case _ where name.hasSuffix("jpg")  : name = name.replacingOccurrences(of: ".jpg", with: "@3x.jpg")
        case _ where name.hasSuffix("png")  : name = name.replacingOccurrences(of: ".jpg", with: "@3x.png")
        default                             : name = name + "@3x.png"
        }
        
        self.downloadImage(url, awaitImage: image)
    }
}

