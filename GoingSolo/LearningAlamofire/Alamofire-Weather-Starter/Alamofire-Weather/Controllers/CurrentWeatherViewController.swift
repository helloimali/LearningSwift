//
//  CurrentWeatherViewController.swift
//  Alamofire-Weather
//
//  Created by Ali Malik on 6/30/19.
//  Copyright © 2019 Duc Tran. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {

    @IBOutlet weak var cityTextLabel: UILabel!
    
    @IBOutlet weak var tempLbl: UILabel!
    
    @IBOutlet weak var tempScaleLbl: UILabel!
    
    @IBOutlet weak var backgroundImgView: UIImageView!
    
    let forecastAPIKey = "a7fa2cafe6abb265928c8aa6dc3c2012"
    let coordinate: (lat: Double, long: Double) = (40.798214,-77.859909)
    
    var forecastService: ForecastService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getCurrentWeather(lat: coordinate.lat, long: coordinate.long) { (currentWeather) in
        
            if let currentWeather = currentWeather{
                DispatchQueue.main.async {
                    if let temperature = currentWeather.temperature{
                        self.tempLbl.text = "\(temperature)"
                    } else{
                        self.tempLbl.text = "can't find"
                    }
            
                   
                    
                    //////
                    
                    if let summary = currentWeather.summary{
                        self.cityTextLabel.text = "\(summary)"
                    } else {
                        self.cityTextLabel.text = "oops"
                    }
                    
                    //
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
