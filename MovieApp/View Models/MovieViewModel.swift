//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by ios on 19/01/23.
//

import Foundation
import CoreData

struct MovieViewModel {
    let movie: Movie
    
    var id: NSManagedObjectID {
        return movie.objectID
    }
    
    var title: String {
        return movie.title ?? ""
    }
    
    var director: String {
        return movie.director ?? "Not available"
    }
    
    var releaseDate: String? {
        return movie.releaseDate?.asFormattedString()
    }
    
    var rating: Int? {
        return Int(movie.rating)
    }
}
