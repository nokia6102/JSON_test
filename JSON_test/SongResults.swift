//
//  SongResults.swift
//  JSON_test
//
//  Created by 施馨檸 on 25/12/2017.
//  Copyright © 2017 施馨檸. All rights reserved.
//

import Foundation

struct Song: Codable {
    var artistName: String
    var collectionName: String
    var trackName: String
    var artworkUrl100: URL
    var releaseDate: String
    var collectionPrice: Double
    var trackPrice: Double
    var country: String
    var currency: String
    var previewUrl: URL
}

struct SongResults: Codable {
    
    var results: [Song]
}
