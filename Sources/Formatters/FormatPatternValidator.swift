//
//  FormatPatternValidator.swift
//  Linna
//
//  Created by Suita Fujino on 2018/11/30.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

/**
 A validator for the pattern of `CustomizableLogFormatter`.
 */
class FormatPatternValidator {
    
    public typealias ValidationResult = Result<Void, VaridationError>
    
    // MARK: - Properties
    
    private let illegalCharactersList: [String] = ["%%"]
    private let reservedParameters = ["%d", "%obj", "%level", "%file", "%func", "%line"]
    
    // MARK: - Methods
    
    /**
     Vaildates the given pattern with replacing rules.
     
     - Parameters:
       - pattern: String to validate.
     
     - Returns: `Result` with `Void` and the error message.
     */
    func validate(for pattern: String) -> ValidationResult {
        if let match = illegalCharactersList.filter({ pattern.contains($0)}).first {
            return .failure(.illegalCharacters(match))
        }
        
        var result = pattern
        for param in reservedParameters {
            result = result.replacingOccurrences(of: param, with: "A$")
        }
        if result.contains("%") {
            return .failure(.illegalParameter)
        }
        
        return .success(())
    }
    
}

extension FormatPatternValidator {
    /// Represents format validation errors.
    enum VaridationError: Error {
        /// Contains illegal placeholder parameter.
        case illegalParameter
        /// Contains unconvertable characters like '%%'.
        case illegalCharacters(String)
        
        var localizedDescription: String {
            switch self {
            case .illegalParameter:
                return "Illegal parameter found."
            case .illegalCharacters(let characters):
                return "Illegal characters \(characters) found."
            }
        }
    }
}


