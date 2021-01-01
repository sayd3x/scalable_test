//
//  MessariStatus.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 01.01.2021.
//

import Foundation

struct MessariStatus {
    var timestamp: String?
    var elapsed: Int?
}

extension MessariStatus: Decodable {}
