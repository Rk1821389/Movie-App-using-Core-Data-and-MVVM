//
//  CoreDataManager.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/23/21.
//

import Foundation
import CoreData

class CoreDataManager {
   
    let persistenceContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    private init() {
        persistenceContainer = NSPersistentContainer(name: "MovieAppModel")
        persistenceContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("Failed to initialize core data \(error)")
            }
        }
    }
   
    
    func getAllMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            return try persistenceContainer.viewContext.fetch(fetchRequest)
        }catch {
            return []
        }
    }
   
    func save() {
        do {
            try persistenceContainer.viewContext.save()
        } catch {
            print("Failed to save a movie \(error)")
        }
    }
    
    func getMovieById(id: NSManagedObjectID) -> Movie? {
        do {
            return try persistenceContainer.viewContext.existingObject(with: id) as? Movie
        }catch {
            return nil
        }
    }
    
    func deleteMovie(_ movie: Movie) {
        persistenceContainer.viewContext.delete(movie)
        
        do {
            try persistenceContainer.viewContext.save()
        } catch {
            persistenceContainer.viewContext.rollback()
            print("Failed to delete a movie")
        }
        
    }
    
}
