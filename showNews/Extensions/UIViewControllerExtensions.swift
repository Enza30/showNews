//
//  UIViewControllerExtensions.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation
import UIKit

struct ActionAlertModel {
    let actionText: String
    let actionHandler: () -> ()
}


extension UIViewController {
        
    func presentAlert(title: String, message: String, action: ActionAlertModel?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let action = action {
            alert.addAction(UIAlertAction(title: action.actionText, style: .default, handler: { UIAlertAction in
                action.actionHandler()
            }))
        }
        present(alert, animated: true, completion: nil)
    }
    
    func presentAlert(title: String, message: String, action: ActionAlertModel?, action2: ActionAlertModel?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let action = action {
            alert.addAction(UIAlertAction(title: action.actionText, style: .default, handler: { UIAlertAction in
                action.actionHandler()
            }))
        }
        
        if let action = action2 {
            alert.addAction(UIAlertAction(title: action.actionText, style: .default, handler: { UIAlertAction in
                action.actionHandler()
            }))
        }
        present(alert, animated: true, completion: nil)
    }
    
    func presentAlertWithTF(title: String, actionCancel: ActionAlertModel?, actionComplete: ActionAlertModel?, placeHolder: String, completion: @escaping (String) -> ()) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        alert.addTextField { (tf) in
            tf.placeholder = placeHolder
        }
        
        if let actionCancel = actionCancel {
            alert.addAction(UIAlertAction(title: actionCancel.actionText, style: .default, handler: { UIAlertAction in
                actionCancel.actionHandler()
            }))
        }
        
        if let actionComplete = actionComplete {
            alert.addAction(UIAlertAction(title: actionComplete.actionText, style: .default, handler: { UIAlertAction in
                guard let tf = alert.textFields, let text = tf[0].text else { return }
                completion(text )
            }))
        }
        present(alert, animated: true, completion: nil)
    }
}
