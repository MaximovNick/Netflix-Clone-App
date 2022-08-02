//
//  YoutubeSearchResponse.swift
//  NetflixCloneApp
//
//  Created by Nikolai Maksimov on 02.08.2022.
//

import Foundation


struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
 
