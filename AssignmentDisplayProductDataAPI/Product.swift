//
//  Product.swift
//  AssignmentDisplayProductDataAPI
//
//  Created by Mac on 11/10/22.
//

import Foundation
import CoreText
//Create structer in product
struct Product : Decodable {
    let id : Int
    let title : String
    let image : URL
    let price : Float
    let description : String
    let category : String
    let rate : Float
    let count : Int
    
    enum CodingKeys : CodingKey{
        case id
        case title
        case description
        case price
        case category
        case image
        case rating
    }
    enum RatingKeys : CodingKey
    {
        case rate
        case count
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.price = try container.decode(Float.self, forKey: .price)
        self.category = try container.decode(String.self, forKey: .category)
        self.image = try container.decode(URL.self, forKey: .image)
        
        let ratingContainer = try container.nestedContainer(keyedBy: RatingKeys.self, forKey: .rating)
        self.rate = try ratingContainer.decode(Float.self, forKey: .rate)
        self.count = try ratingContainer.decode(Int.self, forKey: .count)
        
    }
}
