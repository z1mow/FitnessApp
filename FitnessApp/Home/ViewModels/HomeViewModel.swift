//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Şakir Yılmaz ÖĞÜT on 3.01.2025.
//

import SwiftUI


class HomeViewModel: ObservableObject {
    
    let healthManager = HealthManager.shared
    
    @Published var calories: Int = 0
    @Published var exercise: Int = 0
    @Published var stand: Int = 0
    
    var mockActivities = [
        Activity(id: 1, title: "Walking", subtitle: "Goal 11,000", image: "figure.walk", tintColor: .yellow, amount: "10,453"),
        Activity(id: 2, title: "Walking", subtitle: "Goal 7,000", image: "figure.walk", tintColor: .blue, amount: "2,193"),
        Activity(id: 3, title: "Walking", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .pink, amount: "8,750"),
        Activity(id: 4, title: "Walking", subtitle: "Goal 16,000", image: "figure.walk", tintColor: .green, amount: "11,453")
    ]
    
    var mockWorkouts = [
        Workout(id: 0, title: "Running", image: "figure.run", tintColor: .cyan, duration: "51 mins", date: "Aug 1", calories: "512 kcal"),
        Workout(id: 1, title: "Running", image: "figure.run", tintColor: .green, duration: "51 mins", date: "Aug 1", calories: "512 kcal"),
        Workout(id: 2, title: "Running", image: "figure.run", tintColor: .blue, duration: "51 mins", date: "Aug 1", calories: "512 kcal")
    ]
    
    init() {
        Task {
            do {
                try await healthManager.requestHealthKitAccess()
                fetchTodayCalories()
                fetchTodayStandHours()
                fetchTodayExerciseTime()
            } catch {
                print(error.localizedDescription)
            }
            
        }
        
    }
    
    func fetchTodayCalories() {
        healthManager.fetchTodayCaloriesBurned { result in
            switch result {
            case .success(let calories):
                DispatchQueue.main.async {
                    self.calories = Int(calories)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchTodayExerciseTime() {
        healthManager.fetchTodayExerciseTime { result in
            switch result {
            case .success(let exercise):
                DispatchQueue.main.async {
                    self.exercise = Int(exercise)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchTodayStandHours() {
        healthManager.fetchTodayCaloriesBurned { result in
            switch result {
            case .success(let hours):
                DispatchQueue.main.async {
                    self.stand = Int(hours)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
