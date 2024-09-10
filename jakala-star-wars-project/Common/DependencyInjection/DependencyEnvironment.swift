//
//  DependencyEnvironment.swift
//
//
//  Created by Noah Plützer on 19.05.24.
//

import Foundation

public enum DependencyEnvironment {
    case prod
    case test
    case preview
}

extension DependencyEnvironment: DependencyIdentifier {
    public static var dependencyValue: DependencyFactory<DependencyEnvironment> {
        DependencyFactory { _ in .prod }
    }

    public static var testValue: DependencyFactory<DependencyEnvironment> {
        DependencyFactory { _ in .test }
    }

    public static var previewValue: DependencyFactory<DependencyEnvironment> {
        DependencyFactory { _ in .preview }
    }
}
