//
//  LoginInteractor.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation


protocol SignInInteractorInput {
    func signIn(email: String, password: String)
    func resetPassword(email: String)
}

final class SignInInteractor: SignInInteractorInput {
    
    var profileService: ProfileServiceProtocol?
    weak var presenter: SignInPresenterInput?
    
    func signIn(email: String, password: String) {
        profileService?.signIn(email: email, password: password)
    }
    
    func resetPassword(email: String) {
        profileService?.resetPassword(email: email)
    }
    
}

extension SignInInteractor: SigninDelegate {
    func presentAlert(title: String, message: String, action: ActionAlertModel?) {
        self.presenter?.presentAlert(title: title, message: message, action: action)
    }
}
