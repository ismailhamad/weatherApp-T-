//
//  WeatherView.swift
//  weatherApp
//
//  Created by Ismail on 21/06/2022.
//

import SwiftUI

struct WeatherView: View {
    var weather:ResponseBody?
    var body: some View {
        ZStack(alignment: .leading) {
                VStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(weather?.name ?? "City")
                            .bold()
                            .font(.title)
                        
                        Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                            .fontWeight(.light)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal,2)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            VStack(spacing: 20) {
                                Image(systemName: "cloud")
                                    .font(.system(size: 40))
                                
                                Text("\(weather?.weather[0].main ?? "cc")")
                            }
                            .frame(width: 150, alignment: .leading)
                            
                            Spacer()
                            
                            Text((weather?.main.feelsLike.roundDouble() ?? "0") + "°")
                                .font(.system(size: 80))
                                .fontWeight(.bold)
                                .padding()
                        }
                        
                        Spacer()
                            .frame(height:  80)
                            .padding(.horizontal)
                        AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 350)
                            
                        } placeholder: {
                            ProgressView()
                        }
                    
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Weather now")
                            .bold()
                            .padding(.bottom)
                        
                        HStack {
                            WeatherRow(logo: "thermometer", name: "Min temp", value: ((weather?.main.tempMin.roundDouble() ?? "0") + ("°")))
                            Spacer()
                            WeatherRow(logo: "thermometer", name: "Max temp", value: ((weather?.main.tempMax.roundDouble()  ?? "0") + "°"))
                        }
                        
                        HStack {
                            WeatherRow(logo: "wind", name: "Wind speed", value: ((weather?.wind.speed.roundDouble() ?? "0") + " m/s"))
                            Spacer()
                            WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather!.main.humidity.roundDouble())%")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                    .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                    .background(.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(Color(hue: 0.609, saturation: 0.689, brightness: 0.94))
            .preferredColorScheme(.dark)
        }
    }
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
