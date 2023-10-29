//
//  Movie.swift
//  TableViewApp
//
//  Created by liga.griezne on 27/10/2023.
//

import Foundation

struct Movie {
    let movieTitles: String
    let imageNames: String
    let movieGenres: String
    let releaseYears: Int
    let descriptions: String
    let movieTrailerUrls: String
    let movieRating: String
    let movieRuntime: String
    
    static func createMovie() -> [Movie] {
        var movies: [Movie] = []
        
        let movieTitlesS = DataManager.shared.movieTitles
        let imageNamesS = DataManager.shared.imageNames
        let movieGenresS = DataManager.shared.movieGenres
        let releaseYerasS = DataManager.shared.releaseYears
        let descriptionsS = DataManager.shared.descriptions
        let movieTrailerUrlsS = DataManager.shared.movieTrailerUrls
        
        for i in 0..<movieTitlesS.count {
            let movieData = /*["N/A", "N/A"]*/
            fetchMovieRatings(forTitle: movieTitlesS[i], year: releaseYerasS[i])
            let movie = Movie(movieTitles: movieTitlesS[i], imageNames: imageNamesS[i], movieGenres: movieGenresS[i], releaseYears: releaseYerasS[i], descriptions: descriptionsS[i], movieTrailerUrls: movieTrailerUrlsS[i], movieRating: movieData[0], movieRuntime: movieData[1])
            print(movieData)
            movies.append(movie)
        }
        
        return movies
    }
}
