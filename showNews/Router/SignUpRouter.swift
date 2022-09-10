//
//  SignUpInteractor.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation
import UIKit

protocol SignUpRouterProtocol {
    var view: UIViewController? { get set }
    func createLoginPage()
    func routeToImagePicker(delegate: ImagePickerManagerDelegate)
}

class SignUpRouter: SignUpRouterProtocol {
    weak var view: UIViewController?
    
    func createLoginPage() {
        let loginView = LoginAssembly.assemble()
        view?.navigationController?.pushViewController(loginView, animated: true)
    }
    
    func routeToImagePicker(delegate: ImagePickerManagerDelegate) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePickerManger: ImagePickerManager? = ServiceLocator.shared.getService()
            imagePickerManger?.delegate = delegate
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = imagePickerManger
            imagePickerController.allowsEditing = true
            imagePickerController.sourceType = .photoLibrary
            view?.navigationController?.present(imagePickerController, animated: true, completion: nil)
        }
    }
}


