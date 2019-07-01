//
//  CurrentWeather.swift
//  Alamofire-Weather
//
//  Created by Ali Malik on 6/29/19.
//  Copyright © 2019 Duc Tran. All rights reserved.
//

import Foundation


class CurrentWeather{
    
    let temperature: Double?
    let humidity: Int?
    let precipProb: Int?
    let summary: String?
    let icon: String?
    //let place: String?
    
    struct WeatherKeys {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProb = "precipProbability"
        static let summary = "summary"
        static let icon = "icon"
        //static let place = "lo"
    }
    
    
    init(weatherDict: [String: Any]){
        
        temperature = weatherDict[WeatherKeys.temperature] as? Double
        //print(":::TEMP:::")
        //print(weatherDict[WeatherKeys.temperature])
        //print(temperature)
        //print(weatherDict[summary] as? String)
        //print(weatherDict["temperature"])
        //print(weatherDict)

        if let humidityDouble = weatherDict[WeatherKeys.humidity] as? Double {
            humidity = Int(humidityDouble * 100)
        } else{
            humidity = nil
        }
        
        if let precipDouble = weatherDict[WeatherKeys.precipProb] as? Double{
            precipProb = Int(precipDouble * 100)
        } else{
            precipProb = nil
        }
        
        summary = weatherDict[WeatherKeys.summary] as? String
        icon = weatherDict[WeatherKeys.icon] as? String
        
    }
    
    
}















