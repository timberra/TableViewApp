//
//  DetailMovieViewController.swift
//  TableViewApp
//
//  Created by liga.griezne on 29/10/2023.
//

import UIKit

class DetailMovieViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieDetailLabel: UILabel!
    @IBOutlet weak var trailerButton: UIButton!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieTimeLabel: UILabel!
    @IBOutlet weak var timeImage: UIImageView!
    @IBOutlet weak var ratingImage: UIImageView!
    
    @IBOutlet weak var rottenTomatoLabel: UILabel!
    
    var movie: Movie?
    var isZoomed = false
    var originalFrame:CGRect = .zero

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        movieImageView.isUserInteractionEnabled = true
        movieImageView.addGestureRecognizer(tapGesture)
        originalFrame = movieImageView.frame
        if let mainmovie = movie {
            movieImageView.image = UIImage(named: mainmovie.imageNames)
            movieDetailLabel.text = mainmovie.descriptions
            movieRatingLabel.text = mainmovie.movieRating
            movieTimeLabel.text = mainmovie.movieRuntime

        }
    }
    @objc func handleTap(_sender: UITapGestureRecognizer) {
        if isZoomed {
            UIView.animate(withDuration: 0.3) {
                self.movieImageView.frame = self.originalFrame
                self.showUIElements(isHidden: false)
            }
        } else {
            let maxZoomWidth = self.view.frame.size.width
            let maxZoomHeight = self.view.frame.size.height
            let newWidth = min(maxZoomWidth, self.originalFrame.width * 2)
            let newHeight = min(maxZoomHeight, self.originalFrame.height * 2)
            let newFrame = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
            
            UIView.animate(withDuration: 0.3) {
                self.movieImageView.frame = newFrame
                self.movieImageView.center = self.view.center
                self.showUIElements(isHidden: true)
            }
        }
        isZoomed.toggle()
    }
    func showUIElements(isHidden: Bool) {
        movieDetailLabel.isHidden = isHidden
        trailerButton.isHidden = isHidden
        movieTimeLabel.isHidden = isHidden
        movieRatingLabel.isHidden = isHidden
        timeImage.isHidden = isHidden
        ratingImage.isHidden = isHidden
        rottenTomatoLabel.isHidden = isHidden
        
    }
    
    @IBAction func trailerButtonTapped(_ sender: Any) {
            let youtubeURLString = (movie?.movieTrailerUrls)!
            if let youtubeURL = URL(string: youtubeURLString) {
                if UIApplication.shared.canOpenURL(youtubeURL) {
                    UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
                } else {
                    print("cant open")
            }
        }
    }
}
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        

