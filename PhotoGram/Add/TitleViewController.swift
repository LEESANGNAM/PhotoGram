//
//  titleViewController.swift
//  PhotoGram
//
//  Created by 이상남 on 2023/08/29.
//

import UIKit

class TitleViewController: BaseViewController {
    let textField = {
        let view = UITextField()
        view.placeholder = "제목을 입력하세요"
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.systemGreen.cgColor
        return view
    }()
    //1. 클로저 값전달 준비
    var completionHandler: ((String,Int,Bool) -> Void)?
    
    
    
    override func setUpView() {
        super.setUpView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonTapped))
        view.addSubview(textField)
    }
    @objc func doneButtonTapped(){
        completionHandler?(textField.text!,800,false)
        navigationController?.popViewController(animated: true)
    }
    override func setConstraints() {
        textField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //2.데이터 전달 시점에 함수 호출
        completionHandler?(textField.text!,20,true)
    }
    
}
