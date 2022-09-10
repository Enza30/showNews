//
//  WebPagePresenter.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation

// View To Presenter
protocol WebPagePresenterProtocol: class {
    func viewDidLoad()
    func saveArticle()
    func isArticleSaved()
}

// Interactor To Presenter
protocol WebPagePresenterInput: class {
    func changeFavouriteState(state: Bool)
    func isArticleSaved(state: Bool)
}

class WebPagePresenter {
    
    weak var view: WebPageViewInput?
    var urlString: String?
    var article: Article?
    var interactor: WebPageInteractorProtocol?
}

extension WebPagePresenter: WebPagePresenterProtocol {

    func viewDidLoad() {
        guard let urlString = self.urlString else { return }
        self.view?.showWebPage(url: urlString)
        self.isArticleSaved()
    }
    
    func saveArticle() {
        interactor?.saveArticle(article: article)
    }
    
    func isArticleSaved() {
        interactor?.isArticleSaved(article: article)
    }
    
}

extension WebPagePresenter: WebPagePresenterInput {
    func changeFavouriteState(state: Bool) {
        view?.changeFavouriteState(state: state)
    }
    
    func isArticleSaved(state: Bool) {
        view?.changeFavouriteState(state: state)
    }
}

