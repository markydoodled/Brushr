//
//  BrushrApp.swift
//  Brushr
//
//  Created by Mark Howard on 27/07/2023.
//

import SwiftUI
import HealthKit

@main
struct BrushrApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class HealthKitManager: ObservableObject {
    private var healthStore: HKHealthStore?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    
    func requestAuthorization() {
        guard let healthStore = healthStore else { return }
        
        let typesToWrite: Set<HKSampleType> = [HKObjectType.categoryType(forIdentifier: .toothbrushingEvent)!]
        let typesToRead: Set<HKObjectType> = [HKObjectType.categoryType(forIdentifier: .toothbrushingEvent)!]
        
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
