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
    
    public typealias ValidationResult = Result<Void, String>
    
    // MARK: - Properties
    
    private let reservedParameters = ["%d", "%obj", "%level", "%file", "%func", "%line"]
    
    // MARK: - Methods
    
    /**
     Vaildates the given pattern with replacing rules.
     
     - Parameters:
       - pattern: String to validate.
     
     - Returns: `Result` with `Void` and the error message.
     */
    func validate(for pattern: String) -> Result<Void, String> {
        if pattern.contains("%%") {
            return .error(buildErrorMessage(characters: "%%"))
        }
        
        var result = pattern
        for param in reservedParameters {
            result = result.replacingOccurrences(of: param, with: "A$")
        }
        if result.contains("%") {
            // TODO: Specify the parameter
            return .error("Illegal parameter found.")
        }
        
        return .ok(())
    }
    
    private func buildErrorMessage(characters: String) -> String {
        return "Illegal characters \(characters) found."
    }
}
