//
//  2107-UsingCombine.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

import Combine

struct Weather: Codable {
  let temperature: Double
  let description: Description

  enum Description: String, Codable, CaseIterable {
    case sunny, cloudy, rainy, snowing
  }
}

class WeatherService {
  func fetchWeather(for city: String) -> AnyPublisher<Weather, Error> {
    // Simulating a network call to get weather information
    let weather = Weather(
      temperature: Double.random(in: 0..<40),
      description: Weather.Description.allCases.randomElement()!
    )

    return Just(weather)
      .setFailureType(to: Error.self)
      .delay(for: 1.0, scheduler: RunLoop.main)
      .eraseToAnyPublisher()
  }
}

class WeatherViewModel: ObservableObject {
  private var cancellables = Set<AnyCancellable>()
  private let weatherService = WeatherService()
  
  @Published var weather: Weather?
  let citySubject = PassthroughSubject<String, Never>()
  
  init() {
    citySubject
      .debounce(for: 0.5, scheduler: RunLoop.main)
      .flatMap { [unowned self] city in
        self.weatherService.fetchWeather(for: city)
      }
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { _ in }, receiveValue: { [unowned self] weather in
        self.weather = weather
      })
      .store(in: &cancellables)
  }
}

struct ContentView_2107: View {
  @ObservedObject var viewModel = WeatherViewModel()

  @State private var city: String = ""

  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      TextField("Enter city", text: $city, onCommit: {
        viewModel.citySubject.send(city)
      })
      if let weather = viewModel.weather {
        HStack {
          Image(systemName: imageName(for: weather.description))
          VStack(alignment: .leading) {
            Text("Temperature: \(Int(weather.temperature.rounded()))°C")
              .font(.headline)
            Text(weather.description.rawValue.capitalized)
              .font(.subheadline)
          }
        }
      }
    }
    .padding()
  }

  func imageName(for description: Weather.Description) -> String {
    switch description {
    case .sunny: return "sun.max.fill"
    case .cloudy: return "cloud.fill"
    case .rainy: return "cloud.rain.fill"
    case .snowing: return "cloud.snow.fill"
    }
  }
}
