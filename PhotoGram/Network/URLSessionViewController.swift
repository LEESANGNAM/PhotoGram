//
//  URLSessionViewController.swift
//  PhotoGram
//
//  Created by 이상남 on 2023/08/30.
//

import UIKit


class URLSessionViewController: UIViewController {
    
    var session: URLSession!
    
    var total: Double = 0 // 총 데이터 양
    
    var buffer: Data? = Data(){
        didSet{
            let result = Double(buffer?.count ?? 0) / total
            progressLabel.text = "\(Int(result * 100))%"    //\(String(format: "%.1f", result * 100))% 소수점 .1
            print (buffer?.count,total)
        }
    }
     
    
    let progressLabel = {
        let view = UILabel()
        view.backgroundColor = .black
        view.textColor = .white
        return view
    }()
    
    let imageView = {
        let view = UIImageView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        buffer =  //buffer?.append(data) 실행되기 위해서
        
        view.addSubview(progressLabel)
        view.addSubview(imageView)
        
        progressLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(100)
        }
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(200)
        }
        view.backgroundColor = .white
        
        
        
        let url = URL(string: "https://apod.nasa.gov/apod/image/2308/M66_JwstTomlinson_3521.jpg")
        
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .main) // main에서 처리
        session.dataTask(with: url!).resume()
        
        
        
    }
    //사진다운로드 취소버튼? 다른뷰 이동? 중지 해야햔다
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //취소 액션 (화면이 사라질 때 등)
        // 리소스 정리, 실행중인 것도 무시.
        session.invalidateAndCancel()
        
        // 기다렸다가 리소스 끝나면 정리.
        session.finishTasksAndInvalidate()
    }
    
}

extension URLSessionViewController: URLSessionDataDelegate{
    // 서버에서 최초로 응답 받은 경우에 호출   //총 용량 확인가능 100MB
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
        print("resoponse: ",response)
        
        if let response = response as? HTTPURLResponse,
           (200...500).contains(response.statusCode){
            total = Double(response.value(forHTTPHeaderField: "Content-Length")!)!
            return .allow
        }else{
            return .cancel
        }
    
    }
    // 서버에서 데이터 받을 때 마다 반복적으로 호출
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print("Data: ",data) //1600
        buffer?.append(data)
    }
    //서버에서 응답이 완료가 된 이후에 호출
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("End")
        
        if let error{ // 에러가 있을 수도~
            print(error)
        } else {
            guard let buffer = buffer else {
                print(error)
                return
            }
            imageView.image = UIImage(data: buffer)
        }
    }
}
