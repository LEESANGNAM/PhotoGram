//
//  SearchCollectionViewCell.swift
//  PhotoGram
//
//  Created by 이상남 on 2023/08/28.
//

import UIKit

class SearchCollectionViewCell: BaseCollectionViewCell {
    
    let imageView = {
        let image = UIImageView()
        image.backgroundColor = .lightGray
        image.contentMode = .scaleToFill
        return image
    }()
    
    
    override func setUpView() {
        contentView.addSubview(imageView)
    }
    
    override func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }

}
