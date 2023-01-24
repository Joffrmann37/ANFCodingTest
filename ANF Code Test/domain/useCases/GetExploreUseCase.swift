//
//  GetExploreUseCase.swift
//  ANF Code Test
//
//  Created by Joffrey Mann on 1/24/23.
//

import Foundation

protocol GetExploreUseCase {
    func getExploreData(completion: @escaping ([ANFExploreModel]?) -> Void)
}

struct GetExplore: GetExploreUseCase {
    let exploreRepository: ANFExploreRepository
    
    init(exploreRepository: ANFExploreRepository) {
        self.exploreRepository = exploreRepository
    }
    
    func getExploreData(completion: @escaping ([ANFExploreModel]?) -> Void) {
        exploreRepository.getExploreData { models in
            completion(models)
        }
    }
}
