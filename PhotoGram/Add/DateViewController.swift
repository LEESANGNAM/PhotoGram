//
//  DateViewController.swift
//  PhotoGram
//
//  Created by 이상남 on 2023/08/29.
//

import UIKit

class DateViewController: BaseViewController{
    
    let mainView = DateView()
    
    // delegate pattern 2. protocol 값전달
    var delegate: PassDataDelegate?
    
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //delegate pattern 3. 값 전달 시점 정하기
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // 뷰가 사라질때 값 전달
        delegate?.receiveDate(date: mainView.picker.date)
    }
    
    
    
}
