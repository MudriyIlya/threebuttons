//
//  CustomButton.swift
//  threebuttons
//
//  Created by Илья Мудрый on 06.07.2023.
//

import UIKit

/// Кастомная кнопка.
final class CustomButton: UIButton {

	private lazy var customConfiguration: UIButton.Configuration = {
		var configuration = UIButton.Configuration.filled()
		configuration.baseBackgroundColor = .systemGreen
		configuration.baseForegroundColor = .black.withAlphaComponent(0.8)
		configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
		configuration.titleAlignment = .center
		configuration.image = UIImage(systemName: "swift")
		configuration.imagePlacement = .trailing
		configuration.imagePadding = 8.0
		return configuration
	}()
	
	convenience init() {
		self.init(frame: .zero)
		configuration = customConfiguration
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOpacity = 0.5
		layer.shadowRadius = 1.5
		layer.shadowOffset = CGSize(width: 0, height: 0)
	}
}
