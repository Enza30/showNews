//
//  FavouritesRouter.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation
import UIKit

protocol FavouritesRouterProtocol {
    var view: UIViewController? { get set }
    func routeToImagePicker(delegate: ImagePickerManagerDelegate)
    func createWebView(article: Article?)
}

class FavouritesRouter: FavouritesRouterProtocol {
    
    weak var view: UIViewController?
    
    func routeToImagePicker(delegate: ImagePickerManagerDelegate) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePickerManger: ImagePickerManager? = ServiceLocator.shared.getService()
            imagePickerManger?.delegate = delegate
            let imagePickerComtroller = UIImagePickerController()
            imagePickerComtroller.delegate = imagePickerManger
            imagePickerComtroller.allowsEditing = true
            imagePickerComtroller.sourceType = .photoLibrary
            view?.navigationController?.present(imagePickerComtroller, animated: true, completion: nil)
        }
    }
    
    func createWebView(article: Article?) {
        let webView = WebPageViewAssembly.assemble(article: article)
        view?.navigationController?.pushViewController(webView, animated: true)
    }
    

}
