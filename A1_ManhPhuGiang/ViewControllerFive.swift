//
//  ViewControllerFive.swift
//  A1_ManhPhuGiang
//
//  Created by ManhPhu Giang on 2025-02-17.
//

import Foundation
import UIKit
import WebKit

class ViewControllerFive: UIViewController {
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let sheridanURL = URL(string: "https://www.sheridancollege.ca")!

        webView = WKWebView(frame: view.frame)
        view.addSubview(webView)

        let myRequest = URLRequest(url: sheridanURL)
        webView.load(myRequest)
    }
}
