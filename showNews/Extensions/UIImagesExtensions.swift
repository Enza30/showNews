//
//  UIImagesExtensions.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation
import UIKit

extension UIImage {
    
    enum tabBarItems {
        static var discover: UIImage { UIImage(systemName: "globe") ?? UIImage() }
        static var source: UIImage { UIImage(systemName: "folder") ?? UIImage() }
        static var search: UIImage { UIImage(systemName: "magnifyingglass") ?? UIImage() }
        static var profile: UIImage { UIImage(systemName: "person.crop.circle") ?? UIImage() }
        static var categories: UIImage { UIImage(systemName: "list.dash") ?? UIImage() }
    }
    
    public class var profileHolderImage: UIImage {
        UIImage(systemName: "person.crop.circle.fill.badge.plus") ?? UIImage()
    }
}
