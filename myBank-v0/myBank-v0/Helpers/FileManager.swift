//
//  FileManager.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 18/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import Foundation

struct FileManager {
    func getFromJSON(forResource resource: String) -> Data {
        let bundle      = Bundle.main
        guard let path  = bundle.path(forResource: resource, ofType: "json") else { return Data() }
        let data        = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        return data ?? Data()
    }
}
