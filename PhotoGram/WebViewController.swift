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
    
//    override func loadView() {
//        let webConfiguration = WKWebViewConfiguration()
//        webView = WKWebView(frame: .zero, configuration: webConfiguration)
//        webView.uiDelegate = self
//        view = webView
//    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        
        webView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(100)
        }
        
        
        
        let myURL = URL(string:"https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        // 네비게이션 컨트롤러 투명하다, 스크롤하면 불투명
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBlue
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        
        
        title = "이건웹뷰입니다."
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
