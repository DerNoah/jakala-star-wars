//
//  APIClient.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import Foundation

final class APIClient {
    let session = URLSession(configuration: .default)
    let decoder = JSONDecoder()
    
    func request<Response: Decodable>(_ url: URL) async throws -> Response {
        let request = URLRequest(url: url)
        
        let data = try await session.data(for: request)
        let decodedData = try decoder.decode(Response.self, from: data.0)
        
        return decodedData
    }
}

extension APIClient: DependencyIdentifier {
    static var dependencyValue: DependencyFactory<APIClient> {
        DependencyFactory { _ in
            APIClient()
        }
    }
}
