//
//  CategoriesRouter.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation
import UIKit

protocol CategoriesRouterProtocol {
    var view: UIViewController? { get set }
    func createDiscoverCategory(categoryName: String)
}

class CategoriesRouter: CategoriesRouterProtocol {
    weak var view: UIViewController?
    
    func createDiscoverCategory(categoryName: String) {
        let discoverView = DiscoverAssembly.assemble(endpoint: .getArticlesFromCategory(categoryName.lowercased()))
        discoverView.title = categoryName
        view?.navigationController?.pushViewController(discoverView, animated: true)
    }
}
