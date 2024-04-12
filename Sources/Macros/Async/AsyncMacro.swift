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
        
        print("queue: \(queue)")
        
        return "print(\"Hello, World!\")"
        
//        if let execution = node.arguments.last {
//            
//            return """
//            \(queue).async {
//                \(execution)
//            }
//            """
//        }
//        
//        if let execution = node.trailingClosure {
//            
//            return """
//            \(queue).async {
//                \(execution)
//            }
//            """
//        }
//        
//        throw AsyncError.missingArgument("execution")
    }
}
