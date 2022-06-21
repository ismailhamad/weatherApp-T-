//
//  Welcome.swift
//  weatherApp
//
//  Created by Ismail on 19/06/2022.
//

import SwiftUI
import CoreLocationUI
struct Welcome: View {
    @EnvironmentObject var location:WeatherViewModel
    var body: some View {
        VStack{
            VStack(spacing:20){
                Text("Welcome to Weather App")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("Please share your current location to get the weather in your idea")
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .padding()
            LocationButton(.shareCurrentLocation){
                location.requestLocation()
            }
            .cornerRadius(20)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame( maxWidth:.infinity, maxHeight: .infinity)
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
