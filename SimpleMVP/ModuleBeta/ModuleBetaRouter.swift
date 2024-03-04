//
//  ModuleBetaRouter.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import UIKit

protocol ModuleBetaRouterProtocol {
    
    // Устанавливаем основной UIViewController
    func setRootViewController(root: UIViewController)
    func openModuleGamma(with answer: String)
    
    func showSuccess(onOK: @escaping (()->Void))
    func showError()
}

final class ModuleBetaRouter: ModuleBetaRouterProtocol {
   
    
    func showSuccess(onOK: @escaping (() -> Void)) {
        let viewController = alertFactory.make(
            title: "Module Beta",
            message: "Save success",
            onAction: {
                onOK()
            }
        )
        
        root?.present(viewController, animated: true)
    }
    
        
    weak var root: UIViewController?
    
    private let alertFactory: AlertModuleFactory
    private let moduleGammaFactory: ModuleGammaFactory
    
    init(alertFactory: AlertModuleFactory, moduleGammaFactory: ModuleGammaFactory) {
        self.alertFactory = alertFactory
        self.moduleGammaFactory = moduleGammaFactory
    }
    
    func setRootViewController(root: UIViewController) {
        self.root = root
    }
    
    func openModuleGamma(with answer: String) {
        
        let context = ModuleGammaFactory.Context(answer: answer)
        let viewController = moduleGammaFactory.make(context: context)
        
        root?.navigationController?.pushViewController(viewController, animated: true)
    }
        
    func showError() {
        let viewController = alertFactory.make(
            title: "Module Beta",
            message: "Save error", onAction: {
                print("Error")
            }
        )
        
        root?.present(viewController, animated: true)
    }
}
