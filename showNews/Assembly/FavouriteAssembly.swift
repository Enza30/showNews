//
//  FavouriteAssembly.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation
import UIKit

class FavouritesAssembly {
    static func assemble() -> UIViewController {
        
        let view = FavouritesViewController()
        let collectionManager = FavouritesCollectionViewManager()
        let searchBarManager = FavouritesSearchBarManager()
        let preseneter = FavouritesPresenter()
        let interactor = FavouritesInteractor()
        let router = FavouritesRouter()
        let profileManager: ProfileService? = ServiceLocator.shared.getService()
        
        view.presenter = preseneter
        
        collectionManager.delegate = preseneter
        searchBarManager.delegate = preseneter
        
        preseneter.view = view
        preseneter.interactor = interactor
        preseneter.router = router
        preseneter.collectionManager = collectionManager
        preseneter.searchBarManager = searchBarManager
        
        interactor.presenter = preseneter
        interactor.profileManager = profileManager
        
        router.view = view
        
        return view
    }
    
}

