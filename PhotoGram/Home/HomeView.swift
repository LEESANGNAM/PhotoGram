//
//  HomeView.swift
//  PhotoGram
//
//  Created by 이상남 on 2023/08/31.
//

import UIKit

class HomeView: BaseView {
    
    weak var delegate: HomeViewProtocol?
    
    lazy var collectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        view.collectionViewLayout = collectionViewLayout()
//        view.delegate = self
//        view.dataSource = self
        return view
    }()
    
    private func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        let size = UIScreen.main.bounds.width - 32
        layout.itemSize = CGSize(width: size / 3 , height: size / 3)
        return layout
    }
    override func setUpView() {
        addSubview(collectionView)
    }
    override func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

