//
//  SearchInteractor.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation

//presenter to interactor
protocol SearchInteractorInput: class {
    func fetchSearchedArticles(filter: String)
}

class SearchInteractor: SearchInteractorInput {
    
    weak var presenter: SearchPresenterInput?
    var apiManager: NetworkService<ArticleEndpoint>?
    
    func fetchSearchedArticles(filter: String) {
        apiManager?.networkRequest(from: .searchForArticles(searchFilter: filter), modelType: ArticlesModel.self) { [weak self] (result) in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let searchModel):
                    self?.presenter?.apiFetchSuccess(articles: searchModel.articles)
                case .failure(let error):
                    self?.presenter?.handleError(error: error)
                }
            }
            
        }
    }
}
