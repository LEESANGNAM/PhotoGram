//
//  URLSessionViewController.swift
//  PhotoGram
//
//  Created by 이상남 on 2023/08/30.
//

import UIKit


class URLSessionViewController: UIViewController {
    
    var session: URLSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://apod.nasa.gov/apod/image/2308/M66_JwstTomlinson_3521.jpg")
        
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        session.dataTask(with: url!).resume()
        
        
        
    }
    
}

extension URLSessionViewController: URLSessionDataDelegate{
    // 서버에서 최초로 응답 받은 경우에 호출   //총 용량 확인가능 100MB
//    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
//        print("resoponse: ",response)
//    }
    // 서버에서 데이터 받을 때 마다 반복적으로 호출
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print("Data: ",data) //1600
    }
    //서버에서 응답이 완료가 된 이후에 호출
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("End")
    }
}
