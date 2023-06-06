//
//  HomeModel.swift
//  Routing
//
//  Created by Tu Le C. [2] VN.Danang on 22/05/2023.
//

import Foundation

struct HomeModel: Decodable, Hashable{

    enum CodingKeys: CodingKey {
        case voteCount
        case posterPath
        case title
        case overview
    }
    
    var voteCount: String
    var posterPath: String
    var title: String
    var overview: String
}

struct HomeAPIManager: Decodable {
    
    enum CodingKeys: CodingKey {
        case results
    }

    var results: [HomeModel] = []
    
    func readJsonFile(fileName: String) async throws -> HomeAPIManager {
        do {
            try? await Task.sleep(until: .now + .seconds(3), clock: .continuous)
            let data = try getDataJson(fileName: fileName)
            return try decodeData(data: data)
        } catch {
            throw error
        }
    }
    
    func getDataJson(fileName: String) throws -> Data {
        do {
            let url = Bundle.main.url(forResource: fileName, withExtension: "json") ?? URL(filePath: "")
            let data = try Data(contentsOf: url)
            return data
        } catch {
            throw CommonError.fileNotFound
        }
    }
    
    func decodeData(data: Data) throws -> HomeAPIManager {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(HomeAPIManager.self, from: data)
            return result
        } catch {
            throw CommonError.errorParsing
        }
    }
}
