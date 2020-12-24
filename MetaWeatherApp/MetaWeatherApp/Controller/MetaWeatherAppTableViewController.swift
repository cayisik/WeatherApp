//
//  ViewController.swift
//  MetaWeatherApp
//
//  Created by Can Ayışık on 22.12.2020.
//

import UIKit
import CoreLocation

class MetaWeatherAppTableViewController: UITableViewController {
    
    var selectedCity : Int = 0
    
    var viewModelByCity = MetaWeatherViewModel()
    var selectedWoeid = WeatherDetailsRequest()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelByCity.delegate = self
        viewModelByCity.network.weatherRequest { (weathers, error) in
            if let error = error {
                fatalError(error.localizedDescription)
            }
            guard let weathers = weathers else { return }
             self.viewModelByCity.weathers = weathers
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelByCity.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        viewModelByCity.configureCell(cell, withIndexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCity = viewModelByCity.weathers[indexPath.row].woeid
        print(selectedCity)
        self.selectedWoeid.chosenCity = selectedCity
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! MetaWeatherDetailsViewController
            destinationVC.choosenCity = selectedCity
        }*/
    }

}

extension MetaWeatherAppTableViewController : MetaWeatherViewModelDelegate{
    func didDataResponseRecieved() {
        tableView.reloadData()
    }
}


