//
//  PopMoviesInteractor.swift
//  Gigimovies
//
//  Created by Guido Fabio on 03/09/2021.
//

import Foundation

protocol PopMoviesInteractorProtocol: AnyObject {
    func getPopMovies()
    func search(query: String)
}

enum EndpointType {
    case popMovies
    case search
}

class PopMoviesInteractor: PopMoviesModule.Interactor, PopMoviesInteractorProtocol {
    func search(query: String) {
        goToloadJson(url: URLHelper.getSearchUrl(query: query), endpoint: .search)
    }
    
    func getPopMovies() {
        goToloadJson(url: URLHelper.getPopMoviesURL(), endpoint: .popMovies)
    }
    
    func goToloadJson(url: String, endpoint: EndpointType) {
        self.loadJson(fromURLString: url) { (result) in
            switch result {
            case .success(let data):
                self.parse(jsonData: data, endpoint: endpoint)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func parse(jsonData: Data, endpoint: EndpointType) {
        do {
            let decodedData = try JSONDecoder().decode(Results.self, from: jsonData)
            switch endpoint {
            case .popMovies:
                presenter?.getPopMoviesSuccess(movies: decodedData.results)
            case.search:
                presenter?.searchSuccess(movies: decodedData.results)
            }
        } catch {
            print("No hay resultados")
        }
    }
    
    func loadJson(fromURLString urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, _, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            urlSession.resume()
        }
    }
}
