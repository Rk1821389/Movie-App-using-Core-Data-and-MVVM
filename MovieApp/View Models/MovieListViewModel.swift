//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by ios on 19/01/23.
//

import Foundation

class MovieListViewModel: ObservableObject {
   
   @Published var movies: [MovieViewModel] = [MovieViewModel]()
    
    func getAllMovies() {
        let movies = CoreDataManager.shared.getAllMovies()
        DispatchQueue.main.async {
            self.movies = movies.map(MovieViewModel.init)
        }
    }
    
    func deleteMovie(movie: MovieViewModel) {
        let movie = CoreDataManager.shared.getMovieById(id: movie.id)
        if let movie {
            CoreDataManager.shared.deleteMovie(movie)
        }
    }
    
}
