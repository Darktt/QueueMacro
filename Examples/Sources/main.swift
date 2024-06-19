//
//  File.swift
//  
//
//  Created by Eden on 2024/4/12.
//

import Foundation
import QueueMacro

#Async({
    
    print("Hello, World!!!!!")
})

#Async(queue: .main, {
    
    print("Hello, World!!!!!")
})
