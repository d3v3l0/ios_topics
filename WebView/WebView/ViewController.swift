//
//  ViewController.swift
//  WebView
//
//  Created by Michael Mellinger on 10/9/18.
//  Copyright © 2018 h4labs. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    private let webView = WKWebView()
    private var goBackButton: UIBarButtonItem!
    
    private func buildView() {
        self.view.backgroundColor = .purple
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(webView)
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
            webView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20),
            webView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            ])
    }
    

    private func loadRemoteUrl(urlStr:String) {
        
        if let url = URL(string: urlStr) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    
    /*
 
     https://stackoverflow.com/questions/24882834/wkwebview-not-loading-local-files-under-ios-8
     */
    private func loadLocalUrl(fileName:String) {
        let fileURL = URL(fileURLWithPath: Bundle.main.path(forResource:fileName, ofType: "html")!)
        
        webView.loadFileURL(fileURL, allowingReadAccessTo: fileURL)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        buildView()
        
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        
        loadRemoteUrl(urlStr: "https://www.apple.com")
//        loadLocalUrl(fileName: "privacy")
    }


}

// MARK: - WKNavigationDelegate

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Starting webpage load")
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finished loading")
//        goBackButton.isEnabled = webView.canGoBack
        title = webView.title

    }
}
