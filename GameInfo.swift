//
//  GameInfo.swift
//  Brain Workout
//
//  Created by Ranjith Vaddella on 2/5/18.
//  Copyright © 2018 Om. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class GameInfo : UIViewController, WKUIDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
   /* override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "Rules", ofType: "pdf")
        let url = URL(fileURLWithPath: path!)
        let request = URLRequest(url:url)
        
        webView.load(request)
        
    }

    
}
