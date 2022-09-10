//
//  CategoriesPresenter.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation

// View To Presenter
protocol CategoriesPresenterProtocol: class {
    var tableViewManager: CategoriesTableViewManagerProtocol? { get set }
}

// Interactor To Presenter
protocol CategoriesPresenterInput: class {
}

// TableViewManager to presenter
protocol CategoriesTableViewManagerDelegate: class {
    func sourceSelected(at row: Int)
}

class CategoriesPresenter {
    
    weak var view: CategoriesViewInput?
    var tableViewManager: CategoriesTableViewManagerProtocol?
    var interactor: CategoriesInteractorInput?
    var router: CategoriesRouterProtocol?
}

extension CategoriesPresenter: CategoriesPresenterProtocol {

}

extension CategoriesPresenter: CategoriesTableViewManagerDelegate {
    func sourceSelected(at row: Int) {
        let category: String = Categories.categories[row].rawValue
        let chosenCategory = category.replacingOccurrences(of: " ", with: "-")
        self.router?.createDiscoverCategory(categoryName: chosenCategory)
    }
}


extension CategoriesPresenter: CategoriesPresenterInput {
    
}
