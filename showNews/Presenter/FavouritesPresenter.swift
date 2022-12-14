//
//  FavouritesPresenter.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation
import UIKit

//view to presenter
protocol FavouritesPresenterProtocol: class {
    var collectionManager: FavouritesCollectionViewManagerProtocol? { get set }
    func signOut()
    func viewDidAppear()
}

// Interactor to Presenter
protocol FavouritesPresenterInput: class {
    func ApiFetchSuccess(articles: [Article])
    func handleError(error: Error)
}

// SearchBar Manager to Presenter
protocol FavouritesSearchBarManagerDelegate: class {
    func queryArticles(name: String)
}

//collectionViewManager to presenter
protocol FavouritesCollectionViewManagerDelegate: class {
    func cellClicked(article: Article?)
    func addPhotoTapped()
    var searchBarManager: FavouritesSearchBarManagerProtocol? { get set }
}

class FavouritesPresenter {
    
    weak var view: FavouritesViewInput?
    var interactor: FavouritesInteractorInput?
    var searchBarDelegate: FavouritesSearchBarManagerDelegate?
    var searchBarManager: FavouritesSearchBarManagerProtocol?
    var collectionManager: FavouritesCollectionViewManagerProtocol?
    
    
    var router: FavouritesRouter?
    var articles: [Article]?
}

extension FavouritesPresenter: FavouritesPresenterInput {
    func ApiFetchSuccess(articles: [Article]) {
        view?.hideActivityIndicator()
        self.collectionManager?.setUpCells(articles: articles)
    }
    
    func handleError(error: Error) {
        view?.hideActivityIndicator()
        self.view?.presentAlert(title: "error", message: error.localizedDescription, action: ActionAlertModel(actionText: "Ok", actionHandler: {}))
    }
}

extension FavouritesPresenter: FavouritesPresenterProtocol {

    
    func viewDidAppear() {
        let userInfo = interactor?.getUserInfo()
        collectionManager?.updateUserInfo(name: userInfo?.name, email: userInfo?.email)
            
        interactor?.loadFavouriteArticles(completion: {[weak self] articles in
            if let articles = articles {
                self?.articles = articles
                self?.collectionManager?.setUpCells(articles: articles)
            } else {
                self?.view?.presentAlert(title: "", message: "Error occured", action: ActionAlertModel(actionText: "Ok", actionHandler: {}))
            }
        })
        
        interactor?.loadProfileImage(completion: { [weak self] image in
            self?.collectionManager?.imageGotten(image: image)
        })
        
        
    }
    
    func signOut() {
        self.interactor?.signOut()
    }
    
}

extension FavouritesPresenter: FavouritesCollectionViewManagerDelegate {
    func cellClicked(article: Article?) {
        self.router?.createWebView(article: article)
    }
    
    func addPhotoTapped() {
        self.router?.routeToImagePicker(delegate: self)
    }
    
    
}

extension FavouritesPresenter: FavouritesSearchBarManagerDelegate {
    func queryArticles(name: String) {
        guard let articles = articles else { return }
        if name.count == 0 {
            self.collectionManager?.setUpCells(articles: articles)
        } else {
            var queriedArticles = [Article]()
            for article in articles {
                if (article.title?.lowercased().contains(name.lowercased()) ?? false) ||
                    (article.source.name?.lowercased().contains(name.lowercased()) ?? false) {
                    queriedArticles.append(article)
                }
            }
            self.collectionManager?.setUpCells(articles: queriedArticles)
        }
    }
}

extension FavouritesPresenter: ImagePickerManagerDelegate {
    func imageGotten(image: UIImage) {
        interactor?.saveImageToDataBase(image: image, completion: {[weak self] in
            self?.collectionManager?.imageGotten(image: image)
        })
    }
}
