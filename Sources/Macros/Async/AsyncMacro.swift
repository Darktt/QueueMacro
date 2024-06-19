//
//  AsyncMacro.swift
//  
//
//  Created by Eden on 2024/4/11.
//

import Foundation
import SwiftSyntax
import SwiftSyntaxMacros

public
struct AsyncMacro: ExpressionMacro
{
    public static func expansion(of node: some FreestandingMacroExpansionSyntax, in context: some MacroExpansionContext) throws -> ExprSyntax
    {
        guard let queue = node.arguments.first?.expression else {
            
            throw AsyncError.missingArgument("queue")
        }
        
        if node.arguments.count == 2, let execution = node.arguments.last {
            
            return """
            DispatchQueue\(queue).async(execute: \(execution))
            """
        }
        
        if let execution = node.trailingClosure {
            
            return """
            DispatchQueue\(queue).async \(execution)
            """
        }
        
        throw AsyncError.missingArgument("execution")
    }
}
