//
//  DiscoverAssembly.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation
import UIKit


class DiscoverAssembly {
    static func assemble(endpoint: ArticleEndpoint) -> UIViewController {
        let view = DiscoverViewController()
        let collectionManager = DiscoverCollectionViewManager()
        let presenter = DiscoverPresenter()
        let interactor = DiscoverInteractor()
        let router = DiscoverRouter()
        
        view.presenter = presenter
        
        collectionManager.delegate = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.collectionManager = collectionManager
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.apiManager = ServiceLocator.shared.getService()
        interactor.endpoint = endpoint
        
        router.view = view
        
        return view
    }
}
