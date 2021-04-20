//
//  TextData.swift
//  Ass2-Instagram
//
//  Created by 권준상 on 2021/04/20.
//

import UIKit

struct TextData: Codable {
    var username: String
    var content: String
    
    init() {
        self.username = "ground_ssu"
        self.content = "인스타그램 클론코딩을 하고 있습니다"
    }
}
