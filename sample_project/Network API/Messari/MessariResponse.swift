//
//  MessariResponse.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 01.01.2021.
//

import Foundation

struct MessariResponse<T: Decodable> {
    var status: MessariStatus?
    var data: T?
}

struct MessariErrorResponse {
    var timestamp: String?
    var elapsed: Int?
    var errorCode: Int?
    var errorMessage: String?
}

extension MessariErrorResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case timestamp, elapsed
        case errorCode = "error_code"
        case errorMessage = "error_message"
    }
}

extension MessariResponse: Decodable {}
