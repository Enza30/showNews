//
//  SearchPresenter.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation


// View to Presenter
protocol SearchPresenterProtocol: class {
    func searchForArticles(by name: String)
    var collectionManager: SearchCollectionViewManagerProtocol? { get set }
    var searchControllerManager: searchControllerManagerProtocol? { get set }
}

// Interactor to Presenter
protocol SearchPresenterInput: class {
    func apiFetchSuccess(articles: [Article])
    func handleError(error: Error)
}

// Manager to Presenter
protocol SearchCollectionViewManagerDelegate: class {
    func cellClicked(article: Article?)
}

// Manager to Presenter
protocol SearchBarManagerDelegate: class {
    func searchClicked(name: String)
}

class SearchPresenter {
    
    weak var view: SearchViewInput?
    var interactor: SearchInteractorInput?
    var router: SearchRouter?
    var collectionManager: SearchCollectionViewManagerProtocol?
    var searchControllerManager: searchControllerManagerProtocol?
    var searchBarDelegate: SearchBarManagerDelegate?
}

extension SearchPresenter: SearchPresenterProtocol {
    
    func searchForArticles(by name: String) {
        view?.showActivityIndicator()
        interactor?.fetchSearchedArticles(filter: name)
    }
}
//
extension SearchPresenter: SearchPresenterInput {
    func apiFetchSuccess(articles: [Article]) {
        view?.hideActivityIndicator()
        self.collectionManager?.setUpCells(articles: articles)
    }

    func handleError(error: Error) {
        view?.hideActivityIndicator()
        self.view?.presentAlert(title: "error", message: error.localizedDescription, action: ActionAlertModel(actionText: "Ok", actionHandler: {}))
    }
}

extension SearchPresenter: SearchCollectionViewManagerDelegate {
    func cellClicked(article: Article?) {
        router?.createWebView(article: article)
    }
}

extension SearchPresenter: SearchBarManagerDelegate {
    func searchClicked(name: String) {
        interactor?.fetchSearchedArticles(filter: name)
    }
}
