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

extension MessariResponse: Decodable {}
