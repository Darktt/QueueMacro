//
//  MainQueueMacro.swift
//  
//
//  Created by Eden on 2024/4/11.
//

import Foundation
import SwiftSyntax
import SwiftSyntaxMacros

public
struct MainQueueMacro: ExpressionMacro
{
    public static func expansion(of node: some FreestandingMacroExpansionSyntax, in context: some MacroExpansionContext) throws -> ExprSyntax
    {
        if let execution = node.arguments.first {
            
            return "DispatchQueue.main.async(execute: \(execution))"
        }
        
        if let execution = node.trailingClosure {
            
            return "DispatchQueue.main.async(execute: \(execution))"
        }
        
        throw MainQueueError.missingArgument("execution")
    }
}
