//
//  WeatherDetailsRequest.swift
//  MetaWeatherApp
//
//  Created by Can Ayışık on 24.12.2020.
//

import Foundation

class WeatherDetailsRequest {
        
    var chosenCity : Int = 2455920
    
    
    func getWeather(result: @escaping (WeatherResponse?) -> ()) {
        let weatherAPIEndpoint = "https://www.metaweather.com/api/location/\(self.chosenCity)/"
        let request = NSMutableURLRequest(url: NSURL(string: weatherAPIEndpoint)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                do {
                    let responseJSON = try JSONDecoder().decode(WeatherResponse.self, from: data!)
                    result(responseJSON)
                } catch {
                    print("error")
                }
                
            }
        })

        dataTask.resume()
    }
    
}
