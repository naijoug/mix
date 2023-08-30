//
//  2106-AsyncAwait.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct Joke: Codable {
  let setup: String
  let delivery: String
}


func fetchJoke() async throws -> Joke {
  let url = URL(string: "https://v2.jokeapi.dev/joke/Programming?type=twopart")!
  let request = URLRequest(url: url)
  let (data, _) = try await URLSession.shared.data(for: request)
  let joke = try JSONDecoder().decode(Joke.self, from: data)
  return joke
}

struct ContentView_2106: View {
  @State private var joke: Joke?
  @State private var isLoading = false

  var body: some View {
    VStack(spacing: 8) {
      if let joke = joke {
        Text(joke.setup)
          .font(.title)
        Text(joke.delivery)
          .font(.headline)
      } else {
        Text("Tap to fetch a joke!")
      }

      Button {
        Task {
          isLoading = true
          do {
            joke = try await fetchJoke()
          } catch {
            print("Failed to fetch joke: \(error)")
          }
          isLoading = false
        }
      } label: {
        if isLoading {
          ProgressView()
            .progressViewStyle(.circular)
            .padding(.horizontal)
        } else {
          Text("Fetch Joke")
        }
      }
      .disabled(isLoading)
      .buttonStyle(.borderedProminent)
      .padding()
    }
    .multilineTextAlignment(.center)
    .padding(.horizontal)
  }
}

