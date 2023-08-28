//
//  SearchView.swift
//  PhotoGram
//
//  Created by 이상남 on 2023/08/28.
//

import Foundation
import UIKit

class SearchView: BaseView {
    let searchBar = {
        let view = UISearchBar()
        view.placeholder = "검색어를 입력해주세요"
        return view
    }()
    
    lazy var collectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        view.collectionViewLayout = collectionViewLayout()
        return view
    }()
    
    func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let size = UIScreen.main.bounds.width - 40
        layout.itemSize = CGSize(width: size / 4 , height: size / 4)
        return layout
    }
    
    override func setUpView() {
        addSubview(searchBar)
        addSubview(collectionView)
    }
    
    override func setConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
        }
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom).offset(20)
        }
    }
    
}
