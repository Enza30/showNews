//
//  FavouritesTabBarManager.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation
import UIKit

// Presenter to Manager
protocol FavouritesSearchBarManagerProtocol {
    func setUpSearchBar(searchBar: UISearchBar)
}

class FavouritesSearchBarManager: NSObject {
    var presenter: FavouritesPresenterProtocol?
    
    weak var delegate: FavouritesSearchBarManagerDelegate?
    weak var searchBar: UISearchBar?
}

extension FavouritesSearchBarManager: FavouritesSearchBarManagerProtocol {
    func setUpSearchBar(searchBar: UISearchBar) {
        self.searchBar = searchBar
        self.searchBar?.delegate = self
    }
}

extension FavouritesSearchBarManager: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchText = searchBar.text else { return }
        delegate?.queryArticles(name: searchText)
    }
}
