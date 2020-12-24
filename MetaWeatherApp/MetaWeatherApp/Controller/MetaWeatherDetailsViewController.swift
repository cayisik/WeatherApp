//
//  MetaWeatherDetailsViewController.swift
//  MetaWeatherApp
//
//  Created by Can Ayışık on 24.12.2020.
//

import UIKit

class MetaWeatherDetailsViewController: UIViewController {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherImage2: UIImageView!
    @IBOutlet weak var weatherImage3: UIImageView!
    @IBOutlet weak var weatherImage4: UIImageView!
    @IBOutlet weak var weatherImage5: UIImageView!
    @IBOutlet weak var weatherImage6: UIImageView!
    
    @IBOutlet weak var theTempLabel: UILabel!
    @IBOutlet weak var theTempLabel2: UILabel!
    @IBOutlet weak var theTempLabel3: UILabel!
    @IBOutlet weak var theTempLabel4: UILabel!
    @IBOutlet weak var theTempLabel5: UILabel!
    @IBOutlet weak var theTempLabel6: UILabel!
    
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var minTempLabel2: UILabel!
    @IBOutlet weak var minTempLabel3: UILabel!
    @IBOutlet weak var minTempLabel4: UILabel!
    @IBOutlet weak var minTempLabel5: UILabel!
    @IBOutlet weak var minTempLabel6: UILabel!
    
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel2: UILabel!
    @IBOutlet weak var maxTempLabel3: UILabel!
    @IBOutlet weak var maxTempLabel4: UILabel!
    @IBOutlet weak var maxTempLabel5: UILabel!
    @IBOutlet weak var maxTempLabel6: UILabel!
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityNameLabel2: UILabel!
    @IBOutlet weak var cityNameLabel3: UILabel!
    @IBOutlet weak var cityNameLabel4: UILabel!
    @IBOutlet weak var cityNameLabel5: UILabel!
    @IBOutlet weak var cityNameLabel6: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateLabel2: UILabel!
    @IBOutlet weak var dateLabel3: UILabel!
    @IBOutlet weak var dateLabel4: UILabel!
    @IBOutlet weak var dateLabel5: UILabel!
    @IBOutlet weak var dateLabel6: UILabel!

    @IBOutlet weak var weatherStateLabel: UILabel!
    @IBOutlet weak var weatherStateLabel2: UILabel!
    @IBOutlet weak var weatherStateLabel3: UILabel!
    @IBOutlet weak var weatherStateLabel4: UILabel!
    @IBOutlet weak var weatherStateLabel5: UILabel!
    @IBOutlet weak var weatherStateLabel6: UILabel!
    
