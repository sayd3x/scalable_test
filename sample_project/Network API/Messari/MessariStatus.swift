//
//  MessariStatus.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 01.01.2021.
//

import Foundation

struct MessariStatus: Decodable {
    var timestamp: String?
    var elapsed: Int?
    var errorCode: Int?
    var errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case timestamp, elapsed
        case errorCode = "error_code"
        case errorMessage = "error_message"
    }
}
