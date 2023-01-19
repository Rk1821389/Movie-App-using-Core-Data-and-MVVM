//
//  AddMovieViewModel.swift
//  MovieApp
//
//  Created by ios on 19/01/23.
//

import Foundation

class AddMovieViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var director: String = ""
    @Published var rating: Int? = nil
    @Published var releaseDate: Date = Date()
    
    func save() {
        let manager = CoreDataManager.shared
        let movie = Movie(context: manager.persistenceContainer.viewContext)
        movie.title = title
        movie.director = director
        movie.rating = Double(rating ?? 0)
        movie.releaseDate = releaseDate
        
        manager.save()
    }
}
