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
    let titleButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("오늘의 사진", for: .normal)
        return button
    }()
    let contentButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("컨텐츠", for: .normal)
        return button
    }()
    let titleTextView = {
        let view = UITextView()
        view.textColor = .white
        view.font = .systemFont(ofSize: 30)
        view.backgroundColor = .systemIndigo
        return view
    }()
    
    
    
    override func setUpView() {
        addSubview(photoImageView)
        addSubview(searchButton)
        addSubview(leftsearchProtocolButton)
        addSubview(dateButton)
        addSubview(titleButton)
        addSubview(contentButton)
        addSubview(titleTextView)
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
        titleButton.snp.makeConstraints { make in
            make.top.equalTo(dateButton.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        contentButton.snp.makeConstraints { make in
            make.top.equalTo(titleButton.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        titleTextView.snp.makeConstraints { make in
            make.top.equalTo(contentButton.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
}
