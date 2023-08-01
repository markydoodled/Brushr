//
//  ContentView.swift
//  Brushr
//
//  Created by Mark Howard on 27/07/2023.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @AppStorage("customMinuteSelection") var customMinuteSelection = 1
    @AppStorage("customSecondSelection") var customSecondSelection = 30
    @State var showingCurrentTimer = false
    @State var disabledCustomStart = false
    @State var disabledResume = true
    @State var disabledPause = false
    @State var timeRemaining = 30
    @State var startTime = 30
    @State var customMinutes = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var formattedTimeSeconds = ""
    @Environment(\.scenePhase) var scenePhase
    @State var isActive = true
    @StateObject private var healthKitManager = HealthKitManager()
    @State var showingCustomTimer = false
    var body: some View {
        NavigationStack {
            ScrollView {
                Grid {
                    GridRow {
                        Button(action: {
                            let formatter = DateComponentsFormatter()
                            formatter.allowedUnits = [.minute, .second]
                            formatter.unitsStyle = .positional
                            let systemSoundID: SystemSoundID = 1110
                            AudioServicesPlaySystemSound(systemSoundID)
                            timeRemaining = 30
                            startTime = 30
                            disabledResume = true
                            disabledPause = false
                            formattedTimeSeconds = formatter.string(from: TimeInterval(timeRemaining))!
                            showingCurrentTimer = true
                        }) {
                            ZStack {
                                Circle()
                                    .stroke(style: .init(lineWidth: 5))
                                    .foregroundColor(.accentColor)
                                    .frame(width: 95, height: 95)
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 90, height: 90)
                                    .padding()
                                Text("00:30")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                        Button(action: {
                            let formatter = DateComponentsFormatter()
                            formatter.allowedUnits = [.minute, .second]
                            formatter.unitsStyle = .positional
                            let systemSoundID: SystemSoundID = 1110
                            AudioServicesPlaySystemSound(systemSoundID)
                            timeRemaining = 60
                            startTime = 60
                            disabledResume = true
                            disabledPause = false
                            formattedTimeSeconds = formatter.string(from: TimeInterval(timeRemaining))!
                            showingCurrentTimer = true
                        }) {
                            ZStack {
                                Circle()
                                    .stroke(style: .init(lineWidth: 5))
                                    .foregroundColor(.accentColor)
                                    .frame(width: 95, height: 95)
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 90, height: 90)
                                    .padding()
                                Text("01:00")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                        Button(action: {
                            let formatter = DateComponentsFormatter()
                            formatter.allowedUnits = [.minute, .second]
                            formatter.unitsStyle = .positional
                            let systemSoundID: SystemSoundID = 1110
                            AudioServicesPlaySystemSound(systemSoundID)
                            timeRemaining = 120
                            startTime = 120
                            disabledResume = true
                            disabledPause = false
                            formattedTimeSeconds = formatter.string(from: TimeInterval(timeRemaining))!
                            showingCurrentTimer = true
                        }) {
                            ZStack {
                                Circle()
                                    .stroke(style: .init(lineWidth: 5))
                                    .foregroundColor(.accentColor)
                                    .frame(width: 95, height: 95)
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 90, height: 90)
                                    .padding()
                                Text("02:00")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    GridRow {
                        Button(action: {
                            let formatter = DateComponentsFormatter()
                            formatter.allowedUnits = [.minute, .second]
                            formatter.unitsStyle = .positional
                            let systemSoundID: SystemSoundID = 1110
                            AudioServicesPlaySystemSound(systemSoundID)
                            timeRemaining = 180
                            startTime = 180
                            disabledResume = true
                            disabledPause = false
                            formattedTimeSeconds = formatter.string(from: TimeInterval(timeRemaining))!
                            showingCurrentTimer = true
                        }) {
                            ZStack {
                                Circle()
                                    .stroke(style: .init(lineWidth: 5))
                                    .foregroundColor(.accentColor)
                                    .frame(width: 95, height: 95)
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 90, height: 90)
                                    .padding()
                                Text("03:00")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                        Button(action: {
                            let formatter = DateComponentsFormatter()
                            formatter.allowedUnits = [.minute, .second]
                            formatter.unitsStyle = .positional
                            let systemSoundID: SystemSoundID = 1110
                            AudioServicesPlaySystemSound(systemSoundID)
                            timeRemaining = 240
                            startTime = 240
                            disabledResume = true
                            disabledPause = false
                            formattedTimeSeconds = formatter.string(from: TimeInterval(timeRemaining))!
                            showingCurrentTimer = true
                        }) {
                            ZStack {
                                Circle()
                                    .stroke(style: .init(lineWidth: 5))
                                    .foregroundColor(.accentColor)
                                    .frame(width: 95, height: 95)
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 90, height: 90)
                                    .padding()
                                Text("04:00")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                        Button(action: {
                            let formatter = DateComponentsFormatter()
                            formatter.allowedUnits = [.minute, .second]
                            formatter.unitsStyle = .positional
                            let systemSoundID: SystemSoundID = 1110
                            AudioServicesPlaySystemSound(systemSoundID)
                            timeRemaining = 300
                            startTime = 300
                            disabledResume = true
                            disabledPause = false
                            formattedTimeSeconds = formatter.string(from: TimeInterval(timeRemaining))!
                            showingCurrentTimer = true
                        }) {
                            ZStack {
                                Circle()
                                    .stroke(style: .init(lineWidth: 5))
                                    .foregroundColor(.accentColor)
                                    .frame(width: 95, height: 95)
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 90, height: 90)
                                    .padding()
                                Text("05:00")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                Divider()
                HStack {
                    Spacer()
                    Text("Custom Timers")
                        .bold()
                        .font(.title2)
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack {
                        Stepper("\(customMinuteSelection) Minutes", value: $customMinuteSelection, in: 0...10)
                        Stepper("\(customSecondSelection) Seconds", value: $customSecondSelection, in: 0...59)
                        Button(action: {
                            let formatter = DateComponentsFormatter()
                            formatter.allowedUnits = [.minute, .second]
                            formatter.unitsStyle = .positional
                            let systemSoundID: SystemSoundID = 1110
                            AudioServicesPlaySystemSound(systemSoundID)
                            customMinutes = customMinuteSelection * 60
                            timeRemaining = customMinutes + customSecondSelection
                            startTime = customMinutes + customSecondSelection
                            disabledResume = true
                            disabledPause = false
                            formattedTimeSeconds = formatter.string(from: TimeInterval(timeRemaining))!
                            showingCurrentTimer = true
                        }) {
                            Text("Start Timer")
                                .bold()
                                .font(.title)
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(disabledCustomStart)
                        .padding()
                    }
                    .padding(.horizontal)
                    Spacer()
                }
            }
            .navigationTitle("Brushr")
            .onChange(of: customMinuteSelection) { min in
                if customMinuteSelection == 0 {
                    if customSecondSelection == 0 {
                        disabledCustomStart = true
                    } else {
                        disabledCustomStart = false
                    }
                } else {
                    disabledCustomStart = false
                }
            }
            .onChange(of: customSecondSelection) { sec in
                if customMinuteSelection == 0 {
                    if customSecondSelection == 0 {
                        disabledCustomStart = true
                    } else {
                        disabledCustomStart = false
                    }
                } else {
                    disabledCustomStart = false
                }
            }
            .fullScreenCover(isPresented: $showingCurrentTimer) {
                VStack {
                    if timeRemaining <= 59 {
                        Text("\(formattedTimeSeconds) Seconds")
                            .bold()
                            .font(.largeTitle)
                    } else {
                        Text("\(formattedTimeSeconds)")
                            .bold()
                            .font(.largeTitle)
                    }
                    ProgressView(value: Double(timeRemaining), total: Double(startTime))
                        .progressViewStyle(.linear)
                        .padding(.bottom)
                    Button(action: {
                        self.timer.upstream.connect().cancel()
                        let systemSoundID: SystemSoundID = 1115
                        AudioServicesPlaySystemSound(systemSoundID)
                        disabledPause = true
                        disabledResume = false
                    }) {
                        Text("Pause")
                            .bold()
                            .font(.title)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(disabledPause)
                    .padding(.bottom)
                    Button(action: {
                        let systemSoundID: SystemSoundID = 1116
                        AudioServicesPlaySystemSound(systemSoundID)
                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        disabledPause = false
                        disabledResume = true
                    }) {
                        Text("Resume")
                            .bold()
                            .font(.title)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(disabledResume)
                    .padding(.bottom)
                    Button(action: {
                        let systemSoundID: SystemSoundID = 1112
                        AudioServicesPlaySystemSound(systemSoundID)
                        showingCurrentTimer = false
                    }) {
                        Text("End")
                            .bold()
                            .font(.title)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom)
                }
                .padding(.horizontal)
                .onChange(of: scenePhase) { newPhase in
                    if newPhase == .active {
                        isActive = true
                    } else {
                        isActive = false
                    }
                }
                .onReceive(timer) { time in
                    guard isActive else { return }
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                        let formatter = DateComponentsFormatter()
                        formatter.allowedUnits = [.minute, .second]
                        formatter.unitsStyle = .positional
                        formattedTimeSeconds = formatter.string(from: TimeInterval(timeRemaining))!
                    } else {
                        let systemSoundID: SystemSoundID = 1111
                        AudioServicesPlaySystemSound(systemSoundID)
                        healthKitManager.saveToothbrushingEvent(timeInSeconds: startTime)
                        showingCurrentTimer = false
                    }
                }
            }
        }
        .onAppear() {
            healthKitManager.requestAuthorization()
        }
        .onOpenURL { url in
            guard url.scheme == "brushr" else { return }
            if url == URL(string: "brushr://30sec") {
                let formatter = DateComponentsFormatter()
                formatter.allowedUnits = [.minute, .second]
                formatter.unitsStyle = .positional
                let systemSoundID: SystemSoundID = 1110
                AudioServicesPlaySystemSound(systemSoundID)
                timeRemaining = 30
                startTime = 30
                disabledResume = true
                disabledPause = false
                formattedTimeSeconds = formatter.string(from: TimeInterval(timeRemaining))!
                showingCurrentTimer = true
            } else if url == URL(string: "brushr://1min") {
                let formatter = DateComponentsFormatter()
                formatter.allowedUnits = [.minute, .second]
                formatter.unitsStyle = .positional
                let systemSoundID: SystemSoundID = 1110
                AudioServicesPlaySystemSound(systemSoundID)
                timeRemaining = 60
                startTime = 60
                disabledResume = true
                disabledPause = false
                formattedTimeSeconds = formatter.string(from: TimeInterval(timeRemaining))!
                showingCurrentTimer = true
            } else if url == URL(string: "brushr://2min") {
                let formatter = DateComponentsFormatter()
                formatter.allowedUnits = [.minute, .second]
                formatter.unitsStyle = .positional
                let systemSoundID: SystemSoundID = 1110
                AudioServicesPlaySystemSound(systemSoundID)
                timeRemaining = 120
                startTime = 120
                disabledResume = true
                disabledPause = false
                formattedTimeSeconds = formatter.string(from: TimeInterval(timeRemaining))!
                showingCurrentTimer = true
            } else if url == URL(string: "brushr://3min") {
                let formatter = DateComponentsFormatter()
                formatter.allowedUnits = [.minute, .second]
                formatter.unitsStyle = .positional
                let systemSoundID: SystemSoundID = 1110
                AudioServicesPlaySystemSound(systemSoundID)
                timeRemaining = 180
                startTime = 180
                disabledResume = true
                disabledPause = false
                formattedTimeSeconds = formatter.string(from: TimeInterval(timeRemaining))!
                showingCurrentTimer = true
            } else if url == URL(string: "brushr://4min") {
                let formatter = DateComponentsFormatter()
                formatter.allowedUnits = [.minute, .second]
                formatter.unitsStyle = .positional
                let systemSoundID: SystemSoundID = 1110
                AudioServicesPlaySystemSound(systemSoundID)
                timeRemaining = 240
                startTime = 240
                disabledResume = true
                disabledPause = false
                formattedTimeSeconds = formatter.string(from: TimeInterval(timeRemaining))!
                showingCurrentTimer = true
            } else if url == URL(string: "brushr://5min") {
                let formatter = DateComponentsFormatter()
                formatter.allowedUnits = [.minute, .second]
                formatter.unitsStyle = .positional
                let systemSoundID: SystemSoundID = 1110
                AudioServicesPlaySystemSound(systemSoundID)
                timeRemaining = 300
                startTime = 300
                disabledResume = true
                disabledPause = false
                formattedTimeSeconds = formatter.string(from: TimeInterval(timeRemaining))!
                showingCurrentTimer = true
            } else if url == URL(string: "brushr://custom") {
                showingCustomTimer = true
            } else {
                print("URL Error")
            }
        }
        .sheet(isPresented: $showingCustomTimer) {
            customTimer
        }
    }
    var customTimer: some View {
        NavigationStack {
            VStack {
                Spacer()
                Stepper("\(customMinuteSelection) Minutes", value: $customMinuteSelection, in: 0...10)
                Stepper("\(customSecondSelection) Seconds", value: $customSecondSelection, in: 0...59)
                Button(action: {
                    let formatter = DateComponentsFormatter()
                    formatter.allowedUnits = [.minute, .second]
                    formatter.unitsStyle = .positional
                    let systemSoundID: SystemSoundID = 1110
                    AudioServicesPlaySystemSound(systemSoundID)
                    customMinutes = customMinuteSelection * 60
                    timeRemaining = customMinutes + customSecondSelection
                    startTime = customMinutes + customSecondSelection
                    disabledResume = true
                    disabledPause = false
                    formattedTimeSeconds = formatter.string(from: TimeInterval(timeRemaining))!
                    showingCustomTimer = false
                    showingCurrentTimer = true
                }) {
                    Text("Start Timer")
                        .bold()
                        .font(.title)
                }
                .buttonStyle(.borderedProminent)
                .disabled(disabledCustomStart)
                .padding()
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("Custom Timers")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {showingCustomTimer = false}) {
                        Text("Cancel")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
