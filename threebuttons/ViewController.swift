//
//  ViewController.swift
//  threebuttons
//
//  Created by Илья Мудрый on 05.07.2023.
//

import UIKit

/// Базовый `ViewController` на котором отобразятся кнопки.
final class ViewController: UIViewController {
	
	private enum ButtonTitles {
		static let firstButton = "Птичка"
		static let secondButton = "Проверочка длинного ТЕКСТА кнопки"
		static let thirdButton = "😺"
	}
	
	private lazy var firstButton: CustomButton = {
		let button = CustomButton()
		button.setTitle(ButtonTitles.firstButton, for: .normal)
		button.tag = 1
		return button
	}()
	
	private lazy var secondButton: CustomButton = {
		let button = CustomButton()
		button.setTitle(ButtonTitles.secondButton, for: .normal)
		button.tag = 2
		return button
	}()
	
	private lazy var thirdButton: CustomButton = {
		let button = CustomButton()
		button.configuration?.image = UIImage(systemName: "list.bullet.clipboard")
		button.setTitle(ButtonTitles.thirdButton, for: .normal)
		button.tag = 3
		return button
	}()
	
	private lazy var stackView: UIStackView = {
		let stackView = UIStackView(frame: .zero)
		stackView.axis = .vertical
		stackView.alignment = .center
		stackView.distribution = .equalCentering
		stackView.spacing = 8.0
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	
	/// Сконфигурировать UI.
	func configureUI() {
		view.backgroundColor = .white
		[firstButton, secondButton, thirdButton].forEach {
			$0.addTarget(self, action: #selector(buttonTouched), for: .touchDown)
			$0.addTarget(self, action: #selector(buttonResign), for: .touchUpOutside)
			$0.addTarget(self, action: #selector(buttonResign), for: .touchUpInside)
			if $0.tag == 3 {
				$0.addTarget(self, action: #selector(presentModalViewController), for: .touchUpInside)
			}
			
			stackView.addArrangedSubview($0)
		}
		view.addSubview(stackView)
		
		NSLayoutConstraint.activate([
			stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
			stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		])
	}
}

// MARK: - Private Actions

private extension ViewController {
	
	@objc func presentModalViewController() {
		let viewController = UIViewController()
		let gradient = CAGradientLayer()
		gradient.type = .axial
		gradient.startPoint = CGPoint(x: 1, y: 0)
		gradient.endPoint = CGPoint(x: 0, y: 1)
		gradient.colors = [
			UIColor.darkGray.cgColor,
			UIColor.systemGreen.cgColor
		]
		gradient.frame = viewController.view.layer.bounds
		viewController.view.layer.addSublayer(gradient)
		present(viewController, animated: true)
	}
	
	@objc func buttonTouched(_ sender: UIButton) {
		UIView.animate(
			withDuration: 0.2,
			delay: 0,
			options: [.allowUserInteraction, .beginFromCurrentState]
		) {
			sender.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
		}
	}
	
	@objc func buttonResign(_ sender: UIButton) {
		UIView.animate(
			withDuration: 0.2,
			delay: 0,
			options: [.allowUserInteraction, .beginFromCurrentState]
		) {
			sender.transform = CGAffineTransform.identity
		}
	}
}
