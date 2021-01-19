//
//  AppController.swift
//  FlinkEntrevista
//
//  Created by victor manzanero on 18/01/21.
//

import Foundation

class AppController{
    
    let appNetworkUtils = AppNetworkUtils();
    
    // MARK: LOGIN
    public func getData(completion: @escaping (Any,Error?)-> ()){
        let json = [String:Any]()
      
        
        let endpoint = AppConstans.API_REST_GET_CARACTERISTICAS;
        print("url: \(endpoint)");
        
        
        appNetworkUtils.loadJsonUrl(endpoint: endpoint, jsonBody: json) { (data, res, err) in
            print("getData ")
            if(err != nil){
                completion("null",err);
                return;
            }
            do{
                
                
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
          
                
                
                
                completion(json!,nil)
            }catch let jsonErr{
                //print(jsonErr);
                completion("null",jsonErr)
            }
        }
    }
}
