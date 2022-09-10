//
//  SourcesInteractor.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation

//Presenter To Interactor
protocol SourcesInteractorInput: class {
   func fetchTrendingSources()
}

class SourcesInteractor: SourcesInteractorInput {
    weak var presenter: SourcesPresenterInput?
    var apiManager: NetworkService<ArticleEndpoint>?
    
    func fetchTrendingSources() {
        apiManager?.networkRequest(from: .getSources, modelType: SourcesModel.self, completion: { [weak self] (result) in
            DispatchQueue.main.async {[weak self] in
                switch result {
                case .success(let sourcesModel):
                    self?.presenter?.apiFetchSuccess(sources: sourcesModel.sources)
                case .failure(let error):
                    self?.presenter?.handleError(error: error)
                }
            }
        })
    }
}

