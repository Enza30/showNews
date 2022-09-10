//
//  SourcesRouter.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation
import UIKit

//Presenter to Router
protocol SourcesRouterProtocol {
    var view: UIViewController? { get set }
    
    func createDiscoverSources(sourceName: String)
}


class SourcesRouter: SourcesRouterProtocol {
    
    weak var view: UIViewController?
    func createDiscoverSources(sourceName: String) {
        let discoverView = DiscoverAssembly.assemble(endpoint: .getArticlesFromSource(sourceName))
        discoverView.title = sourceName
        view?.navigationController?.pushViewController(discoverView, animated: true)
    }
    

    
}
