//
//  WKWebViewContollerViewController.swift
//  Guardener
//
//  Created by Omkar Nikhal.
//

import UIKit
import WebKit

/// The view controller responsible for displaying web content using WKWebView.
class WKWebViewController: UIViewController {
    
    /// The WKWebView used to render and display web content.
    @IBOutlet weak var webView: WKWebView!
    
    /// The URL string representing the web content to be loaded.
    var webURL = ""
    
    override func viewWillAppear(_ animated: Bool) {
        if let nav = navigationController?.navigationBar {
            // Configure navigation bar appearance.
            let standardAppearance = UINavigationBarAppearance()
            standardAppearance.backgroundColor = UIColor.green
            standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            nav.barTintColor = UIColor.black
            nav.standardAppearance = standardAppearance
            nav.scrollEdgeAppearance = standardAppearance
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform the request to load web content.
        self.performRequest(urlString: self.webURL)
    }
    
    /// Perform a URLRequest to load web content in the WKWebView.
    /// - Parameter urlString: The URL string representing the web content to be loaded.
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            
            let request = URLRequest(url: url)
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) { (data, response, error) in
                if error == nil {
                    DispatchQueue.main.async {
                        // Load the request in the WKWebView.
                        self.webView.load(request)
                    }
                } else {
                    // Handle error, if any.
                }
            }
            task.resume()
        }
    }
}
