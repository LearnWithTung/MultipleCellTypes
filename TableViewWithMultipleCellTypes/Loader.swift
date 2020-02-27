//
//  Loader.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Tung Vu Duc on 2/25/20.
//  Copyright © 2020 Stanislav Ostrovskiy. All rights reserved.
//

import Foundation

protocol ProfileLoaderProtocol {
    func loadUserData(completion: @escaping (Result<Profile, Error>) -> Void)
}

class Loader: ProfileLoaderProtocol {
    
    public enum Error: Swift.Error {
        case invalidData
    }
    
    func loadUserData(completion: @escaping (Result<Profile, Swift.Error>) -> Void) {
        guard let data = dataFromFile("ServerData"), let profile = Profile(data: data) else {
            completion(.failure(Error.invalidData))
            return
        }
        completion(.success(profile))
    }
    
}
