//
//  Configuration.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 17/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import Foundation

protocol EnvironmentInfo {
    
    var baseURL             : String { get }
    var firebaseFileName    : String { get }
}

struct Configuration {
    
    enum Environment: String {
        
        case debug      = "Debug"
        case release    = "Release"
        
        var info: EnvironmentInfo {
            switch self {
                case .debug     : return Debug()
                case .release   : return Release()
            }
        }
    }
    
    static var envioronment: Environment {
        let nameDeploy = Bundle.main.infoDictionary?["Environment"] as? String ?? ""
        return Environment(rawValue: nameDeploy) ?? .debug
    }
}

extension Configuration {
    
    private struct Release: EnvironmentInfo {
        
        let baseURL             : String = "https://domperhu.com/"
        let firebaseFileName    : String = ""
    }
    
    private struct Debug: EnvironmentInfo {
        
        let baseURL             : String = "https://dev.domperhu.com/"
        let firebaseFileName    : String = ""
    }
}
