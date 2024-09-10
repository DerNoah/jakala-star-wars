//
//  DependencyFactory.swift
//
//
//  Created by Noah Plützer on 19.05.24.
//

import Foundation

public struct DependencyFactory<Dependency: Sendable> {
    let factory: @Sendable (DependencyContainer) -> Dependency
    
    public init(_ factory: @escaping @Sendable (DependencyContainer) -> Dependency) {
        self.factory = factory
    }
    
    public func create(_ dependencyContainer: DependencyContainer) -> Dependency {
        factory(dependencyContainer)
    }
}
