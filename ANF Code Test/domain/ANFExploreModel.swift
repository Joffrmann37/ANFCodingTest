//
//  ANFExploreModel.swift
//  ANF Code Test
//
//  Created by Joffrey Mann on 1/24/23.
//

import Foundation

struct ANFExploreModel: Codable {
    let title: String
    let backgroundImage: String
    let content: [ANFExploreContent]?
    let promoMessage: String?
    let topDescription: String?
    let bottomDescription: String?
    var backgroundImageData: Data?
    
    mutating func setImageData(completion: @escaping (Data?) -> Void) {        
        guard let url = URL(string: backgroundImage) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.downloadTask(with: url) { localUrl, response, error in
            guard let localUrl = localUrl else {
                completion(nil)
                return
            }
            do {
                let data = try Data(contentsOf: localUrl)
                completion(data)
            } catch let parsingError {
                print(parsingError)
                completion(nil)
            }
        }
        task.resume()
    }
}

struct ANFExploreContent: Codable {
    let target: String
    let title: String
    let elementType: String?
}
