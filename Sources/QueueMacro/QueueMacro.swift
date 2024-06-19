// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

// Swift AST Explorer: https://swift-ast-explorer.com

@freestanding(expression)
public
macro Async(queue: DispatchQueue = .main, _ execution: @escaping @Sendable @convention(block) () -> Void) = #externalMacro(module: "Macros", type: "AsyncMacro")

@freestanding(expression)
public
macro MainQueue(_ execution: @escaping () -> Void) = #externalMacro(module: "Macros", type: "MainQueueMacro")
