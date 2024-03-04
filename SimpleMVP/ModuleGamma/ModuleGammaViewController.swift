//
//  ModuleGammaViewController.swift
//  SimpleMVP
//
//  Created by Лаванда on 26.02.2024.
//

import UIKit

protocol ModuleGammaViewProtocol: AnyObject {
    func update(model: ModuleGammaView.Model)
    func setRightAnswer(_ answer: String)
}

final class ModuleGammaViewController: UIViewController {
    
    private lazy var customView = ModuleGammaView(presenter: presenter)
    private let presenter: ModuleGammaPresenterProtocol
    
    init(presenter: ModuleGammaPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = presenter.title
        presenter.viewDidAppear()
    }

    
}

extension ModuleGammaViewController: ModuleGammaViewProtocol {
    func setRightAnswer(_ answer: String) {
        customView.setRightAnswer(answer)
    }
    
    func update(model: ModuleGammaView.Model) {
        customView.update(model: model)
    }
}
