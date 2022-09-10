//
//  SearchRouter.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation
import UIKit

protocol SearchRouterProtocol {
    var view: UIViewController? { get set }
    func createWebView(article: Article?)
}

class SearchRouter: SearchRouterProtocol {
    weak var view: UIViewController?
    
    func createWebView(article: Article?) {
        let webView = WebPageViewAssembly.assemble(article: article)
        view?.navigationController?.pushViewController(webView, animated: true)
    }
}
