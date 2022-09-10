//
//  LoginPresenter.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation


// View To Presenter
protocol SignInPresenterProtocol: class {
    func signIn(email: String?, password: String?)
    func resetPassword(email: String)
}

// Interactor To Presenter
protocol SignInPresenterInput: class {
    func presentAlert(title: String, message: String, action: ActionAlertModel?)
}

class SignInPresenter {
    
    weak var view: LoginViewInput?
    var interactor: SignInInteractorInput?
    
}

extension SignInPresenter: SignInPresenterProtocol {
    func signIn(email: String?, password: String?) {
        guard
            let email = email,
            let password = password else { return }
        interactor?.signIn(email: email, password: password)
    }
    
    func resetPassword(email: String) {
        interactor?.resetPassword(email: email)
    }
}

extension SignInPresenter: SignInPresenterInput {
    func presentAlert(title: String, message: String, action: ActionAlertModel?) {
        self.view?.presentAlert(title: title, message: message, action: action)
    }
}
