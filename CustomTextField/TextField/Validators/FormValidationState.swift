//
//  FormValidationState.swift
//  CustomTextField
//
//  Created by Enigma Kod on 04/01/2024.
//

import Foundation

enum FormValidationState {
    case idel
    case invaild(ErrorState)
    case valid

    enum ErrorState {
        case empty
        case custom(String)

        var description: String {
            switch self {
            case .empty: return "Feild is empty"
            case .custom(let msg): return msg
            }
        }
    }
}
