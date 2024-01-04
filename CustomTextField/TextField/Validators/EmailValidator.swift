//
//  EmailValidator.swift
//  CustomTextField
//
//  Created by Enigma Kod on 04/01/2024.
//

import Combine
import Foundation

struct EmailValidator: BaseFormValidator {
    func validate(publisher: AnyPublisher<String, Never>) -> AnyPublisher<FormValidationState, Never> {
        Publishers.CombineLatest(
            isEmpty(publisher: publisher),
            isValidEmail(publisher: publisher)
        )
        .removeDuplicates(by: { $0 == $1 })
        .map {
            if $0.0 { return .invaild(.empty) }
            if $0.1 { return .invaild(.custom("Email is not a vaild email address")) }

            return .valid
        }.eraseToAnyPublisher()
    }

    func isValidEmail(publisher: AnyPublisher<String, Never>) -> AnyPublisher<Bool, Never> {
        publisher.map { $0.isValidEmail() }.eraseToAnyPublisher()
    }
}
