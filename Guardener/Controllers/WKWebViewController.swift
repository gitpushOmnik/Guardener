//
//  WKWebViewContollerViewController.swift
//  Guardener
//
//  Created by Omkar Nikhal.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var webURL = ""

    
    override func viewWillAppear(_ animated: Bool) {
        if let nav = navigationController?.navigationBar{
            let standardAppearance = UINavigationBarAppearance()
            standardAppearance.backgroundColor = UIColor.green
            standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
            nav.barTintColor = UIColor.black
            nav.standardAppearance = standardAppearance
            nav.scrollEdgeAppearance = standardAppearance
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            self.performRequest(urlString: self.webURL)
        
        
    
    }
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString){
            
            let request = URLRequest(url: url)
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) {
                (data,response,error) in
                if error == nil {
                    DispatchQueue.main.async {
                        self.webView.load(request)
                    }
                }
                else {
                    
                }
            }
            task.resume()
        }
    }
    
}
