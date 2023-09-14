//
//  Account.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 22/08/2023.
//

import Foundation

struct Account: Identifiable, Codable {
    let id: Int
    let email: String
    let password: String
    let address: String
    let nickname: String

    init(id: Int,
         email: String,
         password: String,
         address: String,
         nickname: String
    ) {
        self.id = id
        self.email = email
        self.password = password
        self.address = address
        self.nickname = nickname
    }

    enum CodingKeys: CodingKey {
        case id
        case email
        case password
        case address
        case nickname
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.email = try container.decode(String.self, forKey: .email)
        self.password = try container.decode(String.self, forKey: .password)
        self.address = try container.decode(String.self, forKey: .address)
        self.nickname = try container.decode(String.self, forKey: .nickname)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(address, forKey: .address)
        try container.encode(nickname, forKey: .nickname)
    }
}

extension Optional: RawRepresentable where Wrapped: Codable {
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let json = String(data: data, encoding: .utf8)
        else {
            return "{}"
        }
        return json
    }

    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let value = try? JSONDecoder().decode(Self.self, from: data)
        else {
            return nil
        }
        self = value
    }
}
