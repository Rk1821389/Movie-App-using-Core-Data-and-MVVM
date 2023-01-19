//
//  AddMovieScreen.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/24/21.
//

import SwiftUI

struct AddMovieScreen: View {
 
    @StateObject private var addMovieVM = AddMovieViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            TextField("Enter name", text: $addMovieVM.title)
            TextField("Enter director", text: $addMovieVM.director)
            HStack {
                Text("Rating")
                Spacer()
                RatingView(rating: $addMovieVM.rating)
            }
            DatePicker("Release Date", selection: $addMovieVM.releaseDate)
            
            HStack {
                Spacer()
                Button("Save") {
                    addMovieVM.save()
                    dismiss()
                }
                Spacer()
            }
            
        }
        .navigationTitle("Add Movie")
        .embedInNavigationView()
    }
}

struct AddMovieScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieScreen()
    }
}
