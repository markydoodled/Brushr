//
//  AppIntents.swift
//  Brushr
//
//  Created by Mark Howard on 29/07/2023.
//

import AppIntents
import SwiftUI

struct CustomTimerIntent: AppIntent {
    static var title: LocalizedStringResource = "Log Custom Brushing Time"
    static var description = IntentDescription("Log A Custom Toothbrushing Time To The Apple Health App.")
    
    @Parameter(title: "Minutes")
    var minutes: Int?
    @Parameter(title: "Seconds")
    var seconds: Int?

    @MainActor
    func perform() async throws -> some ProvidesDialog {
        guard let providedMinutes = minutes else {
            throw $minutes.needsValueError("How Many Minutes To Log?")
        }
        guard let providedSeconds = seconds else {
            throw $seconds.needsValueError("How Many Seconds To Log?")
        }
        
        var healthKitManager = HealthKitManager()
        healthKitManager.requestAuthorization()
        healthKitManager.saveToothbrushingEvent(timeInSeconds: (providedMinutes * 60) + providedSeconds)
        
        return .result(dialog: "Logged Toothbrushing Time Of \(providedMinutes) Minutes And \(providedSeconds) Seconds")
    }
}

struct Timer30Intent: AppIntent {
    static var title: LocalizedStringResource = "Log A 00:30 Toothbrushing Time"
    static var description = IntentDescription("Log A Toothbrushing Time For 00:30 To The Apple Health App.")

    @MainActor
    func perform() async throws -> some ProvidesDialog {
        var healthKitManager = HealthKitManager()
        healthKitManager.requestAuthorization()
        healthKitManager.saveToothbrushingEvent(timeInSeconds: 30)
        
        return .result(dialog: "Logged A 00:30 Toothbrushing Time")
    }
}

struct Timer1Intent: AppIntent {
    static var title: LocalizedStringResource = "Log A 01:00 Toothbrushing Time"
    static var description = IntentDescription("Log A Toothbrushing Time For 01:00 To The Apple Health App.")

    @MainActor
    func perform() async throws -> some ProvidesDialog {
        var healthKitManager = HealthKitManager()
        healthKitManager.requestAuthorization()
        healthKitManager.saveToothbrushingEvent(timeInSeconds: 60)
        
        return .result(dialog: "Logged A 01:00 Toothbrushing Time")
    }
}

struct Timer2Intent: AppIntent {
    static var title: LocalizedStringResource = "Log A 02:00 Toothbrushing Time"
    static var description = IntentDescription("Log A Toothbrushing Time For 02:00 To The Apple Health App.")

    @MainActor
    func perform() async throws -> some ProvidesDialog {
        var healthKitManager = HealthKitManager()
        healthKitManager.requestAuthorization()
        healthKitManager.saveToothbrushingEvent(timeInSeconds: 120)
        
        return .result(dialog: "Logged A 02:00 Toothbrushing Time")
    }
}

struct Timer3Intent: AppIntent {
    static var title: LocalizedStringResource = "Log A 03:00 Toothbrushing Time"
    static var description = IntentDescription("Log A Toothbrushing Time For 03:00 To The Apple Health App.")

    @MainActor
    func perform() async throws -> some ProvidesDialog {
        var healthKitManager = HealthKitManager()
        healthKitManager.requestAuthorization()
        healthKitManager.saveToothbrushingEvent(timeInSeconds: 180)
        
        return .result(dialog: "Logged A 03:00 Toothbrushing Time")
    }
}

struct Timer4Intent: AppIntent {
    static var title: LocalizedStringResource = "Log A 04:00 Toothbrushing Time"
    static var description = IntentDescription("Log A Toothbrushing Time For 04:00 To The Apple Health App.")

    @MainActor
    func perform() async throws -> some ProvidesDialog {
        var healthKitManager = HealthKitManager()
        healthKitManager.requestAuthorization()
        healthKitManager.saveToothbrushingEvent(timeInSeconds: 240)
        
        return .result(dialog: "Logged A 04:00 Toothbrushing Time")
    }
}

struct Timer5Intent: AppIntent {
    static var title: LocalizedStringResource = "Log A 05:00 Toothbrushing Time"
    static var description = IntentDescription("Log A Toothbrushing Time For 05:00 To The Apple Health App.")

    @MainActor
    func perform() async throws -> some ProvidesDialog {
        var healthKitManager = HealthKitManager()
        healthKitManager.requestAuthorization()
        healthKitManager.saveToothbrushingEvent(timeInSeconds: 300)
        
        return .result(dialog: "Logged A 05:00 Toothbrushing Time")
    }
}

struct TimerIntentProvider: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        return [AppShortcut(
            intent: CustomTimerIntent(),
            phrases: ["Log A Custom \(.applicationName) Time"],
            shortTitle: "Log Custom Time",
            systemImageName: "clock"
        ),
        AppShortcut(
            intent: Timer30Intent(),
            phrases: ["Log A 00:30 \(.applicationName) Time"],
            shortTitle: "Log 00:30 Toothbrushing Time",
            systemImageName: "clock"
        ),
        AppShortcut(
            intent: Timer1Intent(),
            phrases: ["Log A 01:00 \(.applicationName) Time"],
            shortTitle: "Log 01:00 Toothbrushing Time",
            systemImageName: "clock"
        ),
        AppShortcut(
            intent: Timer2Intent(),
            phrases: ["Log A 02:00 \(.applicationName) Time"],
            shortTitle: "Log 02:00 Toothbrushing Time",
            systemImageName: "clock"
        ),
        AppShortcut(
            intent: Timer3Intent(),
            phrases: ["Log A 03:00 \(.applicationName) Time"],
            shortTitle: "Log 03:00 Toothbrushing Time",
            systemImageName: "clock"
        ),
        AppShortcut(
            intent: Timer4Intent(),
            phrases: ["Log A 04:00 \(.applicationName) Time"],
            shortTitle: "Log 04:00 Toothbrushing Time",
            systemImageName: "clock"
        ),
        AppShortcut(
            intent: Timer5Intent(),
            phrases: ["Log A 05:00 \(.applicationName) Time"],
            shortTitle: "Log 05:00 Toothbrushing Time",
            systemImageName: "clock"
        )]
    }
}
