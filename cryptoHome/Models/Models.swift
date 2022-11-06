//
//  Models.swift
//  cryptoHome
//
//  Created by Kazakov Danil on 06.11.2022.
//

struct Crypto: Codable {
    let asset_id: String
    let name: String?
    let price_usd: Float?
    let id_icon: String?
}
