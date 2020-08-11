//
//  WKManager.swift
//  Music
//
//  Created by Justin Bush on 2020-08-11.
//  Copyright © 2020 Justin Bush. All rights reserved.
//

import UIKit

struct WKManager {
    
    static func getTop(_ portrait: Bool) -> CGFloat {
        if portrait { return 44 }
        else { return 0 }
    }
    
    /*
    static func get(_ mode: WKConstraints) -> CGFloat {
        if Device.isPhone() && Device.isPortrait() {
            return WKConstraints.portrait.top
        }
    }
    */
    
}

enum WKConstraints {
    
    case portrait
    case landscape
    
    var top: CGFloat {
        switch self {
        case .portrait:     return 44
        case .landscape:    return 0
        }
    }
    
    var bottom: CGFloat {
        switch self {
        case .portrait:     return 20
        case .landscape:    return 20
        }
    }
    
}
