//
//  AssetDetailsItem.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 30.12.2020.
//

import Foundation

enum AssetDetailsItem {
    case description(_ model: AssetDetailsDescriptionViewModel)
    case reference(_ url: String, _ model: AssetDetailsRefViewModel)
}
