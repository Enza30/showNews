//
//  DiscoverInteractor.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation


//presenter to interactor
protocol DiscoverInteractorInput: class {
   func fetchTrendingArticles()
}

class DiscoverInteractor: DiscoverInteractorInput {
    
    weak var presenter: DiscoverPresenterInput?
    var apiManager: NetworkService<ArticleEndpoint>?
    var endpoint: ArticleEndpoint?
    
    func fetchTrendingArticles() {
        guard let endpoint = self.endpoint else { return }
        apiManager?.networkRequest(from: endpoint, modelType: ArticlesModel.self, completion: { [weak self] (result) in
            DispatchQueue.main.async {[weak self] in
                switch result {
                case .success(let articleModel):
                    self?.presenter?.apiFetchSuccess(articles: articleModel.articles)
                case .failure(let error):
                    self?.presenter?.handleError(error: error)
                }
            }
        })
        
    }
}

