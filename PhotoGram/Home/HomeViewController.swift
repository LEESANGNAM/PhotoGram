//
//  HomeViewController.swift
//  PhotoGram
//
//  Created by 이상남 on 2023/08/31.
//

import UIKit
//AnyObject: 클래스에서만 프로토콜을 정의 할 수 있도록 제약
protocol HomeViewProtocol: AnyObject {
    func didSelectItemAt(indexPath: IndexPath) // 셀을 누르면 넘겨줄거다!
}


class HomeViewController: BaseViewController {
    
    var list: Photo = Photo(total: 0, total_pages: 0, results: [])
    let mainView = HomeView()
    override func loadView() {
        //뷰에 접근 할 필요가 없어서 넣어놨다.
        //        view.delegate = self //내가 델리게이트 한다.!
        self.view = mainView //super금지 : 커스텀뷰를 루트로 바꾸는데 super를 호출하면 애플이 만든 UIView가 호출 되기 때문이다.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self,#function)
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        APIService.shared.callRequest(query: "apple") { data in
            guard let data = data else {
                print("ALERT Error")
                return
            }
            print("API END")
            self.list = data
            self.mainView.collectionView.reloadData()
            
            
            
        }
    }
    deinit {
        print(self,#function)
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else {return UICollectionViewCell()}
        cell.imageView.backgroundColor = .systemBlue
        let thumb = list.results[indexPath.item].urls.thumb
        let url = URL(string: thumb) // 링크를 기반으로 이미지를 보여준다? -> 네트워크 통신임~
        DispatchQueue.global().async {
            let data = try! Data(contentsOf: url!) // 동기 코드
            DispatchQueue.main.async {
                cell.imageView.image = UIImage(data: data)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
        
        //        delegate?.didSelectItemAt(indexPath: indexPath)
        
    }
    
    
}


extension HomeViewController: HomeViewProtocol{
    func didSelectItemAt(indexPath: IndexPath) {
        print(indexPath)
        navigationController?.popViewController(animated: true)
    }
    
    
}

