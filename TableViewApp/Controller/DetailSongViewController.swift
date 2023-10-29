//
//  DetailSongViewController.swift
//  TableViewApp
//
//  Created by liga.griezne on 28/10/2023.
//

import UIKit

class DetailSongViewController: UIViewController {
    
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    
    var song: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let mainsong = song {
            trackImageView.image = UIImage(named: mainsong.cover)
            trackNameLabel.text = mainsong.track + "\n\(mainsong.album)"
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
