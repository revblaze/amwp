//
//  WKManager.swift
//  Music
//
//  Created by Justin Bush on 2020-08-11.
//  Copyright © 2020 Justin Bush. All rights reserved.
//

import Foundation

struct WKManager {
    
    //static let
    
}

enum WKConstraints {
    
    case portrait
    case landscape
    
    var topConstant: CGFloat {
        switch self {
        case .portrait: return 44
        case .landscape: return 0
        }
    }
    
}
