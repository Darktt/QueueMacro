// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@freestanding(expression)
public macro MainQueue(_ execution: @escaping () -> Void) = #externalMacro(module: "Macros", type: "MainQueueMacro")
