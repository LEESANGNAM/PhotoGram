//
//  AddView.swift
//  PhotoGram
//
//  Created by 이상남 on 2023/08/28.
//

import UIKit

class AddView: BaseView {
    
    let photoImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemYellow
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let searchButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray
        return button
    }()
    let leftsearchProtocolButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray
        return button
    }()
    
    let dateButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle(DateFormatter.today(), for: .normal)
        return button
    }()
    
    
    
    override func setUpView() {
        addSubview(photoImageView)
        addSubview(searchButton)
        addSubview(leftsearchProtocolButton)
        addSubview(dateButton)
    }
    
    override func setConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.topMargin.leadingMargin.trailingMargin.equalTo(self.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(self).multipliedBy(0.3)
        }
        
        searchButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.bottom.trailing.equalTo(photoImageView)
        }

        leftsearchProtocolButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.bottom.leading.equalTo(photoImageView)
        }
        
        dateButton.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
    }
    
}
