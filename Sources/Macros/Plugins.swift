//
//  Plugins.swift
//
//
//  Created by Eden on 2024/4/11.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct Plugins: CompilerPlugin
{
    let providingMacros: [Macro.Type] = [
        AsyncMacro.self,
        MainQueueMacro.self,
    ]
}
