//
//  Response+MapMessariData.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 01.01.2021.
//

import Foundation
import RxSwift
import Moya

extension Response {
    func asMessariResponseWithData<T: MessariData & Decodable>(_ type: T.Type) throws -> MessariResponse<T> {
        guard statusCode == 200 else {
            throw MessariError.serverResponse(try self.map(MessariErrorResponse.self))
        }
        return try self.map(MessariResponse<T>.self)
    }
    
    func asMessariResponseWithData<T: Sequence & Decodable>(_ type: T.Type) throws -> MessariResponse<T> where T.Element: MessariData {
        guard statusCode == 200 else {
            throw MessariError.serverResponse(try self.map(MessariErrorResponse.self))
        }
        return try self.map(MessariResponse<T>.self)
    }
}


extension Reactive where Base: MoyaProviderType {
    func requestMessariData<T: MessariData & Decodable>(
        _ type: T.Type,
        target: Base.Target
    ) -> Single<MessariResponse<T>> {
        return self.request(target)
            .map{ try $0.asMessariResponseWithData(T.self) }
    }
    
    func requestMessariData<T: Sequence & Decodable>(
        _ type: T.Type,
        target: Base.Target
    ) -> Single<MessariResponse<T>> where T.Element: MessariData {
        return self.request(target)
            .map{ try $0.asMessariResponseWithData(T.self) }
    }
}
