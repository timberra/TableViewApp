//
//  MovieRating.swift
//  TableViewApp
//
//  Created by liga.griezne on 29/10/2023.
//

import Foundation
func fetchMovieRatings(forTitle title: String, year: Int) -> [String]{
    var movieData = ["No rating data available", "No runtime data available"] as [String]
    let formattedTitle = title.replacingOccurrences(of: " ", with: "%20")
    let urlString = "https://rottentomato.cinemascan.org/movie?title=" + formattedTitle + "&year=" + String(year)
    
    if let url = URL(string: urlString) {
        let semaphore = DispatchSemaphore(value: 0)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
//                        print(json)
                        if let tomtatoScore = json["tomatometerScore"] as? [String:Any] {
                            if let fetchedRating = tomtatoScore["averageRating"] as? String {
                                movieData[0] = fetchedRating
                            }
                        }
                        if let runtime = json["runtime"] as? String {
                            movieData[1] = runtime
                        }
                    }
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            }
            semaphore.signal()
        }.resume()
        semaphore.wait()
    }
    return movieData
}
