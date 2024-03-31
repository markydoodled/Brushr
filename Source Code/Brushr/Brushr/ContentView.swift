//
//  ContentView.swift
//  Brushr
//
//  Created by Mark Howard on 27/07/2023.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    //Store Value For Custom Minute And Seconds
    @AppStorage("customMinuteSelection") var customMinuteSelection = 1
    @AppStorage("customSecondSelection") var customSecondSelection = 30
    //Disable UI Elements Under Some Conditions
    @State var disabledCustomStart = false
    @State var disabledResume = true
    @State var disabledPause = false
    //Timer Tracking And Formatting UI Seconds
    @State var timeRemaining = 30
    @State var startTime = 30
    @State var customMinutes = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var formattedTimeSeconds = ""
    //Track If The App Is In The Foreground Or The Background
    @Environment(\.scenePhase) var scenePhase
    @State var isActive = true
    //Link To The HealthKitManager Class To Save Times Back To HealthKit
    @StateObject private var healthKitManager = HealthKitManager()
    //UI State
    @State var showingCustomTimer = false
    @State var showingCurrentTimer = false
    @State var showingSettings = false
    var body: some View {
        //Pick Standard Or Custom Timers
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
                    Text("Custom Timer")
                        .bold()
                        .font(.title)
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack {
                        Stepper("\(customMinuteSelection) Minutes", value: $customMinuteSelection, in: 0...10)
                            .font(.title)
                            .padding(.bottom)
                        Stepper("\(customSecondSelection) Seconds", value: $customSecondSelection, in: 0...59)
                            .font(.title)
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
            //Check If Custom Timer Min And Sec Is Above 0:00
            .onChange(of: customMinuteSelection) {
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
            .onChange(of: customSecondSelection) {
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
            //Toolbar To Access Settings View
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {showingSettings = true}) {
                        Image(systemName: "gearshape")
                    }
                    .sheet(isPresented: $showingSettings) {
                        settings
                    }
                }
            }
            //Current Timer UI When A Timer Has Been Started
            .fullScreenCover(isPresented: $showingCurrentTimer) {
                VStack {
                    //Remaining Time
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
                    //Pause, Play And Cancel Buttons
                    HStack {
                        Button(action: {
                            self.timer.upstream.connect().cancel()
                            let systemSoundID: SystemSoundID = 1115
                            AudioServicesPlaySystemSound(systemSoundID)
                            disabledPause = true
                            disabledResume = false
                        }) {
                            Image(systemName: "pause.fill")
                                .font(.largeTitle)
                                .imageScale(.large)
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(disabledPause)
                        Button(action: {
                            let systemSoundID: SystemSoundID = 1116
                            AudioServicesPlaySystemSound(systemSoundID)
                            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                            disabledPause = false
                            disabledResume = true
                        }) {
                            Image(systemName: "play.fill")
                                .font(.largeTitle)
                                .imageScale(.large)
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(disabledResume)
                        Button(action: {
                            let systemSoundID: SystemSoundID = 1112
                            AudioServicesPlaySystemSound(systemSoundID)
                            showingCurrentTimer = false
                        }) {
                            Image(systemName: "xmark")
                                .font(.largeTitle)
                                .imageScale(.large)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .padding(.horizontal)
                //Monitor Scene Phase To Manage Current Timer
                .onChange(of: scenePhase) {
                    if scenePhase == .active {
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
        //Check And Request HealthKit Access
        .onAppear() {
            healthKitManager.requestAuthorization()
        }
        //Trigger Actions In App Depending On The Opened URL
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
        //Show UI For Creating A Custom Timer
        .sheet(isPresented: $showingCustomTimer) {
            customTimer
        }
    }
    //Custom Timer UI
    var customTimer: some View {
        NavigationStack {
            VStack {
                Spacer()
                Stepper("\(customMinuteSelection) Minutes", value: $customMinuteSelection, in: 0...10)
                    .font(.largeTitle)
                    .padding(.bottom)
                Stepper("\(customSecondSelection) Seconds", value: $customSecondSelection, in: 0...59)
                    .font(.largeTitle)
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
                        .font(.largeTitle)
                }
                .buttonStyle(.borderedProminent)
                .disabled(disabledCustomStart)
                .padding()
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("Custom Timer")
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
    var settings: some View {
        NavigationStack {
            Form {
                Section {
                    LabeledContent("Version", value: "1.1")
                    LabeledContent("Build", value: "3")
                } header: {
                    Label("Info", systemImage: "info.circle")
                }
                Section {
                    Link("GitHub Repository", destination: URL(string: "https://github.com/markydoodled/Brushr")!)
                    Link("Portfolio", destination: URL(string: "http://markydoodled.github.io/portfolio/")!)
                } header: {
                    Label("Contact", systemImage: "person.crop.circle")
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {showingSettings = false}) {
                        Text("Done")
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
