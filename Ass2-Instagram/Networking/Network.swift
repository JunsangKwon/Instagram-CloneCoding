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
    
    static let shared = Network()
    
    let apiKey = "tmh0YFcBOZhgnFcZ0K3mRQCAPe07sQI3"
    let apiUrlString = "https://api.giphy.com/v1/gifs/random"
    
    func getTextData(completion: @escaping (TextData) -> Void) {
        var data = TextData()
        let param: Parameters = ["api_key" : "\(self.apiKey)"]
        
        AF.request(apiUrlString, parameters: param)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    do {
                        let json = JSON(value)
                        data.username  = "\(json["data"]["id"].stringValue)"
                        data.content =
                            "\(json["meta"]["response_id"].stringValue)"
                        completion(data)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
    }
    
    func getImageData(completion: @escaping (UIImage) -> Void) {
        let param: Parameters = ["api_key" : "\(self.apiKey)"]
        
        AF.request(apiUrlString, parameters: param)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    do {
                        var data: UIImage
                        let json = JSON(value)
                        let imageURL  = "\(json["data"]["images"]["480w_still"]["url"].stringValue)"
                        data = self.loadImage(imageURL)
                        completion(data)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
    }
    
    func getApiData(completion: @escaping (ApiData) -> Void) {
        let param: Parameters = ["api_key" : "\(self.apiKey)"]
        var data = ApiData()
        
        AF.request(apiUrlString, parameters: param)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    do {
                        let json = JSON(value)
                        data.username  = "\(json["data"]["id"].stringValue)"
                        data.content =
                            "\(json["meta"]["response_id"].stringValue)"
                        let imageURL  = "\(json["data"]["images"]["480w_still"]["url"].stringValue)"
                        data.img = self.loadImage(imageURL)
                        completion(data)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
    }
    
    func loadImage(_ url: String?) -> UIImage {
        let data = NSData(contentsOf: NSURL(string: url!)! as URL)
        var image: UIImage?
        if (data != nil){
            image = UIImage(data: data! as Data)
        }
        return image!
    }
    
}
