//
//  AppInteractor.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation
import Firebase
import UIKit

protocol AppInteractorProtocol: class {
    func checkIfUserisAuthenticated()
}

class AppInteractor: AppInteractorProtocol {
    
    private var coordinator: AppCoordinatorProtocol?
    private weak var windowScene: UIWindowScene!
    private var profileService: ProfileServiceProtocol?
    
    
    init(windowScene: UIWindowScene) {
        self.windowScene = windowScene
        setupFirebase()
        self.setupServiceLocator()
        self.coordinator = AppCoordinator()
        self.checkIfUserisAuthenticated()
    }
    
    
    private func setupFirebase() {
        FirebaseApp.configure()
    }
    
    private func setupServiceLocator() {
        
        let networkService = NetworkService<ArticleEndpoint>()
        ServiceLocator.shared.addService(service: networkService as NetworkService)
        
        let profileService = ProfileService()
        self.profileService = profileService
        profileService.appInteratcor = self
        ServiceLocator.shared.addService(service: profileService as ProfileService)
        
        let imagePickerManager = ImagePickerManager()
        ServiceLocator.shared.addService(service: imagePickerManager as ImagePickerManager )
        
    }
    
     func checkIfUserisAuthenticated() {
        guard let profileService = profileService else { return }
        if profileService.checkIfUserIsAuth() {
            coordinator?.createHomePages(scene: windowScene)
        } else {
            coordinator?.createLandingPage(scene: windowScene)
        }
    }
    
}
