//
//  AppCoordinator.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation
import UIKit


protocol AppCoordinatorProtocol: class {
    func createLandingPage(scene: UIWindowScene)
    func createHomePages(scene: UIWindowScene)
}

class AppCoordinator {
    var window: UIWindow?
}

// MARK: Home page case
extension AppCoordinator {
    private func createDiscoverVC() -> UINavigationController {
        let discoverViewController = DiscoverAssembly.assemble(endpoint: .getTopHeadlines)
        discoverViewController.title = "Discover"
        discoverViewController.tabBarItem = UITabBarItem(title: "Discover", image: UIImage.tabBarItems.discover, selectedImage:  UIImage.tabBarItems.discover)
        
        return UINavigationController(rootViewController: discoverViewController)
    }
    
    private func createSourcesVC() -> UINavigationController {
        let sourcesViewController = SourcesAssembly.assemble()
        sourcesViewController.title = "Sources"
        sourcesViewController.tabBarItem = UITabBarItem(title: "Sources", image: UIImage.tabBarItems.source, selectedImage: UIImage.tabBarItems.source)
        return UINavigationController(rootViewController: sourcesViewController)
    }
    
    private func createSearchVC() -> UINavigationController {
        let searchViewController = SearchAssembly.assemble()
        searchViewController.title = "Search"
        searchViewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage.tabBarItems.search, selectedImage: UIImage.tabBarItems.search)
        return UINavigationController(rootViewController: searchViewController)
    }
    
    private func createFavouritesVC() -> UINavigationController {
        let favouritesViewController = FavouritesAssembly.assemble()
        favouritesViewController.title = "Favourites"
        favouritesViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.tabBarItems.profile, selectedImage: UIImage.tabBarItems.profile)
        return UINavigationController(rootViewController: favouritesViewController)
    }
    
    private func createCategoriesVC() -> UINavigationController {
        let favouritesViewController = CategoriesAssembly.assemble()
        favouritesViewController.title = "Categories"
        favouritesViewController.tabBarItem = UITabBarItem(title: "Categories", image: UIImage.tabBarItems.categories, selectedImage: UIImage.tabBarItems.categories)
        return UINavigationController(rootViewController: favouritesViewController)
    }
    
    private func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = UIColor.tintColor
        
        //add more tabs here
        tabBar.viewControllers = [createDiscoverVC(), createSourcesVC(), createSearchVC(), createCategoriesVC(), createFavouritesVC()]
        return tabBar
    }
}

// MARK: Landing page case
extension AppCoordinator {
    private func createSignUpVC() -> UINavigationController {
        let signUpViewController = SignUpAssembly.assemble()
        return UINavigationController(rootViewController: signUpViewController)
    }
    
    private func createLoginVC() -> UINavigationController {
        let loginViewController = LoginAssembly.assemble()
        return UINavigationController(rootViewController: loginViewController)
    }
}


extension AppCoordinator: AppCoordinatorProtocol {
    
    func createLandingPage(scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
        window?.rootViewController = createSignUpVC()
        window?.makeKeyAndVisible()
    }
    
    func createHomePages(scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
    }
}
