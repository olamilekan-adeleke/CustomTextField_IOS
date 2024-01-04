//
//  BaseTextField.swift
//  CustomTextField
//
//  Created by Enigma Kod on 26/12/2023.
//

import SwiftUI
import UIKit

func stackView(axis: NSLayoutConstraint.Axis = .vertical, spacing: CGFloat = 10) -> UIStackView {
    let stack = UIStackView(frame: .zero)
    stack.axis = axis
    stack.spacing = spacing
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
}

final class BaseTextField: UIView {
    // MARK: -  Component

    lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.textColor = UIColor.label
//        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var textFieldBackgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.125)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var errorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 14, weight: .thin)
        label.textColor = .systemRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var vStack = stackView()

    init() {
        super.init(frame: CGRect.zero)

        setUp()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        textField.isSecureTextEntry = false
        textField.autocapitalizationType = .words
        textField.placeholder = "Enter name here"
        textField.keyboardType = .default

        errorLabel.numberOfLines = 0
        errorLabel.textAlignment = .left
        errorLabel.textColor = .systemRed
//        errorLabel.isHidden = true
        errorLabel.text = "Thsuosuosous ssysy gysysnbsusususususus"
        errorLabel.font = .preferredFont(forTextStyle: .footnote)
    }

    private func layout() {
        translatesAutoresizingMaskIntoConstraints = false

        textFieldBackgroundView.addSubview(textField)
        addSubview(vStack)

        vStack.addArrangedSubview(textFieldBackgroundView)
        vStack.addArrangedSubview(errorLabel)

        NSLayoutConstraint.activate([
            textFieldBackgroundView.widthAnchor.constraint(equalTo: widthAnchor),

            textFieldBackgroundView.topAnchor.constraint(equalTo: textField.topAnchor, constant: -9),
            textFieldBackgroundView.bottomAnchor.constraint(equalTo: textField.bottomAnchor, constant: 9),

            textField.leftAnchor.constraint(equalTo: textFieldBackgroundView.leftAnchor, constant: 6),
            textField.rightAnchor.constraint(equalTo: textFieldBackgroundView.rightAnchor, constant: -6),

            heightAnchor.constraint(equalTo: vStack.heightAnchor),

            errorLabel.widthAnchor.constraint(equalTo: widthAnchor),
        ])
    }

//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: 370, height: 50)
//    }
}

// MARK: - Preview

struct TextFieldViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        return BaseTextField()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct View_Preview: PreviewProvider {
    static var previews: some View {
        return TextFieldViewRepresentable()
    }
}
