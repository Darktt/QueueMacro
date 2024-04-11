//
//  MainQueueMacro.swift
//  
//
//  Created by Eden on 2024/4/11.
//

import Foundation
import SwiftSyntaxMacros
import SwiftSyntax

public
struct MainQueueMacro: ExpressionMacro
{
    public static func expansion(of node: some FreestandingMacroExpansionSyntax, in context: some MacroExpansionContext) throws -> ExprSyntax
    {
        guard let execution = node.arguments.first else {
            
            throw MainQueueError.missingArgument("execution")
        }
        
        return "DispatchQueue.main.async(execute: \(execution))"
    }
}
