//
//  ViewController.swift
//  CustomTextField
//
//  Created by Enigma Kod on 26/12/2023.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {
    private let nameTextField = BaseTextField(viewModel: .init(type: .name))
    private let emailTextField = BaseTextField(viewModel: .init(type: .email))
    private let passwordTextField = BaseTextField(viewModel: .init(type: .password))

    private let vStack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.backgroundColor = .white
        setup()
    }

    private func setup() {
//        view.translatesAutoresizingMaskIntoConstraints = false

        vStack.addArrangedSubview(nameTextField)
        vStack.addArrangedSubview(emailTextField)
        vStack.addArrangedSubview(passwordTextField)

        view.addSubview(vStack)

        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),

            vStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            vStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
    }
}

struct TextView_Preview: PreviewProvider {
    static var previews: some View {
        return ViewController().showPreview()
    }
}

extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }

    func showPreview() -> some View {
        return Preview(viewController: self)
    }
}
