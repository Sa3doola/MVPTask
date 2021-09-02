//
//  APIManager.swift
//  FirstTaskMVP
//
//  Created by Saad Sherif on 9/2/21.
//

import Foundation

struct Constants {
    static let baseAPIURL = "https://newsapi.org/v2/everything?q=apple&from=2021-09-01&to=2021-09-01&sortBy=popularity"
    static let api_Key = "619ddf7662eb4198ba741a9d3a183b57"
}

enum APIError: Error {
    case failedToGetData
}

class APIManager {
    
    static let shared = APIManager()
    
    func fetchGenericJSONData<Model: Codable>(urlString: String, completion: @escaping (Result<Model, Error>) -> Void) {

        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in

            guard let data = data, error == nil else {
                completion(.failure(APIError.failedToGetData))
                return
            }

            do {
                let model = try JSONDecoder().decode(Model.self, from: data)
                completion(.success(model))
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
