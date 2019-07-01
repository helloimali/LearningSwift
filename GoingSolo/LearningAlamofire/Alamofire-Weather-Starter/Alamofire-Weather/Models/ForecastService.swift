//
//  ForecastService.swift
//  Alamofire-Weather
//
//  Created by Ali Malik on 6/29/19.
//  Copyright © 2019 Duc Tran. All rights reserved.
//

import Foundation
import Alamofire


class ForecastService{
    //https://api.darksky.net/forecast/a7fa2cafe6abb265928c8aa6dc3c2012/37.8267,-122.4233
    let forecastAPIKey: String
    let forecastBaseUrl: URL?
    
    init(APIKey: String){
        self.forecastAPIKey = APIKey
        forecastBaseUrl = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    
    func getCurrentWeather( lat: Double, long: Double, completion: @escaping (CurrentWeather?) -> Void) {
        if let forecastUrl = URL(string: "\(forecastBaseUrl!)/\(lat),\(long)"){
         
            Alamofire.request(forecastUrl).responseJSON(completionHandler: {(response) in
                
                /* Testing call */
                //print(response)
                //print("***")
                //print(response.result)
                let jsonDict = response.result.value as? [String: Any]
                print("***")
        
                print(jsonDict)
 
                
                if let jsonDict = response.result.value as? [String: Any]{
                    if let currentWeatherDict = jsonDict["currently"] as? [String: Any]{
                        let currentWeather = CurrentWeather(weatherDict: currentWeatherDict)
                        completion(currentWeather)
                        print("***")
                        print("***")
                        print(currentWeather.temperature as Any)
                        print(currentWeather.summary)
                        print(currentWeather.humidity)
                        print(currentWeather.icon)
                        print(currentWeather.precipProb)
                        print(currentWeather.temperature)

                    }
                    else{
                        completion(nil)
                    }
                }

            })
            
        }
        

    }
    
}
