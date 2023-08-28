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

}
