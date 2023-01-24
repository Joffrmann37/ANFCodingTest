//
//  ANFExploreViewModel.swift
//  ANF Code Test
//
//  Created by Joffrey Mann on 1/24/23.
//

import Foundation

class ANFExploreViewModel {
    private var getExploreUseCase: GetExploreUseCase!
    
    init(getExploreUseCase: GetExploreUseCase) {
        self.getExploreUseCase = getExploreUseCase
    }
    
    func getExploreData(completion: @escaping ([ANFExploreModel]?) -> Void) {
        getExploreUseCase.getExploreData { models in
            completion(models)
        }
    }
}
