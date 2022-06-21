//
//  ContentView.swift
//  weatherApp
//
//  Created by Ismail on 19/06/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locations:WeatherViewModel = WeatherViewModel()
    var body: some View {
        VStack{
            if let location = locations.location{
                if let weather = locations.weather{
                    WeatherView(weather: weather)
                }else{
                    ProgressView()
                        .task {
                            do{
                                try await locations.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }catch{
                                print("kdmkdmkdmk")
                            }
                  
                        }
                }
            }else{
           
                    Welcome().environmentObject(locations)

                }
            }
    
        .background(Color(hue: 0.609, saturation: 0.689, brightness: 0.94))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
