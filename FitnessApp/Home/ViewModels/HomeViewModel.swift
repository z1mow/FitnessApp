//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Şakir Yılmaz ÖĞÜT on 3.01.2025.
//

import SwiftUI


class HomeViewModel: ObservableObject {
    
    @State var calories: Int = 123
    @State var active: Int = 52
    @State var stand: Int = 8
    
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
    
}
