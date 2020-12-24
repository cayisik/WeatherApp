//
//  Network.swift
//  MetaWeatherApp
//
//  Created by Can Ayışık on 22.12.2020.
//

import Alamofire
import CoreLocation

class Network {
    //let nerbyCitiesURL = "https://www.metaweather.com/api/location/search/?lattlong=\(lat),\(long))"
    let nerbyCitiesURL = "https://www.metaweather.com/api/location/search/?lattlong=37.777119,-122.41964"
    //let weatherDetailsURL = "https://www.metaweather.com/api/location/2487956/"
    
    func request<T: Decodable>(url: URLConvertible,completion: @escaping ([T]?, Error?) -> Void) {
        Alamofire.request(url,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding.default ,
                          headers: nil).responseJSON { response in
                            
                            switch response.result {
                            case .success:
                                    do {
                                        let items = try JSONDecoder().decode([T].self, from: response.data!)
                                        completion(items,nil)
                                    } catch  {
                                        completion(nil,error)
                                    }
                            case .failure(let error):
                                completion(nil,error)
                            }
                          }
    }

    func weatherRequest(completion: @escaping ([Weather]?, Error?) -> Void) {
        request(url: nerbyCitiesURL, completion: completion)
    }
    /*
    func weatherDetailsRequest(completion: @escaping ([WeatherDetails]?, Error?) -> Void) {
        request(url: weatherDetailsURL, completion: completion)
    }
    */
    
}
