//
//  PreviewCoordinator.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import Foundation
import SUICoordinator
import SwiftUI

final class PreviewCoordinator: Coordinator {
    @Published var navigationPath: NavigationPath
    
    public init(navigationPath: NavigationPath) {
        self.navigationPath = navigationPath
    }
    
    public func push<D>(destination: D) where D: Destination {
        let anyDestination = AnyDestination(
            identifier: destination.identifier,
            viewBuilder: { [unowned self] dependencyContainer in
                destination.makeView(with: dependencyContainer, coordinator: self)
            }
        )
        navigationPath.append(anyDestination)
    }
    
    public func pop() {
        navigationPath.removeLast()
    }
}

extension PreviewCoordinator: DependencyIdentifier {
    static var dependencyValue: DependencyFactory<PreviewCoordinator> {
        DependencyFactory { _ in
            PreviewCoordinator(navigationPath: .init())
        }
    }
}
