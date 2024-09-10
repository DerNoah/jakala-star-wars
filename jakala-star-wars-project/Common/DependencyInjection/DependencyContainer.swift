//
//  DependencyContainer.swift
//
//
//  Created by Noah Plützer on 19.05.24.
//

import Foundation

public final class DependencyContainer {
	private var storage: [ObjectIdentifier: AnySendable]
	private let lock = NSRecursiveLock()

	public init(environment: DependencyEnvironment = .prod) {
		storage = [:]
		storage[ObjectIdentifier(DependencyEnvironment.self)] = AnySendable(environment)
	}

	public func changeEnvironment(_ environment: DependencyEnvironment) {
		storage = [:]
		storage[ObjectIdentifier(DependencyEnvironment.self)] = AnySendable(environment)
	}

	public func resolve<Dependency: DependencyIdentifier>(_ dependencyType: Dependency.Type) -> Dependency.Value {
		defer { lock.unlock() }
		lock.lock()

		let environment = (storage[ObjectIdentifier(DependencyEnvironment.self)]?.value as? DependencyEnvironment.Value) ?? DependencyEnvironment.prod

		let dependencyKey = ObjectIdentifier(dependencyType)

		if let instance = storage[dependencyKey]?.value as? Dependency.Value {
			return instance
		}

		let factory: DependencyFactory<Dependency.Value>

		switch environment {
		case .prod:
			factory = dependencyType.dependencyValue
		case .test:
			factory = dependencyType.testValue
		case .preview:
			factory = dependencyType.previewValue
		}

		let instance = factory.create(self)
		storage[dependencyKey] = AnySendable(instance)
		return instance
	}
}

private struct AnySendable: @unchecked Sendable {
	let value: Any

	init<Value: Sendable>(_ value: Value) {
		self.value = value
	}
}
