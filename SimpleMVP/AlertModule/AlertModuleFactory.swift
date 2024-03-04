//
//  AlertModuleFactory.swift
//  SimpleMVVM
//
//  Created by Dmitriy Mirovodin on 16.02.2024.
//

import UIKit

final class AlertModuleFactory {
    
    func make(title: String, message: String, onAction: @escaping (() -> Void)) -> UIViewController {
        let alertViewController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: "Ok",
            style: .default) { _ in
                onAction()
            }
        
        alertViewController.addAction(action)
        print("Alert")
        return alertViewController
    }
}
