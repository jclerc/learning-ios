//
//  Movie.swift
//  AppCours
//
//  Created by Jonathan on 04/12/2017.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation

class Movie {
    let title: String
    var score: Float
    
    init(_ title: String, _ score: Float) {
        self.title = title
        self.score = score
    }
}

typealias Film = Movie
