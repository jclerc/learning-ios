//
//  MovieTableViewCell.swift
//  AppCours
//
//  Created by Jonathan on 11/12/2017.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    func setData(movie: Movie) {
        titleLabel.text = movie.title
        scoreLabel.text = "\(movie.score ?? 0)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
