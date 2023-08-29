//
//  DateView.swift
//  PhotoGram
//
//  Created by 이상남 on 2023/08/29.
//
import UIKit

class DateView: BaseView {
    
    let picker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .wheels
        picker.datePickerMode = .date
        return picker
    }()
    
    override func setUpView() {
        addSubview(picker)
    }
    
    override func setConstraints() {
        picker.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        
    }
    
}
