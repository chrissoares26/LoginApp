//
//  DataServices.swift
//  Bruno Barbosa Fitness App
//
//  Created by Christopher Soares on 5/8/21.
//

import Foundation


class DataService {
    
    static func getLocalData() -> [Workout] {
        
        // Parse local json file
        
        // Ger a url path to the json dile
        let pathString = Bundle.main.path(forResource: "workout", ofType: "json")
        
        guard pathString != nil else {
         return [Workout]()
        }
            
            // Create a url object
            
            let url = URL(fileURLWithPath: pathString!)
            
            // Error handling
            
            do {
                // Create a data object
                let data = try Data(contentsOf: url)
                
                // Parse the data
                
               let decoder = JSONDecoder()
                
                do {
                    let workoutData = try decoder.decode([Workout].self, from: data)
                    
                    //Set Unique IDs for each instance
                    
                    for r in workoutData {
                        
                        // Set a unique ID for wach workout in the workoutData array
                        
                        r.id = UUID()
                        
                        for i in r.routine {
                            i.id = UUID()
                        }
                        
                    }
                    
                    // Assign the data to the published property
                    return workoutData
            }
                catch{
                    // Log couldn't decode json
                    print(error)
                }
            }
            catch{
                // Handle the error
                print(error)
            }
         
            return [Workout]()
           
            
            
        }
    }
    

