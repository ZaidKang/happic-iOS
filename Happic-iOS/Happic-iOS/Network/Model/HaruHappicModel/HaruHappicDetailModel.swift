//
//  HaruHappicDetailModel.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/21.
//

import Foundation

// MARK: - HaruHappicDetailModel
struct HaruHappicDetailModel: Codable {
    let id, leftId, rightId, date, photo, place, who, what: String
    let when: Int
    
    enum CodingKeys: String, CodingKey {
        case id, leftId, rightId, photo, who, what, date, when
        case place = "where"
    }
}
