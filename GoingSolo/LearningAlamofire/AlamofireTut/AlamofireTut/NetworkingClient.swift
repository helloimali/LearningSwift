//
//  NetworkingClient.swift
//  AlamofireTut
//
//  Created by Ali Malik on 6/29/19.
//  Copyright © 2019 Malik Studios. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingClient{
    
    typealias WebServiceResponse = ([[String: Any]]?, Error?) -> Void
    
    func executeTUT(_ url: URL, completion: @escaping WebServiceResponse){
        
        Alamofire.request(url).validate().responseJSON{ response in
            if let error = response.error{
                completion(nil, error)
            }
            else if let jsonArray = response.result.value as? [[String: Any]]{
                completion(jsonArray, nil)
            }
            else if let jsonDict = response.result.value as?  [String: Any]{
                completion([jsonDict],nil)
            }
            
        }
    }
}
