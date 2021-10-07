//
//  APIService.swift
//  APOD
//
//  Created by 문다 on 2021/09/19.
//

import Foundation
class APIService {
    static let apiKey = "" // NASA API key
    static let fetchCount = 10
    static let apiURL = "https://api.nasa.gov/planetary/apod?api_key=\(apiKey)&count=\(fetchCount)"

    static func fetchAPOD(completion: @escaping ([APOD]) -> ()) {
        URLSession.shared.dataTask(with: URL(string: apiURL)!) { data, response, error in
            if let _ = error { return }
            guard let data = data else { return  }
                                                    // decoding APOD into Array
            guard let responses = try? JSONDecoder().decode([APOD].self, from: data) else { return }
            completion(responses.filter{ $0.type == "image" })
        }.resume()
    }
    
    static func fetchData(url: String, completion: @escaping (Data) -> ()) {
        guard let url = URL(string: url),
              let data = try? Data(contentsOf: url) else { return }
        completion(data)
    }
}
