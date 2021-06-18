//
//  FitnessModel.swift
//  Bruno Barbosa Fitness App
//
//  Created by Christopher Soares on 5/2/21.
//

import Foundation

class FitnessModel: ObservableObject {
    @Published var workouts = [Workout]()
    
    init() {
        //Create instance of data service and get the data
    
        self.workouts = DataService.getLocalData()
        
        // Set the workouts porperty
        
    }
}
