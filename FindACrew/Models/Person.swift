//
//  Person.swift
//  FindACrew
//
//  Created by Violet Lavender Love on 5/4/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


struct Person: Codable {
    let name: String
    let gender: String
    let birthYear: String
}

struct PersonSearch: Codable {
    let results: [Person]
}
