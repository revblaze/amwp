//
//  Script.swift
//  Music
//
//  Created by Justin Bush on 2020-08-11.
//  Copyright © 2020 Justin Bush. All rights reserved.
//

import Foundation

struct Script {
    
    
    // MARK:- Functions
    
    static func toJS(_ code: String) -> String {
        let css = CSS.toString(code)
        let js = "var style = document.createElement('style'); style.innerHTML = '\(css)'; document.head.appendChild(style);"
        return js
    }
    
    /// Grabs CSS from `file` (inside `WebCode`) and outputs the executable JS code
    static func toJS(file: String) -> String {
        let css = CSS.toString(file: file, inDir: "WebCode")
        //let css = JSHelper.cssToString(file: file, inDir: "WebCode")
        let js = "var style = document.createElement('style'); style.innerHTML = '\(css)'; document.head.appendChild(style);"
        return js
    }
    
}
