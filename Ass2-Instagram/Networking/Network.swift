//
//  Network.swift
//  Ass2-Instagram
//
//  Created by 권준상 on 2021/04/20.
//

import UIKit
import Alamofire
import SwiftyJSON

class Network {
    
    static let network = Network()
    
    let apiKey = "tmh0YFcBOZhgnFcZ0K3mRQCAPe07sQI3"
    let urlString = "https://api.giphy.com/v1/gifs/random"
    
    func getTextInfo(completion: @escaping (TextData) -> Void) {
        var tmp = TextData()
        let param: Parameters = ["api_key" : "\(self.apiKey)"]
        
        AF.request(urlString, parameters: param)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    do {
                        let json = JSON(value)
                        tmp.username  = "\(json["data"]["id"].stringValue)"
                        tmp.content =
                            "\(json["meta"]["response_id"].stringValue)"
                        completion(tmp)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
    }
    
    func getImageInfo(completion: @escaping (ImageData) -> Void) {
        var tmp = ImageData()
        let param: Parameters = ["api_key" : "\(self.apiKey)"]
        
        AF.request(urlString, parameters: param)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    do {
                        let json = JSON(value)
                        tmp.imageURL  = "\(json["data"]["images"]["480w_still"]["url"].stringValue)"
                        completion(tmp)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
    }
    
}
