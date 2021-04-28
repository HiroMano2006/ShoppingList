//
//  Item.swift
//  ShoppingList
//
//  Created by Hiroaki Mano on 2021/03/29.
//
// Makes Items class
import Foundation

class Item:Codable  {
    
    var name : String
    
    var quantity : Int
    
    init(name : String, quantity : Int) {
        self.name = name
        self.quantity = quantity
    }

    enum CodingKeys : String, CodingKey {
        
        case name
        case quantity
        
    }
    
    //Instructions for decoding
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        
        quantity = try container.decode(Int.self, forKey: .quantity)
        
    }
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(name, forKey: .name)
        
        try container.encode(quantity, forKey: .quantity)
        
    }
    


}
    

