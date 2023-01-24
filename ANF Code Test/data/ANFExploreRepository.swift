//
//  ANFExploreRepository.swift
//  ANF Code Test
//
//  Created by Joffrey Mann on 1/24/23.
//

import Foundation

protocol ExploreRepository {
    func getExploreData(completion: @escaping ([ANFExploreModel]?) -> Void)
}

struct ANFExploreRepository: ExploreRepository {
    func getExploreData(completion: @escaping ([ANFExploreModel]?) -> Void) {
        guard let url = URL(string: "https://www.abercrombie.com/anf/nativeapp/qa/codetest/codeTest_exploreData.json") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, res, err in
            do {
                guard let data = data else {
                    return
                }
                var exploreModels = try JSONDecoder().decode([ANFExploreModel].self, from: data)
                for i in 0..<exploreModels.count {
                    exploreModels[i].setImageData { data in
                        if let data = data {
                            exploreModels[i].backgroundImageData = data
                        }
                        if i == exploreModels.count - 1 {
                            completion(exploreModels)
                        }
                    }
                }
            } catch {
                print("Error")
                completion(nil)
            }
        }
        task.resume()
    }
}
