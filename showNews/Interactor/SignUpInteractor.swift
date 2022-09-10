//
//  SignUpInteractor.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation
import UIKit

protocol SignUpInteractorInput {
    func signUp(email: String, password: String, image: UIImage, fullName: String)
}

final class SignUpInteractor: SignUpInteractorInput {
    
    var profileService: ProfileServiceProtocol?
    
    weak var presenter: SignUpPresenterInput?
    
    func signUp(email: String, password: String, image: UIImage, fullName: String) {
        //MARK: Need to check if the sign up was successful, only then save the image
        //MARK: Could add completion handler for the sign up
        profileService?.signUp(email: email, password: password, fullName: fullName, image: image)
    }
    
}

extension SignUpInteractor: SignUpDelegate {
    func presentAlert(title: String, message: String, action: ActionAlertModel?) {
        self.presenter?.presentAlert(title: title, message: message, action: action)
    }
}
