//
//  MovieTableViewController.swift
//  TableViewApp
//
//  Created by liga.griezne on 28/10/2023.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    var movies = Movie.createMovie()
    


    override func viewDidLoad() {
      
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // #warning Incomplete implementation, return the number of rows
        return movies.count

    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        let movie = movies[indexPath.row]
        cell.movieLabel.text = movie.movieTitles
        cell.yearLabel.text =  movie.releaseYears.codingKey.stringValue
        cell.genreLabel.text = movie.movieGenres
        cell.movieImageView.image = UIImage(named: movie.imageNames)
        
//        cell.delegate = self
        

//#warning("Configure the custom cell movietableviewcell...")

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let detailMovieVC = segue.destination as? DetailMovieViewController else {return}
            detailMovieVC.movie = movies[indexPath.row]
        }
    }
}
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    



