//
//  HomeViewController.swift
//  PhotoGram
//
//  Created by 이상남 on 2023/08/31.
//

import Foundation
//AnyObject: 클래스에서만 프로토콜을 정의 할 수 있도록 제약
protocol HomeViewProtocol: AnyObject {
    func didSelectItemAt(indexPath: IndexPath) // 셀을 누르면 넘겨줄거다!
}


class HomeViewController: BaseViewController {
    
    override func loadView() {
        let view = HomeView()  //뷰에 접근 할 필요가 없어서 넣어놨다.
        view.delegate = self //내가 델리게이트 한다.!
        self.view = view //super금지 : 커스텀뷰를 루트로 바꾸는데 super를 호출하면 애플이 만든 UIView가 호출 되기 때문이다.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self,#function)
    }
    deinit {
        print(self,#function)
    }
    
    
}

extension HomeViewController: HomeViewProtocol{
    func didSelectItemAt(indexPath: IndexPath) {
        print(indexPath)
        navigationController?.popViewController(animated: true)
    }
    
    
}
