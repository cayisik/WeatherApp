//
//  MetaWeatherViewModel.swift
//  MetaWeatherApp
//
//  Created by Can Ayışık on 22.12.2020.
//

import Alamofire

protocol MetaWeatherViewModelDelegate : class {
    func didDataResponseRecieved()
}

class MetaWeatherViewModel{
    
    
    weak var delegate: MetaWeatherViewModelDelegate?
    
    var network = Network()
    
    var weathers = [Weather](){
        didSet{
            delegate?.didDataResponseRecieved()
        }
    }
    
    
    var numberOfRows : Int {
        weathers.count
    }
    
    func configureCell(_ cell: UITableViewCell, withIndexPath indexPath: IndexPath){
        cell.textLabel?.text = weathers[indexPath.row].title
        //cell.textLabel?.text = String(weathers[indexPath.row].woeid)
    }
}
