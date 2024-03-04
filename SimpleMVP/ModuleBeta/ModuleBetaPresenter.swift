//
//  ModuleBetaPresenter.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import Foundation

protocol ModuleBetaPresenterProtocol {
    var title: String { get }
    
    func viewDidAppear() // так принято называть? 
    func requestSave()
    func showBModule(with: String?)
    func closeAlert()
}

final class ModuleBetaPresenter: ModuleBetaPresenterProtocol {
    
    weak var view: ModuleBetaViewProtocol?
    
    private let dataBaseService: DataBaseServiceProtocol
    private let router: ModuleBetaRouterProtocol
    private let someParam: String

    var title: String { "Module B" }
    
    var analiticScreenName: String { "super_b" }
    
    // someParam - параметр, который получает модуль из другого модуля (в нашем случае модуль Alpha)
    init(
        someParam: String,
        dataBaseService: DataBaseServiceProtocol,
        router: ModuleBetaRouterProtocol
    ) {
        self.dataBaseService = dataBaseService
        self.router = router
        self.someParam = someParam
    }
    
    deinit {
        print(">>> ModuleBetaPresenter is deinit")
    }
    
    func viewDidAppear() {
        let model = ModuleBetaView.Model(
            text: someParam
        )
        view?.update(model: model)
    }
    
    func requestSave() {
        dataBaseService.storeData(value: someParam) { [weak self] (result: Result<Void, Error>) in
            guard let self else { return }
            
            switch result {
            case .success:
                router.showSuccess { [weak self] in
                    self?.view?.changeNameButton()
                }
            case .failure:
                router.showError()
            }
        }
    }
    
    func showBModule(with text: String?) {
        router.openModuleGamma(with: text ?? "")
    }
    
    func closeAlert() {
        view?.changeNameButton()
    }
}
