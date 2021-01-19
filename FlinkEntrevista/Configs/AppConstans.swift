//
//  AppConstans.swift
//  FlinkEntrevista
//
//  Created by victor manzanero on 18/01/21.
//

import Foundation

class AppConstans{
    
    // DEFINE EL AMBIENTE CON EL QUE FUNCIONARÁ
    static let API_ENVIROMENT = EnumEmviroment.DEV;
    static let API_KEY = ""
    static let API_SECRET = ""
    static var tokenSeguridad:String?
    
    
    private static let API_REST_URL_LOCAL   = "";
    private static let API_REST_URL_DEV     = "https://rickandmortyapi.com/api";
    //private static let API_REST_URL_DEV   = "";
    private static let API_REST_URL_QA      = "https://rickandmortyapi.com/api";
    private static let API_REST_OTHER = "https://rickandmortyapi.com/api"
    private static let API_REST_URL_PROD    = "";
    
    static let API_REST_GET_CARACTERISTICAS               = getAPI_URL() + "/character/";
    
    
    
    static func getAPI_URL()->String{
        switch(API_ENVIROMENT){
        case EnumEmviroment.QA:
            return API_REST_URL_QA
        case EnumEmviroment.DEV:
            return API_REST_URL_DEV;
        case EnumEmviroment.LOCAL:
            return API_REST_URL_LOCAL;
        case EnumEmviroment.PROD:
            return API_REST_URL_PROD;
        case EnumEmviroment.OTHER:
            return API_REST_OTHER
        }
    }
    
    enum EnumEmviroment {
        case QA
        case DEV
        case LOCAL
        case PROD
        case OTHER
    }
    
    static func getAPI_URL_NAME()->String{
        switch(API_ENVIROMENT){
        case EnumEmviroment.QA:
            return "QA"
        case EnumEmviroment.DEV:
            return "DEV";
        case EnumEmviroment.LOCAL:
            return "LOCAL";
        case EnumEmviroment.PROD:
            return "PROD"
        case EnumEmviroment.OTHER:
            return "OTHER"
        }
    }
    
    
}
