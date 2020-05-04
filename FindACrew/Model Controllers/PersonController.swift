//
//  PersonController.swift
//  FindACrew
//
//  Created by Violet Lavender Love on 5/4/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class PersonController {
    
    private let baseURL = URL(string: "https://lambdaswapi.herokuapp.com")!
    private lazy var peopleURL = URL(string: "/api/people", relativeTo: baseURL)!
    
    var people: [Person] = []
    
    
    func searchForPeopleWith(searchTerm: String, completion: @escaping () -> Void) {
        //   https://lambdaswapi.herokuapp.com/people/api/peopls/?search=luke
        
        var urlComponents = URLComponents(url: peopleURL, resolvingAgainstBaseURL: true)
        let searchTermQueryItem = URLQueryItem(name: "search", value: searchTerm)
        urlComponents?.queryItems = [searchTermQueryItem]
        
        guard let requestURL = urlComponents?.url else {
            print("Request URL is nil")
            return
            
        }
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("error fetching data \(error)")
                return
            }
            
            guard let data = data else {
                print("No Data returned from data task.")
                return
            }
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let personSearch = try jsonDecoder.decode(PersonSearch.self, from: data)
                self.people.append(contentsOf: personSearch.results)
                completion()
            } catch {
                print("Unable to decode data into object of PersonSearch: \(error)")
            }
        }
        task.resume()
    }
}

