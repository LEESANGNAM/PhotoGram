//
//  ContentViewController.swift
//  PhotoGram
//
//  Created by 이상남 on 2023/08/29.
//

import UIKit

class ContentViewController: BaseViewController {
    let textView = {
        let view = UITextView()
        view.backgroundColor = .systemBlue
        view.font = .systemFont(ofSize: 20)
        return view
    }()
    //1. 클로저 값전달 준비
    var completionHandler: ((String) -> Void)?
    
    override func setUpView() {
        super.setUpView()
        
        view.addSubview(textView)
    }
    
    override func setConstraints() {
        textView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(250)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //2.데이터 전달 시점에 함수 호출
        completionHandler?(textView.text)
    }
    
}
