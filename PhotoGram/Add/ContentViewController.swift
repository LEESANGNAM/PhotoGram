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
    let sampleView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    let sampleView2 = {
        let view = UIView()
        view.backgroundColor = .systemRed
        return view
    }()
    
    //1. 클로저 값전달 준비
    var completionHandler: ((String) -> Void)?
    
    deinit {
        print("deinit",self)
    }
    
    func setAnimation(){
        //시작
        sampleView.alpha = 0
        sampleView2.alpha = 0
        //끝
        UIView.animate(withDuration: 2, delay: 2, options: [.curveLinear]) {
            self.sampleView.alpha = 1
            self.sampleView.backgroundColor = .systemGreen
        } completion: { bool in
            UIView.animate(withDuration: 2) {
                self.sampleView2.alpha = 1
            }
        }

    }
    
    override func setUpView() {
        super.setUpView()
        
        view.addSubview(textView)
        view.addSubview(sampleView)
        view.addSubview(sampleView2)
        setAnimation()
    }
    
    override func setConstraints() {
        textView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(250)
        }
        sampleView.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.center.equalTo(view)
        }
        sampleView2.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.top.equalTo(sampleView.snp.top)
            make.trailing.equalTo(sampleView.snp.leading).offset(-20)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //2.데이터 전달 시점에 함수 호출
        completionHandler?(textView.text)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.sampleView2.alpha = 1.0
            UIView.animate(withDuration: 0.3) {
                self.sampleView2.alpha = 0.5
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.sampleView2.alpha = 0.5
            UIView.animate(withDuration: 0.3) {
                self.sampleView2.alpha = 1
            }
        }
    }
    
}
