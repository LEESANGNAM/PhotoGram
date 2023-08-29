//
//  WebViewController.swift
//  PhotoGram
//
//  Created by 이상남 on 2023/08/29.
//

import UIKit
import WebKit


class WebViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    func reloadButtonTapped(){
        webView.reload() // 새로고침
    }
    
    func goBackButtonTapped(){
        if webView.canGoBack{
            webView.goBack()
        }
    }
    
    func goForwardButtonTapped(){
        if webView.canGoForward{
            webView.goForward()
        }
    }
    
}
