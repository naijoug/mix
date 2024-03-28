//
//  2101-DesignASeamlessOnboardingExperience.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct OnboardingView: View {
  let title: String
  let image: String
  let description: String

  var body: some View {
    VStack {
      Image(systemName: image)
        .font(.largeTitle)
        .padding()
      Text(title)
        .font(.headline)
      Text(description)
        .multilineTextAlignment(.center)
        .padding()
    }
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView(title: "Fun Fact", image: "paperplane.fill", description: "Space travel isn't for the faint-hearted.")
  }
}

struct ContentView_2101_01: View {
  var body: some View {
    TabView {
      OnboardingView(title: "The Final Frontier", image: "globe", description: "Explore the universe from the comfort of your spaceship!")
      OnboardingView(title: "Meet Alien Friends", image: "person.3.fill", description: "Make intergalactic friendships with beings from other planets!")
      OnboardingView(title: "Astronaut Life", image: "suit.fill", description: "Live the astronaut lifestyle with zero gravity workouts!")
    }
    .tabViewStyle(.page)
    .padding()
  }
}

struct ContentView_2101: View {
  @State private var showMainApp = false

  var body: some View {
    if showMainApp {
      Text("Welcome to CosmoJourney!")
        .multilineTextAlignment(.center)
        .font(.largeTitle)
    } else {
      VStack {
        TabView {
          OnboardingView(title: "The Final Frontier", image: "globe", description: "Explore the universe from the comfort of your spaceship!")
          OnboardingView(title: "Meet Alien Friends", image: "person.3.fill", description: "Make intergalactic friendships with beings from other planets!")
          OnboardingView(title: "Astronaut Life", image: "airplane", description: "Live the astronaut lifestyle with zero gravity workouts!")
        }
        .tabViewStyle(.page)

        Spacer()

        Button("Get Started") {
          showMainApp.toggle()
        }
        .padding()
        .font(.title3)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding(.bottom)
      }
    }
  }
}
