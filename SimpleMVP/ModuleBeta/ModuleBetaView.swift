//
//  ModuleBetaView.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import UIKit

final class ModuleBetaView: UIView {
    
    struct Model {
        let text: String
    }

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.text = "Waiting..."
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(onTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Принять мой ответ", for: .normal)
        button.addTarget(self, action: #selector(secondButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введи свой ответ"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let presenter: ModuleBetaPresenterProtocol

    init(presenter: ModuleBetaPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(model: ModuleBetaView.Model) {
        label.text = model.text
    }
    
    func showError() {
        // Показываем View ошибки
    }
    
    func showEmpty() {
        // Показываем какой-то View для Empty state
    }
    
    func startLoader() {
        // Показываем скелетон или лоадер
    }
    
    func stopLoader() {
        // Скрываем все
    }
    
    func changeButtonName() {
        DispatchQueue.main.async {
            self.button.setTitle("Alert Name", for: .normal)
        }
    }
}

private extension ModuleBetaView {
    
    func commonInit() {
        backgroundColor = .white
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        addSubview(label)
        addSubview(button)
        addSubview(secondButton)
        addSubview(textField)
    }

    func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 350),
            
            button.heightAnchor.constraint(equalToConstant: 45.0),
            button.widthAnchor.constraint(equalToConstant: 150.0),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20.0),
            
            secondButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 25),
            secondButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            secondButton.heightAnchor.constraint(equalToConstant: 45.0),
            secondButton.widthAnchor.constraint(equalToConstant: 150.0),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 25),
            textField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textField.widthAnchor.constraint(equalTo: label.widthAnchor)
        ])
    }
    
    
    @objc
    func onTapped() {
        presenter.requestSave()
    }  
    
    @objc func secondButtonTapped() {
        presenter.showBModule(with: textField.text)
    }
}

