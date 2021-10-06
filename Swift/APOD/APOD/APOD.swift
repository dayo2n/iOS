//
//  APOD.swift
//  APOD
//
//  Created by 문다 on 2021/09/19.
//

import Foundation

struct APOD: Decodable {
    let title: String
    let date: String
    let description: String
    let type: String
    let url: String
    
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case date = "date"
        case description = "explanation"
        case type = "media_type"
        case url = "url"
    }
}
