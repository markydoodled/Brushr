//
//  Brushr_watchOSApp.swift
//  Brushr watchOS Watch App
//
//  Created by Mark Howard on 28/07/2023.
//

import SwiftUI
import HealthKit

//App Entry Point For Main View
@main
struct Brushr_watchOS_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//Setup HealthKit Functions, Request Access, Get Health Store, Save Data To Store
class HealthKitManager: ObservableObject {
    private var healthStore: HKHealthStore?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    
    func requestAuthorization() {
        guard let healthStore = healthStore else { return }
        
        let typesToWrite: Set<HKSampleType> = [HKObjectType.categoryType(forIdentifier: .toothbrushingEvent)!, HKQuantityType.workoutType()]
        let typesToRead: Set<HKObjectType> = [HKObjectType.categoryType(forIdentifier: .toothbrushingEvent)!, HKQuantityType.workoutType()]
        
        healthStore.requestAuthorization(toShare: typesToWrite, read: typesToRead) { (success, error) in
            if !success {
                print("HealthKit Authorization Denied")
            }
        }
    }
    
    func saveToothbrushingEvent(timeInSeconds: Int) {
        guard let healthStore = healthStore else { return }
        
        let categoryType = HKObjectType.categoryType(forIdentifier: .toothbrushingEvent)!
        let sample = HKCategorySample(type: categoryType, value: 0, start: Date() - TimeInterval(timeInSeconds), end: Date())
        
        healthStore.save(sample) { (success, error) in
            if !success {
                print("Error Saving Toothbrushing Event To HealthKit: \(String(describing: error?.localizedDescription))")
            }
        }
    }
}

