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
    
    
    
    
    func callRequest(){
        let url = URL(string: "https://apod.nasa.gov/apod/image/2308/M66_JwstTomlinson_3521.jpg")
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            print("data: ",data)
            
            let value = String(data: data!, encoding: .utf8)
            
            print("value: ",value)
            
            print("response: ",response)
            print("error: ",error)
        }.resume()
    }
    
}
