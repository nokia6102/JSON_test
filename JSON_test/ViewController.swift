//
//  ViewController.swift
//  JSON_test
//
//  Created by 施馨檸 on 25/12/2017.
//  Copyright © 2017 施馨檸. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlStr = "https://itunes.apple.com/search?term=林俊傑&media=music".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)
        let task = URLSession.shared.dataTask(with: url!) { (data, res, err) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let songResults = try? decoder.decode(SongResults.self, from: data) {
                for track in songResults.results {
                    print(track.trackName)
                    print(track.releaseDate)
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


}

