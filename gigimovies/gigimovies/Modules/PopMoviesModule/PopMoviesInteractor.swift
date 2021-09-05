//
//  PopMoviesInteractor.swift
//  Gigimovies
//
//  Created by Guido Fabio on 03/09/2021.
//

import Foundation

protocol PopMoviesInteractorProtocol: AnyObject {
    func getPopMovies()
    func search()
}

class PopMoviesInteractor: PopMoviesModule.Interactor, PopMoviesInteractorProtocol {
    
// https://api.themoviedb.org/3 /search/movie?api_key=<<api_key>>&language=en-US&query=James&page=1&include_adult=false
    func search() {
        goToloadJson(url: getSearchUrl(query: "James"))
    }
    
    func getBaseUrl() -> String {
        return "https://api.themoviedb.org/3"
    }
    
    // TODO: Mejorar para no repetir codigo Helper
    func getSearchUrl(query: String) -> String {
        let url = getBaseUrl()+"/movie/popular?api_key="+getApiKey()+"&language=es&language=es&query="+query+"&page=1"
        
        return url
    }
    
    func getApiKey() -> String {
        return "ef22fd117d94f612763fe8531e33f256"
    }
        
    func getPopMovies() {
        let url = getBaseUrl()+"/movie/popular?api_key="+getApiKey()+"&language=es"
        goToloadJson(url: url)
    }
    
    func goToloadJson(url: String) {
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
