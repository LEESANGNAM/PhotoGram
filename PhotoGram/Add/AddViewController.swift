//
//  ViewController.swift
//  PhotoGram
//
//  Created by 이상남 on 2023/08/28.
//

import UIKit
import SeSacPhotoFramework

//delegate pattern  1.프로토콜 생성
protocol PassDataDelegate {
    func receiveDate(date: Date)
}
protocol ImagePassDelegate {
    func receiveDate(systemName:String)
}


class AddViewController: BaseViewController {

    let mainView = AddView()
    
    override func loadView() { // viewDidLoad 보다 먼저 호출됨 super 메서드 호출 x
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        ClassOpenExample.publicExample()
//        ClassPubliceExample.publicExample()
//        ClassInternalExample.internalExample()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        
//        sesacShowActivityViewController(image: UIImage(systemName: "star.fill")!, url: "hello", text: "hi")
//        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver), name: .selectImage, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("SelectImage"), object: nil)
    }
    
//    @objc func selectImageNotificationObserver(notification: NSNotification){
//        print(#function)
//        if let name = notification.userInfo?["name"] as? String {
//            mainView.photoImageView.image = UIImage(systemName: name)
//        }
//
//    }
    let word = ["Apple","Banana","Cookie","Cake","Sky"]
    @objc func searchButtonTapped(){
        
//        NotificationCenter.default.post(name: NSNotification.Name("RecommandKeyword"), object: nil, userInfo: ["word":word.randomElement()!])
        navigationController?.pushViewController(SearchViewController(), animated: true)
    }
    // 5. delegate = self
    @objc func dateButtonTapped(){
        let vc = DateViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    // 5. delegate = self
    @objc func leftsearchProtocolButtonTapped(){
        let vc = SearchViewController()
        // 대리자 선언
        vc.delegate = self
       present(vc, animated: true)
    }
    //클로저
    @objc func titleButtonTapped(){
        let vc = TitleViewController()
        // 클로저 함수
        vc.completionHandler = { text,num,push in
            self.mainView.titleButton.setTitle(text, for: .normal)
            print("test: ",text,"num : ",num,"push : ",push)
            print("completionHandler")
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    //클로저
    @objc func contentButtonTapped(){
        let vc = ContentViewController()
        // 클로저 함수
        vc.completionHandler = { text in
            self.mainView.titleTextView.text = text
            print("completionHandler")
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    

    override func setUpView() {
        super.setUpView()
        print("Add ConfigureView")
        mainView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        mainView.leftsearchProtocolButton.addTarget(self, action: #selector(leftsearchProtocolButtonTapped), for: .touchUpInside)
        mainView.dateButton.addTarget(self, action: #selector(dateButtonTapped), for: .touchUpInside)
        mainView.titleButton.addTarget(self, action: #selector(titleButtonTapped), for: .touchUpInside)
        mainView.contentButton.addTarget(self, action: #selector(contentButtonTapped), for: .touchUpInside)
    }
    override func setConstraints() {
        super.setConstraints()
        print("Add setConstraints")
       
    }
}

// 4. protocol 채택 후 구현
extension AddViewController: PassDataDelegate {
    func receiveDate(date: Date) {
        mainView.dateButton.setTitle(DateFormatter.convertDate(date: date), for: .normal)
    }
}

extension AddViewController: ImagePassDelegate {
    func receiveDate(systemName: String) {
        mainView.photoImageView.image = UIImage(systemName: systemName)
    }
}

