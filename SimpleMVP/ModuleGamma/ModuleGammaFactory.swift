//
//  ModuleGammaFactory.swift
//  SimpleMVP
//
//  Created by Лаванда on 26.02.2024.
//
import UIKit

final class ModuleGammaFactory {
    
    struct Context {
        let answer: String
    }
    
    func make(context: Context) -> UIViewController {
        /// Только Factory может наполнять Presenter реальными сервисами и другими зависимостями
        let router = ModuleGammaRouter()
        
        let presenter = ModuleGammaPresenter(someParam: context.answer, router: router)
        let vc = ModuleGammaViewController(presenter: presenter)
        
        presenter.view = vc
        router.setRootViewController(root: vc)
        
        return vc
    }
}
