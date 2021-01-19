//
//  AppStructs.swift
//  FlinkEntrevista
//
//  Created by victor manzanero on 18/01/21.
//

import Foundation

struct Response:Decodable {
    
    let info:String
    let result:String
    
}

struct Location {
    
   
    let name:String
    let url:String
    
    
}

struct Origin {
    

    let name:String
    let url:String

    
}