    let imageEndpointURL = "https://www.metaweather.com/static/img/weather/png/#IMAGE#.png"
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWeather()

    }
    func loadWeather() {
            let API = WeatherDetailsRequest()
            API.getWeather { (response) in
                print(response?.consolidatedWeather.count)
                DispatchQueue.main.async() {
                    let tomorrowWeather = response?.consolidatedWeather[0]
                    guard let unwTomorrowWeather = tomorrowWeather else {
                        return
                    }
                    self.cityNameLabel.text = response?.title
                    let weatherStateAbbr = tomorrowWeather?.weatherStateAbbr
                    guard let unwWeatherStateAbbr = weatherStateAbbr else {
                        return
                    }
                    let imageString =  self.imageEndpointURL.replacingOccurrences(of: "#IMAGE#", with: unwWeatherStateAbbr)
                    let imageUrl = URL(string: imageString)
                    guard let unwImageUrl = imageUrl else {
                        return
                    }
                    let data = try? Data(contentsOf: unwImageUrl)
                    if let imageData = data {
                        self.weatherImage.image = UIImage(data: imageData)
                    }
                    self.weatherStateLabel.text = unwTomorrowWeather.weatherStateName
                    self.theTempLabel.text = String(unwTomorrowWeather.theTemp)
                    self.minTempLabel.text = String(unwTomorrowWeather.minTemp)
                    self.maxTempLabel.text = String(unwTomorrowWeather.maxTemp)
                    self.dateLabel.text = unwTomorrowWeather.applicableDate
                }
                DispatchQueue.main.async() {
                    let tomorrowWeather = response?.consolidatedWeather[1]
                    guard let unwTomorrowWeather = tomorrowWeather else {
                        return
                    }
                    self.cityNameLabel2.text = response?.title
                    let weatherStateAbbr = tomorrowWeather?.weatherStateAbbr
                    guard let unwWeatherStateAbbr = weatherStateAbbr else {
                        return
                    }
                    let imageString =  self.imageEndpointURL.replacingOccurrences(of: "#IMAGE#", with: unwWeatherStateAbbr)
                    let imageUrl = URL(string: imageString)
                    guard let unwImageUrl = imageUrl else {
                        return
                    }
                    let data = try? Data(contentsOf: unwImageUrl)
                    if let imageData = data {
                        self.weatherImage2.image = UIImage(data: imageData)
                    }
                    self.weatherStateLabel2.text = unwTomorrowWeather.weatherStateName
                    self.theTempLabel2.text = String(unwTomorrowWeather.theTemp)
                    self.minTempLabel2.text = String(unwTomorrowWeather.minTemp)
                    self.maxTempLabel2.text = String(unwTomorrowWeather.maxTemp)
                    self.dateLabel2.text = unwTomorrowWeather.applicableDate
                }
                DispatchQueue.main.async() {
                    let tomorrowWeather = response?.consolidatedWeather[2]
                    guard let unwTomorrowWeather = tomorrowWeather else {
                        return
                    }
                    self.cityNameLabel3.text = response?.title
                    let weatherStateAbbr = tomorrowWeather?.weatherStateAbbr
                    guard let unwWeatherStateAbbr = weatherStateAbbr else {
                        return
                    }
                    let imageString =  self.imageEndpointURL.replacingOccurrences(of: "#IMAGE#", with: unwWeatherStateAbbr)
                    let imageUrl = URL(string: imageString)
                    guard let unwImageUrl = imageUrl else {
                        return
                    }
                    let data = try? Data(contentsOf: unwImageUrl)
                    if let imageData = data {
                        self.weatherImage3.image = UIImage(data: imageData)
                    }
                    self.weatherStateLabel3.text = unwTomorrowWeather.weatherStateName
                    self.theTempLabel3.text = String(unwTomorrowWeather.theTemp)
                    self.minTempLabel3.text = String(unwTomorrowWeather.minTemp)
                    self.maxTempLabel3.text = String(unwTomorrowWeather.maxTemp)
                    self.dateLabel3.text = unwTomorrowWeather.applicableDate
                }
                DispatchQueue.main.async() {
                    let tomorrowWeather = response?.consolidatedWeather[3]
                    guard let unwTomorrowWeather = tomorrowWeather else {
                        return
                    }
                    self.cityNameLabel4.text = response?.title
                    let weatherStateAbbr = tomorrowWeather?.weatherStateAbbr
                    guard let unwWeatherStateAbbr = weatherStateAbbr else {
                        return
                    }
                    let imageString =  self.imageEndpointURL.replacingOccurrences(of: "#IMAGE#", with: unwWeatherStateAbbr)
                    let imageUrl = URL(string: imageString)
                    guard let unwImageUrl = imageUrl else {
                        return
                    }
                    let data = try? Data(contentsOf: unwImageUrl)
                    // set weather image
                    if let imageData = data {
                        self.weatherImage4.image = UIImage(data: imageData)
                    }
                    self.weatherStateLabel4.text = unwTomorrowWeather.weatherStateName
                    self.theTempLabel4.text = String(unwTomorrowWeather.theTemp)
                    self.minTempLabel4.text = String(unwTomorrowWeather.minTemp)
                    self.maxTempLabel4.text = String(unwTomorrowWeather.maxTemp)
                    self.dateLabel4.text = unwTomorrowWeather.applicableDate
                }
                DispatchQueue.main.async() {
                    let tomorrowWeather = response?.consolidatedWeather[4]
                    guard let unwTomorrowWeather = tomorrowWeather else {
                        return
                    }
                    self.cityNameLabel5.text = response?.title
                    let weatherStateAbbr = tomorrowWeather?.weatherStateAbbr
                    guard let unwWeatherStateAbbr = weatherStateAbbr else {
                        return
                    }
                    let imageString =  self.imageEndpointURL.replacingOccurrences(of: "#IMAGE#", with: unwWeatherStateAbbr)
                    let imageUrl = URL(string: imageString)
                    guard let unwImageUrl = imageUrl else {
                        return
                    }
                    let data = try? Data(contentsOf: unwImageUrl)
                    // set weather image
                    if let imageData = data {
                        self.weatherImage5.image = UIImage(data: imageData)
                    }
                    self.weatherStateLabel5.text = unwTomorrowWeather.weatherStateName
                    self.theTempLabel5.text = String(unwTomorrowWeather.theTemp)
                    self.minTempLabel5.text = String(unwTomorrowWeather.minTemp)
                    self.maxTempLabel5.text = String(unwTomorrowWeather.maxTemp)
                    self.dateLabel5.text = unwTomorrowWeather.applicableDate
                }
                DispatchQueue.main.async() {
                    let tomorrowWeather = response?.consolidatedWeather[5]
                    guard let unwTomorrowWeather = tomorrowWeather else {
                        return
                    }
                    self.cityNameLabel6.text = response?.title
                    let weatherStateAbbr = tomorrowWeather?.weatherStateAbbr
                    guard let unwWeatherStateAbbr = weatherStateAbbr else {
                        return
                    }
                    let imageString =  self.imageEndpointURL.replacingOccurrences(of: "#IMAGE#", with: unwWeatherStateAbbr)
                    let imageUrl = URL(string: imageString)
                    guard let unwImageUrl = imageUrl else {
                        return
                    }
                    let data = try? Data(contentsOf: unwImageUrl)
                    // set weather image
                    if let imageData = data {
                        self.weatherImage6.image = UIImage(data: imageData)
                    }
                    self.weatherStateLabel6.text = unwTomorrowWeather.weatherStateName
                    self.theTempLabel6.text = String(unwTomorrowWeather.theTemp)
                    self.minTempLabel6.text = String(unwTomorrowWeather.minTemp)
                    self.maxTempLabel6.text = String(unwTomorrowWeather.maxTemp)
                    self.dateLabel6.text = unwTomorrowWeather.applicableDate
                }
                
            }
        }
    
}
