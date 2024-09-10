//
//  DependencyIdentifier.swift
//
//
//  Created by Noah Plützer on 19.05.24.
//

import Foundation

public protocol DependencyIdentifier {
    associatedtype Value: Sendable = Self
    
    static var dependencyValue: DependencyFactory<Value> { get }
    
    static var testValue: DependencyFactory<Value> { get }
    
    static var previewValue: DependencyFactory<Value> { get }
}

public extension DependencyIdentifier {
    static var testValue: DependencyFactory<Value> { dependencyValue }
    
    static var previewValue: DependencyFactory<Value> { dependencyValue }
}
