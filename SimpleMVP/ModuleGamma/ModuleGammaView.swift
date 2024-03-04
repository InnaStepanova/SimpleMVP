//
//  ModuleGammaView.swift
//  SimpleMVP
//
//  Created by Лаванда on 26.02.2024.
//

import UIKit

final class ModuleGammaView: UIView {
    
    struct Model {
        let answer: String
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.text = "Твой ответ:"
        return label
    }()
    
    private lazy var answerLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.text = "Текст ответа"
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Показать верный ответ", for: .normal)
        button.addTarget(self, action: #selector(onTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30
        stack.alignment = .center
        return stack
    }()
    
    private let presenter: ModuleGammaPresenterProtocol

    init(presenter: ModuleGammaPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(model: ModuleGammaView.Model) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.answerLabel.text = model.answer
        }
    }
    
    func setRightAnswer(_ answer: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.answerLabel.text = answer
            self.label.text = "Верный ответ:"
        }
    }
    
    @objc
    func onTapped() {
        presenter.showAnswer()
    }
}

private extension ModuleGammaView {
    
    func commonInit() {
        backgroundColor = .white
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(answerLabel)
        stackView.addArrangedSubview(button)
    }

    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
