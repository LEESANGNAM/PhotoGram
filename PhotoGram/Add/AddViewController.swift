//
//  ViewController.swift
//  PhotoGram
//
//  Created by 이상남 on 2023/08/28.
//

import UIKit


class AddViewController: BaseViewController {

    let mainView = AddView()
    
    override func loadView() { // viewDidLoad 보다 먼저 호출됨 super 메서드 호출 x
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver), name: NSNotification.Name("SelectImage"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc func selectImageNotificationObserver(notification: NSNotification){
        print("selectimage")
        print(notification.userInfo?["name"])
        print(notification.userInfo?["sample"])
        
        if let name = notification.userInfo?["name"] as? String {
            mainView.photoImageView.image = UIImage(systemName: name)
        }
        
    }
    let word = ["Apple","Banana","Cookie","Cake","Sky"]
    @objc func searchButtonTapped(){
        
        NotificationCenter.default.post(name: NSNotification.Name("RecommandKeyword"), object: nil, userInfo: ["word":word.randomElement()!])
        present(SearchViewController(), animated: true)
    }
    

    override func setUpView() {
        super.setUpView()
        print("Add ConfigureView")
        mainView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    override func setConstraints() {
        super.setConstraints()
        print("Add setConstraints")
       
    }
    

}

