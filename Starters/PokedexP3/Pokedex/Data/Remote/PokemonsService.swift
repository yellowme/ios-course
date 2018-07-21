
//
//  File.swift
//  TableView
//
//  Created by Luis Burgos on 6/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

class PokemonsService {
    private let apiURL = "https://ios-course-poke-api.herokuapp.com"
    private let pokemonsPath = "/pokemons"
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    func getAllPokemons(
        name: String? = nil,
        parser: AppParser<[SimplePokemon]>? = nil,
        completion: @escaping ([SimplePokemon]?, String?) -> Void) {
        
        dataTask?.cancel()
        
        var endpointURL = apiURL + pokemonsPath
        if let name = name {
            endpointURL += "?"
            endpointURL += "name_like=\(name)"
        }
        
        if var urlComponents = URLComponents(string: endpointURL) {
        
            guard let url = urlComponents.url else { return }
        
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                //Declares a block that will be executed only when execution leaves the current scope.
                defer { self.dataTask = nil }
        
                guard error == nil else {
                    completion(nil, error!.localizedDescription)
                    return
                }
                
                guard let parser = parser else {
                    completion(nil, "Error has ocurred")
                    return
                }
                
                if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {                
                    DispatchQueue.main.async {
                        completion(parser.parse(data), nil)
                    }
                }
            }

            dataTask?.resume()
        }
    }
}
