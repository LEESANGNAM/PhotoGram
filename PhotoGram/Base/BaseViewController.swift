//
//  BaseViewController.swift
//  PhotoGram
//
//  Created by 이상남 on 2023/08/28.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setConstraints()
        // Do any additional setup after loading the view.
    }
    

    func setUpView(){
        view.backgroundColor = .white
        print("base ConfigureView")
    }
    func setConstraints(){
        print("base setConstraints")
    }
    
    func showActionSheet(completionHandeler: @escaping (AlertActionType) -> ()){
        let alert = UIAlertController(title: "어디서!", message: "찾을까요", preferredStyle: .actionSheet)
        let gallery = UIAlertAction(title: "갤러리에서 가져오기", style: .default){action in
            completionHandeler(AlertActionType.gallay)
        }
        let webSearch = UIAlertAction(title: "웹에서 검색하기", style: .default){action in
            completionHandeler(AlertActionType.web)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel){_ in
            completionHandeler(AlertActionType.cancle)
        }
        alert.addAction(gallery)
        alert.addAction(webSearch)
        alert.addAction(cancel)
        
        present(alert,animated: true)
    }

}
