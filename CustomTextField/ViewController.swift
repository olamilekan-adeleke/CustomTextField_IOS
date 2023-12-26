//
//  ViewController.swift
//  CustomTextField
//
//  Created by Enigma Kod on 26/12/2023.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {
    private let nameTextField = BaseTextField()
    private let emailTextField = BaseTextField()
    private let passwordTextField = BaseTextField()

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
        view.translatesAutoresizingMaskIntoConstraints = false

        vStack.addArrangedSubview(nameTextField)
        vStack.addArrangedSubview(emailTextField)
        vStack.addArrangedSubview(passwordTextField)

        view.addSubview(vStack)

        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),

            vStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            vStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16),
        ])
    }
}

struct TestViewRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return ViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct TextView_Preview: PreviewProvider {
    static var previews: some View {
        return TestViewRepresentable()
    }
}
