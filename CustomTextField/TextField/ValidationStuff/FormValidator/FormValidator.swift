//
//  FormValidator.swift
//  CustomTextField
//
//  Created by Enigma Kod on 04/01/2024.
//

import Combine
import Foundation

protocol FormValidator {
    func validateText(
        validator: BaseFormValidatable,
        publisher: AnyPublisher<String, Never>
    ) -> AnyPublisher<FormValidationState, Never>
}

extension FormValidator {
    func validateText(
        validator: BaseFormValidatable,
        publisher: AnyPublisher<String, Never>
    ) -> AnyPublisher<FormValidationState, Never> {
        return validator.validate(publisher: publisher)
    }
}
