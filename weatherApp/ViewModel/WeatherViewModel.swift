//
//  WeatherViewModel.swift
//  weatherApp
//
//  Created by Ismail on 19/06/2022.
//

import Foundation
import CoreLocation

class WeatherViewModel:NSObject,ObservableObject,CLLocationManagerDelegate{
    let manager = CLLocationManager()
    @Published var isLoading = false
    @Published var weather:ResponseBody?
    @Published var location:CLLocationCoordinate2D?
    override init() {
        super.init()
        manager.delegate = self
    }
    func requestLocation(){
        isLoading = true
        manager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location",error)
        isLoading = true
    }
    
    // HTTP request to get the current weather depending on the coordinates we got from LocationManager
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws {
        // Replace YOUR_API_KEY in the link below with your own
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=b4eec9ff246234fe505e986e51e8d490&units=metric") else { fatalError("Missing URL") }


        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        weather = decodedData
    
    }
    
}
