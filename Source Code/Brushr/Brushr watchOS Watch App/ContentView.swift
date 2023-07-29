//
//  ContentView.swift
//  Brushr watchOS Watch App
//
//  Created by Mark Howard on 28/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State var customMinuteSelection = 1
    @State var customSecondSelection = 30
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
    var body: some View {
        NavigationStack {
            ScrollView {
                Grid {
                    GridRow {
                        Button(action: {
                            let formatter = DateComponentsFormatter()
                            formatter.allowedUnits = [.minute, .second]
                            formatter.unitsStyle = .positional
                            WKInterfaceDevice.current().play(.start)
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
                                    .frame(width: 55, height: 55)
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 50, height: 50)
                                    .padding()
                                Text("00:30")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(.borderless)
                        Button(action: {
                            let formatter = DateComponentsFormatter()
                            formatter.allowedUnits = [.minute, .second]
                            formatter.unitsStyle = .positional
                            WKInterfaceDevice.current().play(.start)
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
                                    .frame(width: 55, height: 55)
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 50, height: 50)
                                    .padding()
                                Text("01:00")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(.borderless)
                    }
                    GridRow {
                        Button(action: {
                            let formatter = DateComponentsFormatter()
                            formatter.allowedUnits = [.minute, .second]
                            formatter.unitsStyle = .positional
                            WKInterfaceDevice.current().play(.start)
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
                                    .frame(width: 55, height: 55)
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 50, height: 50)
                                    .padding()
                                Text("02:00")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(.borderless)
                        Button(action: {
                            let formatter = DateComponentsFormatter()
                            formatter.allowedUnits = [.minute, .second]
                            formatter.unitsStyle = .positional
                            WKInterfaceDevice.current().play(.start)
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
                                    .frame(width: 55, height: 55)
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 50, height: 50)
                                    .padding()
                                Text("03:00")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(.borderless)
                    }
                    GridRow {
                        Button(action: {
                            let formatter = DateComponentsFormatter()
                            formatter.allowedUnits = [.minute, .second]
                            formatter.unitsStyle = .positional
                            WKInterfaceDevice.current().play(.start)
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
                                    .frame(width: 55, height: 55)
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 50, height: 50)
                                    .padding()
                                Text("04:00")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(.borderless)
                        Button(action: {
                            let formatter = DateComponentsFormatter()
                            formatter.allowedUnits = [.minute, .second]
                            formatter.unitsStyle = .positional
                            WKInterfaceDevice.current().play(.start)
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
                                    .frame(width: 55, height: 55)
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 50, height: 50)
                                    .padding()
                                Text("05:00")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(.borderless)
                    }
                }
                Divider()
                HStack {
                    Spacer()
                    Text("Custom Timers")
                        .bold()
                        .font(.title3)
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack {
                        Text("Minutes")
                        Stepper("\(customMinuteSelection)", value: $customMinuteSelection, in: 0...10)
                        Text("Seconds")
                        Stepper("\(customSecondSelection)", value: $customSecondSelection, in: 0...59)
                        Button(action: {
                            let formatter = DateComponentsFormatter()
                            formatter.allowedUnits = [.minute, .second]
                            formatter.unitsStyle = .positional
                            WKInterfaceDevice.current().play(.start)
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
                ScrollView {
                    VStack {
                        if timeRemaining <= 59 {
                            Text("\(formattedTimeSeconds) Seconds")
                                .bold()
                                .font(.title3)
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
                            WKInterfaceDevice.current().play(.stop)
                            disabledPause = true
                            disabledResume = false
                        }) {
                            Text("Pause")
                                .bold()
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(disabledPause)
                        .padding(.bottom)
                        Button(action: {
                            WKInterfaceDevice.current().play(.start)
                            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                            disabledPause = false
                            disabledResume = true
                        }) {
                            Text("Resume")
                                .bold()
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(disabledResume)
                        .padding(.bottom)
                        Button(action: {
                            WKInterfaceDevice.current().play(.failure)
                            showingCurrentTimer = false
                        }) {
                            Text("End")
                                .bold()
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
                            WKInterfaceDevice.current().play(.success)
                            healthKitManager.saveToothbrushingEvent(timeInSeconds: startTime)
                            showingCurrentTimer = false
                        }
                    }
                }
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .onAppear() {
            healthKitManager.requestAuthorization()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
