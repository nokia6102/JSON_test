//
//  DetailViewController.swift
//  JSON_test
//
//  Created by 施馨檸 on 27/12/2017.
//  Copyright © 2017 施馨檸. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class DetailViewController: UIViewController {

    
    
    @IBOutlet weak var image100: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var collectionLabel: UILabel!
    
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var trackPriceLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var collectionPriceLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var artworkUrl100: URL?
    var artist: String?
    var collection: String?
    var track: String?
    var collectionPrice: Double?
    var trackPrice: Double?
    var releaseDate: String?
    var country: String?
    var currency: String?
    var previewUrl: URL?
    
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
    
    @IBAction func previewSong(_ sender: Any) {
        let player = AVPlayer(url: previewUrl!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getImage(url: artworkUrl100!) { (image) in
            DispatchQueue.main.async {
                self.image100.image = image
            }
        }
        artistLabel.text = artist!
        collectionLabel.text = collection!
        trackLabel.text = track!
        collectionPriceLabel.text = "\(collectionPrice!)"
        trackPriceLabel.text = "\(trackPrice!)"
        releaseDateLabel.text = releaseDate!
        countryLabel.text = country!
        currencyLabel.text = currency!
        
       
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
