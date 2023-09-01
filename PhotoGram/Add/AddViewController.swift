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
//    let word = ["Apple","Banana","Cookie","Cake","Sky"]
    
    let gallay = UIImagePickerController()
    
    override func loadView() { // viewDidLoad 보다 먼저 호출됨 super 메서드 호출 x
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        APIService.shared.callRequest(query: "sky")
//        ClassOpenExample.publicExample()
//        ClassPubliceExample.publicExample()
//        ClassInternalExample.internalExample()
    }
    
    deinit {
        print("deinit",self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        
//        sesacShowActivityViewController(image: UIImage(systemName: "star.fill")!, url: "hello", text: "hi")
        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver), name: .selectImage, object: nil)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("SelectImage"), object: nil)
    }
    override func setUpView() {
        super.setUpView()
        setNaviBar()
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

extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func setNaviBar(){
        self.title = "메인 화면"
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(naviSearchButtonTapped))
        navigationItem.rightBarButtonItem = searchButton
    }
    func setgallay(){
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            print("갤러리 사용불가, 사용자에게 토스트/얼럿")
            return
        }
        gallay.delegate = self
        gallay.sourceType = .photoLibrary // 사진만 가져오는건 권한 설정 필요없다.
//        gallay.allowsEditing = true
        present(gallay, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.mainView.photoImageView.image = image
            dismiss(animated: true)
        }
    }
    // navigationRightButton
    @objc func naviSearchButtonTapped(){
        showActionSheet { actionType in
            switch actionType {
            case .gallay:
                self.setgallay()
            case .web:
                self.present(SearchViewController(), animated: true)
            case .cancle:
                self.dismiss(animated: true)
            }
        }
    }
   
}
// MARK: - notification addTaget Method
extension AddViewController {
    // imageView rightbutton
    @objc func searchButtonTapped(){
//        NotificationCenter.default.post(name: NSNotification.Name("RecommandKeyword"), object: nil, userInfo: ["word":word.randomElement()!])
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func selectImageNotificationObserver(notification: NSNotification){
        print(#function)
        if let name = notification.userInfo?["name"] as? String {
            mainView.photoImageView.image = UIImage(systemName: name)
        }

    }
}
// MARK: - Closuer addTaget Method
extension AddViewController {
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
}

// MARK: - delegatePattern
// 4. protocol 채택 후 구현
extension AddViewController: PassDataDelegate {
    func receiveDate(date: Date) {
        mainView.dateButton.setTitle(DateFormatter.convertDate(date: date), for: .normal)
    }
    // 5. delegate = self
    @objc func dateButtonTapped(){
        let vc = DateViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension AddViewController: ImagePassDelegate {
    func receiveDate(systemName: String) {
        mainView.photoImageView.image = UIImage(systemName: systemName)
    }
    // imageView leftbutton
    // 5. delegate = self
    @objc func leftsearchProtocolButtonTapped(){
        let vc = SearchViewController()
        // 대리자 선언
        vc.delegate = self
       present(vc, animated: true)
    }
}

