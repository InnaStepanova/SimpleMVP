//
//  ModuleGammaRouter.swift
//  SimpleMVP
//
//  Created by Лаванда on 26.02.2024.
//

import UIKit

protocol ModuleGammaRouterProtocol {
    func setRootViewController(root: UIViewController)
}

final class ModuleGammaRouter: ModuleGammaRouterProtocol {
        
    weak var root: UIViewController?
    
    func setRootViewController(root: UIViewController) {
        self.root = root
    }
}

