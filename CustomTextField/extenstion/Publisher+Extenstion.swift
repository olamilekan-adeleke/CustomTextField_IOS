//
//  Publisher+Extenstion.swift
//  CustomTextField
//
//  Created by Enigma Kod on 05/01/2024.
//

import Combine
import Foundation

extension Publisher where Self.Output == String, Self.Failure == Never {
    func validateText(validator: BaseFormValidatable) -> AnyPublisher<FormValidationState, Never> {
        return validator.validate(publisher: self.eraseToAnyPublisher())
    }
}
