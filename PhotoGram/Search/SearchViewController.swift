//
//  SearchViewController.swift
//  PhotoGram
//
//  Created by 이상남 on 2023/08/28.
//

import UIKit

class SearchViewController: BaseViewController {
    
    let mainView = SearchView()
    
    // 델리게이트 타입 선언
    var delegate: ImagePassDelegate?
   
    let imageList = ["pencil","star","star.fill","xmark","person.circle"]
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(recommandKeywordNotificationObserver), name: NSNotification.Name("RecommandKeyword"), object: nil)
        mainView.searchBar.becomeFirstResponder()
        mainView.searchBar.delegate = self
        
    }
    
    @objc func recommandKeywordNotificationObserver(notification: NSNotification){
        if let word = notification.userInfo?["word"] as? String {
            mainView.searchBar.text = word
        }
    }

    override func setUpView() {
        super.setUpView()
        
    }
    override func setConstraints() {
        super.setConstraints()
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
}
extension SearchViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mainView.searchBar.resignFirstResponder()
    }
}


extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        cell.imageView.image = UIImage(systemName: imageList[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(imageList[indexPath.item])
//        NotificationCenter.default.post(name: NSNotification.Name("SelectImage"), object: nil, userInfo: ["name":imageList[indexPath.item],"sample":"고래밥"])
        
        // 값 넘겨
        delegate?.receiveDate(systemName: imageList[indexPath.item])
        
        dismiss(animated: true)
    }
    
}
