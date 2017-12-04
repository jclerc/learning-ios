//
//  MovieTableViewCell.swift
//  AppCours
//
//  Created by Jonathan on 04/12/2017.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var tailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        tailLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(movie: Movie) {
        headLabel.text = movie.title
        tailLabel.text = "\(movie.score)"
        
        if (movie.score > 8) {
            tailLabel.textColor = UIColor.green
        } else if (movie.score > 4) {
            tailLabel.textColor = UIColor.orange
        } else {
            tailLabel.textColor = UIColor.red
        }
    }

}
