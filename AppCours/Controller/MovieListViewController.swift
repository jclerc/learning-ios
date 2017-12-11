//
//  MovieListViewController.swift
//  AppCours
//
//  Created by Jonathan on 11/12/2017.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {

    var movies = [Movie]()
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var scoreField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func tryAddMovie(_ sender: Any) {
        if let movieTitle = titleField.text, let movieScore = Float(scoreField.text!) {
            let movie = Movie(title: movieTitle, score: movieScore)
            movies.append(movie)
            // With animation
            let indexPath = IndexPath(row: movies.count - 1, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
            // Reload whole table
//            tableView.reloadData()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MovieListViewController: UITableViewDataSource {
    //return the number of row for a given section
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    //return the cell for a given indexPath
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieTableViewCell
        cell.setData(movie: movies[indexPath.row])
        return cell
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let movie = movies[index]
        
        if let movieSingleController = storyboard?.instantiateViewController(withIdentifier: "MovieSingleController") as? MovieSingleViewController {
            movieSingleController.movie = movie
            navigationController?.pushViewController(movieSingleController, animated: true)
        }
    }
}
