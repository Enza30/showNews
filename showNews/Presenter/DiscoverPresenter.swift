//
//  DiscoverPresenter.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation

// view to presenter
protocol DiscoverPresenterProtocol: class {
    func viewDidLoad()
    var collectionManager: DiscoverCollectionViewManagerProtocol? { get set }
    
}

//interactor to presenter
protocol DiscoverPresenterInput: class {
    func apiFetchSuccess(articles: [Article])
    func handleError(error: Error)
}


//manager to presenter
protocol DiscoverCollectionViewManagerDelegate: class {
    func cellClicked(article: Article?)
}

class DiscoverPresenter {
    
    weak var view: DiscoverViewInput?
    var interactor: DiscoverInteractorInput?
    var router: DiscoverRouterProtocol?
    var collectionManager: DiscoverCollectionViewManagerProtocol?
    
}

//MARK: - DiscoverPresenterProtocol
extension DiscoverPresenter: DiscoverPresenterProtocol {
    func viewDidLoad() {
        view?.showActivityIndicator()
        interactor?.fetchTrendingArticles()
    }
    
}

//MARK: - DiscoverPresenterInput
extension DiscoverPresenter: DiscoverPresenterInput {
    func apiFetchSuccess(articles: [Article]) {
        view?.hideActivityIndicator()
        view?.hideRefreshIndicator()
        self.collectionManager?.setupChats(articles: articles)
    }
    
    func handleError(error: Error) {
        view?.hideActivityIndicator()
        self.view?.presentAlert(title: "error", message: error.localizedDescription, action: ActionAlertModel(actionText: "Ok", actionHandler: {}))
    }
    
    
}


//MARK: - DiscoverCollectionViewManagerDelegate
extension DiscoverPresenter: DiscoverCollectionViewManagerDelegate {
    func cellClicked(article: Article?) {
        router?.createWebView(article: article)
    }
    
    
}

