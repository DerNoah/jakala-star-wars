//
//  PreviewCoordinator.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import Foundation
import SUICoordinator

final class PreviewCoordinator: Coordinator {
    func push<D>(destination: D) where D: SUICoordinator.Destination {}
    func pop() {}
}

extension PreviewCoordinator: DependencyIdentifier {
    static var dependencyValue: DependencyFactory<PreviewCoordinator> {
        DependencyFactory { _ in
            PreviewCoordinator()
        }
    }
}
