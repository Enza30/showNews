//
//  LoginAssembly.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation
import UIKit

class LoginAssembly {
    public static func assemble() -> UIViewController {
        let view = LoginViewController()
        let presenter = SignInPresenter()
        let interactor = SignInInteractor()
        let profileService: ProfileService? = ServiceLocator.shared.getService()
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        
        interactor.profileService = profileService
        interactor.presenter = presenter
        
        profileService?.loginDelegate = interactor
        
        return view
    }
}
