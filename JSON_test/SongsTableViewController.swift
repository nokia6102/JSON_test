//
//  SongsTableViewController.swift
//  JSON_test
//
//  Created by 施馨檸 on 25/12/2017.
//  Copyright © 2017 施馨檸. All rights reserved.
//

import UIKit

class SongsTableViewController: UITableViewController {
    
    struct Key {
        static let songs = "songs"
    }

    var songs = [Song]()
    
    func getImage(url: URL, completion: @escaping (UIImage?) -> ()) {
        let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            }
            else {
                completion(nil)
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let urlStr = "https://itunes.apple.com/search?term=林俊傑&media=music".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)
        let task = URLSession.shared.dataTask(with: url!) { (data, res, err) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let songResults = try? decoder.decode(SongResults.self, from: data) {
                
                self.songs = songResults.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
              
            } else {
                print("error")
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Key.songs, for: indexPath) as? SongsTableViewCell else {
            fatalError()
        }

        let songsInfo = songs[indexPath.row]
        
        cell.artistLabel.text = songsInfo.artistName
        cell.trackLabel.text = songsInfo.trackName
        getImage(url: songsInfo.artworkUrl100) { (image) in
            DispatchQueue.main.async {
                cell.trackImageView.image = image
            }
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! DetailViewController
        let indexPath = tableView.indexPathForSelectedRow
        controller.artworkUrl100 = songs[(indexPath?.row)!].artworkUrl100
        controller.artist = songs[(indexPath?.row)!].artistName
        controller.collection = songs[(indexPath?.row)!].collectionName
        controller.releaseDate = songs[(indexPath?.row)!].releaseDate
        controller.track = songs[(indexPath?.row)!].trackName
        controller.collectionPrice = songs[(indexPath?.row)!].collectionPrice
        controller.trackPrice = songs[(indexPath?.row)!].trackPrice
        controller.country = songs[(indexPath?.row)!].country
        controller.currency = songs[(indexPath?.row)!].currency
        controller.previewUrl = songs[(indexPath?.row)!].previewUrl
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
 

}
