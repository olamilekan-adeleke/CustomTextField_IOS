//
//  BaseValidator.swift
//  CustomTextField
//
//  Created by Enigma Kod on 04/01/2024.
//

import Combine
import Foundation

protocol BaseFormValidator {
    func validate(publisher: AnyPublisher<String, Never>) -> AnyPublisher<FormValidationState, Never>
}

extension BaseFormValidator {
    func isEmpty(publisher: AnyPublisher<String, Never>) -> AnyPublisher<Bool, Never> {
        publisher.map { $0.isEmpty }.eraseToAnyPublisher()
    }

    func isTooShort(publisher: AnyPublisher<String, Never>, minLen: Int) -> AnyPublisher<Bool, Never> {
        publisher.map { $0.count <= minLen }.eraseToAnyPublisher()
    }

    func hasNumber(publisher: AnyPublisher<String, Never>) -> AnyPublisher<Bool, Never> {
        publisher.map { $0.hasNumber() }.eraseToAnyPublisher()
    }

    func hasSpecialChars(publisher: AnyPublisher<String, Never>) -> AnyPublisher<Bool, Never> {
        publisher.map { $0.hasSpecialChars() }.eraseToAnyPublisher()
    }

    func containLetters(publisher: AnyPublisher<String, Never>) -> AnyPublisher<Bool, Never> {
        publisher.map { $0.contains(where: { $0.isLetter }) }.eraseToAnyPublisher()
    }
}
