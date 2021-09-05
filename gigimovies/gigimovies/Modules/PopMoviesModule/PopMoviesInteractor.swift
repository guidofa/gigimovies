//
//  PopMoviesInteractor.swift
//  Gigimovies
//
//  Created by Guido Fabio on 03/09/2021.
//

import Foundation

protocol PopMoviesInteractorProtocol: AnyObject {
    func getPopMovies()
}

class PopMoviesInteractor: PopMoviesModule.Interactor, PopMoviesInteractorProtocol {
    func getBaseUrl() -> String {
        return "https://api.themoviedb.org/3"
    }
    
    func getToken() -> String {
        return "ef22fd117d94f612763fe8531e33f256"
    }
        
    func getPopMovies() {
        let url = getBaseUrl()+"/movie/popular?api_key="+getToken()+"&language=es"
        self.loadJson(fromURLString: url) { (result) in
            switch result {
            case .success(let data):
                self.parse(jsonData: data)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(Results.self, from: jsonData)
            presenter?.getPopMoviesSuccess(movies: decodedData.results)
        } catch {
            print("fallanding")
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
