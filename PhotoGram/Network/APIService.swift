//
//  APIService.swift
//  PhotoGram
//
//  Created by 이상남 on 2023/08/30.
//

import Foundation


class APIService {
    
    static let shared = APIService()
    
    private init() { }
    
    
    func callRequest(query: String,completionHandler: @escaping (Photo?) -> Void ){
        guard let url = URL(string: "https://api.unsplash.com/search/photos?query=\(query)&client_id=\(APIKey.unSplashKey)") else { return }
        let request = URLRequest(url: url,timeoutInterval: 10)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                if let error {
                    print(error)
                    completionHandler(nil)
                    return
                }
                
                guard let response = response as? HTTPURLResponse,
                      (200...500).contains(response.statusCode) else {
                    print(error) //나중에 alert 또는 do try chtch
                    return
                }
                
                guard let data = data else {
                    completionHandler(nil)
                    return
                    
                }
                
                do {
                    let result = try JSONDecoder().decode(Photo.self, from: data)
                    completionHandler(result)
                    print(result)
                }catch {
                    completionHandler(nil) // 디코딩 오류 키
                }
                
            }
            
        }.resume()
        
    }
    
}
