//
//  SignUpAssembly.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation
import UIKit

class SignUpAssembly {
    static func assemble() -> UIViewController {
        
        let view = SignUpViewController()
        let router = SignUpRouter()
        let presenter = SignUpPresenter()
        let interactor = SignUpInteractor()
        
        let profileService: ProfileService? = ServiceLocator.shared.getService()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.profileService = profileService
        interactor.presenter = presenter
        
        profileService?.signUpDelegate = interactor
        
        
        router.view = view
        return view
    }
}
