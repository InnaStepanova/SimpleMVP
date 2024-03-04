//
//  ModuleGammaPresenter.swift
//  SimpleMVP
//
//  Created by Лаванда on 26.02.2024.
//

import UIKit

protocol ModuleGammaPresenterProtocol {
    var title: String { get }
    var rightAnswer: String { get }
    var answer: String { get }
    func viewDidAppear()
    func showAnswer()
}

final class ModuleGammaPresenter: ModuleGammaPresenterProtocol {
    let rightAnswer = "116 лет"
    
    let title = "Module G"
    
    var answer: String
    
    weak var view: ModuleGammaViewProtocol?
    
    private let router: ModuleGammaRouterProtocol
//    private let someParam: String
    
    // someParam - параметр, который получает модуль из другого модуля (в нашем случае модуль Alpha)
    init(
        someParam: String,
        router: ModuleGammaRouterProtocol
    ) {
        self.router = router
        self.answer = someParam
    }
    
    deinit {
        print(">>> ModuleGammaPresenter is deinit")
    }
    
    func viewDidAppear() {
        let model = ModuleGammaView.Model(
            answer: answer
        )
        view?.update(model: model)
    }
    
    func showAnswer() {
        view?.setRightAnswer(rightAnswer)
    }
}
