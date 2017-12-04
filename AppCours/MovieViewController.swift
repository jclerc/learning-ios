//
//  MovieViewController.swift
//  AppCours
//
//  Created by Jonathan on 04/12/2017.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var movieList = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        movieList.append(Movie("Star Wars I", 4.1))
        movieList.append(Movie("Star Wars II", 3.4))
        movieList.append(Movie("Star Wars III", 8.7))
        movieList.append(Movie("Star Wars IV", 3.2))
        movieList.append(Movie("Star Wars V", 6.3))
        movieList.append(Movie("Star Wars VI", 9.1))
    }
}

extension MovieViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell")
        if let cell = cell as? MovieTableViewCell {
            
            let index = indexPath.row
            let movie = movieList[index]
            cell.setup(movie: movie)
            return cell
        }
        
        return UITableViewCell()
    }
    
}

extension MovieViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let index = indexPath.row
        let movie = movieList[index]
        
        let alertController = UIAlertController(title: "\(movie.score)/10", message: "Film: \(movie.title)", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
}
