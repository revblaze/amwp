//
//  ViewController.swift
//  Music
//
//  Created by Justin Bush on 2020-08-11.
//  Copyright © 2020 Justin Bush. All rights reserved.
//

import UIKit
import WebKit

/// When `true`, enables debug functions and console logs
let debug = true

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate, UIScrollViewDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initWebView()
        topConstraint.constant = 44
    }
    
    func initWebView() {
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.customUserAgent = Client.userAgent          // Set Client UserAgent
        // WebView Configuration
        let config = webView.configuration
        config.applicationNameForUserAgent = Client.name    // Set Client Name
        config.preferences.javaScriptEnabled = true         // Enable JavaScript
        // ScrollView Setup
        webView.scrollView.delegate = self
        webView.scrollView.isScrollEnabled = true           // Enable Scroll
        webView.scrollView.keyboardDismissMode = .onDrag    // Hide Keyboard on WebView Drag
        webView.scrollView.alwaysBounceHorizontal = false
        webView.scrollView.showsHorizontalScrollIndicator = false
        // Load Apple Music Web Player
        webView.load(Music.url)
    }
    
    var wasCalled = false
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        if !wasCalled {
            let js = Script.toJS(file: "style")
            webView.evaluateJavaScript(js, completionHandler: nil)
            wasCalled = true
        }
        Debug.log("webView didCommit")
    }
    
    
    
    
    // MARK: Rotation Handler
    // Device did change orientation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            Debug.log("New Orientation: Landscape")
            topConstraint.constant = WKManager.getTop(false)
        } else {
            Debug.log("New Orientation: Portrait")
            topConstraint.constant = WKManager.getTop(true)
        }
    }


}

