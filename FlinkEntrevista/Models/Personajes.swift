//
//  Personajes.swift
//  FlinkEntrevista
//
//  Created by victor manzanero on 18/01/21.
//

import Foundation

class Personaje{
    
    
    let id:Int
    let name:String
    let gender:String
    let type:String
    let status:String
    let species:String
    let image:String
    let created:String
    let location:Location
    let origin:Origin
    let episodes:[String]
    
    
    init(id: Int, name: String, gender: String, type: String, status: String, species: String, image: String, created: String, location:Location, origin:Origin,episodes:[String]) {
        
        self.id = id
        self.name = name
        self.gender = gender
        self.type = type
        self.status = status
        self.species = species
        self.image = image
        self.created = created
        self.location = location
        self.origin = origin
        self.episodes = episodes
        
    }
    
    
    
    
    
    
    
    
    
}
