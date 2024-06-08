//
//  ContentView.swift
//  Brushr watchOS Watch App
//
//  Created by Mark Howard on 28/07/2023.
//

import SwiftUI

struct ContentView: View {
    //Track If The App Is In The Foreground Or The Background
    @Environment(\.scenePhase) var scenePhase
    @State var isActive = true
    @State var backgroundTime: Date?
    //Store Vertical Tab View Selection
    @State var tabSelection = 1
    //Store Value For Custom Minute And Seconds
    @AppStorage("customMinuteSelection") var customMinuteSelection = 1
    @AppStorage("customSecondSelection") var customSecondSelection = 30
    //Link To The HealthKitManager Class To Save Times Back To HealthKit
    @StateObject private var healthKitManager = HealthKitManager()
    //UI State
    @State var showingCustomTimer = false
    @State var showingCustomCurrentTimer = false
    @State var showingCurrentTimer = false
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
    var body: some View {
        //Vertical Tab View To Show Standard Times To Start
        NavigationStack {
            TabView(selection: $tabSelection) {
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
                            .frame(width: 120, height: 120)
                        Circle()
                            .foregroundColor(.secondary)
                            .frame(width: 115, height: 115)
                            .padding()
                        Text("00:30")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
                .buttonStyle(.borderless)
                    .tag(1)
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
                            .frame(width: 120, height: 120)
                        Circle()
                            .foregroundColor(.secondary)
                            .frame(width: 115, height: 115)
                            .padding()
                        Text("01:00")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
                .buttonStyle(.borderless)
                    .tag(2)
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
                            .frame(width: 120, height: 120)
                        Circle()
                            .foregroundColor(.secondary)
                            .frame(width: 115, height: 115)
                            .padding()
                        Text("02:00")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
                .buttonStyle(.borderless)
                    .tag(3)
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
                            .frame(width: 120, height: 120)
                        Circle()
                            .foregroundColor(.secondary)
                            .frame(width: 115, height: 115)
                            .padding()
                        Text("03:00")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
                .buttonStyle(.borderless)
                    .tag(4)
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
                            .frame(width: 120, height: 120)
                        Circle()
                            .foregroundColor(.secondary)
                            .frame(width: 115, height: 115)
                            .padding()
                        Text("04:00")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
                .buttonStyle(.borderless)
                    .tag(5)
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
                            .frame(width: 120, height: 120)
                        Circle()
                            .foregroundColor(.secondary)
                            .frame(width: 115, height: 115)
                            .padding()
                        Text("05:00")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
                .buttonStyle(.borderless)
                    .tag(6)
            }
            .tabViewStyle(.verticalPage(transitionStyle: .blur))
            .navigationTitle("Brushr")
            //Toolbar Button To Show UI To Start A Custom Timer
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {showingCustomTimer = true}) {
                        Image(systemName: "timer")
                    }
                }
            }
            //UI For A Current Timer Once It's Been Started
            .fullScreenCover(isPresented: $showingCurrentTimer) {
                //Remaining Time
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
                    //Buttons To Play, Pause And Cancel
                    HStack {
                        Button(action: {
                            self.timer.upstream.connect().cancel()
                            WKInterfaceDevice.current().play(.stop)
                            disabledPause = true
                            disabledResume = false
                        }) {
                            Image(systemName: "pause.fill")
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(disabledPause)
                        Button(action: {
                            WKInterfaceDevice.current().play(.start)
                            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                            disabledPause = false
                            disabledResume = true
                        }) {
                            Image(systemName: "play.fill")
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(disabledResume)
                        Button(action: {
                            WKInterfaceDevice.current().play(.failure)
                            showingCurrentTimer = false
                        }) {
                            Image(systemName: "xmark")
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .padding(.horizontal)
                //Monitor Scene Phase And Manage The Current Timer
                .onChange(of: scenePhase) {
                    switch scenePhase {
                    case .background:
                        isActive = false
                        //Store The Time When The App Goes To The Background
                        backgroundTime = Date()
                        //Stop The Timer
                        timer.upstream.connect().cancel()
                    case .active:
                        isActive = true
                        //Calculate The Time Difference And Subtract It From timeRemaining
                        if let backgroundTime = backgroundTime {
                            let timeDifference = Int(Date().timeIntervalSince(backgroundTime))
                            timeRemaining -= timeDifference
                        }
                        //Restart The Timer
                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    case .inactive:
                        isActive = false
                        //Store The Time When The App Goes To The Background
                        backgroundTime = Date()
                        //Stop The Timer
                        timer.upstream.connect().cancel()
                    default:
                        break
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
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        //Check And/Or Request HealthKit Store Authorisation
        .onAppear() {
            healthKitManager.requestAuthorization()
        }
        //Trigger Actions In The App Using URLs
        .onOpenURL { url in
            guard url.scheme == "brushr" else { return }
            if url == URL(string: "brushr://30sec") {
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
            } else if url == URL(string: "brushr://1min") {
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
            } else if url == URL(string: "brushr://2min") {
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
            } else if url == URL(string: "brushr://3min") {
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
            } else if url == URL(string: "brushr://4min") {
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
            } else if url == URL(string: "brushr://5min") {
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
            } else if url == URL(string: "brushr://custom") {
                showingCustomTimer = true
            } else {
                print("URL Error")
            }
        }
        //Show The UI For Creating A Custom Timer
        .sheet(isPresented: $showingCustomTimer) {
            customTimer
        }
    }
    //Custom Timer UI
    var customTimer: some View {
        ScrollView {
            VStack {
                Spacer()
                Stepper("\(customMinuteSelection)", value: $customMinuteSelection, in: 0...10)
                Text("Minutes")
                Stepper("\(customSecondSelection)", value: $customSecondSelection, in: 0...59)
                Text("Seconds")
                Spacer()
            }
            .padding(.horizontal)
        }
        .fullScreenCover(isPresented: $showingCustomCurrentTimer) {
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
                HStack {
                    Button(action: {
                        self.timer.upstream.connect().cancel()
                        WKInterfaceDevice.current().play(.stop)
                        disabledPause = true
                        disabledResume = false
                    }) {
                        Image(systemName: "pause.fill")
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(disabledPause)
                    Button(action: {
                        WKInterfaceDevice.current().play(.start)
                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        disabledPause = false
                        disabledResume = true
                    }) {
                        Image(systemName: "play.fill")
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(disabledResume)
                    Button(action: {
                        WKInterfaceDevice.current().play(.failure)
                        showingCustomCurrentTimer = false
                    }) {
                        Image(systemName: "xmark")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
                .padding(.horizontal)
                .onChange(of: scenePhase) {
                    switch scenePhase {
                    case .background:
                        isActive = false
                        //Store The Time When The App Goes To The Background
                        backgroundTime = Date()
                        //Stop The Timer
                        timer.upstream.connect().cancel()
                    case .active:
                        isActive = true
                        //Calculate The Time Difference And Subtract It From timeRemaining
                        if let backgroundTime = backgroundTime {
                            let timeDifference = Int(Date().timeIntervalSince(backgroundTime))
                            timeRemaining -= timeDifference
                        }
                        //Restart The Timer
                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    case .inactive:
                        isActive = false
                        //Store The Time When The App Goes To The Background
                        backgroundTime = Date()
                        //Stop The Timer
                        timer.upstream.connect().cancel()
                    default:
                        break
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
                        showingCustomCurrentTimer = false
                    }
                }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
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
                    showingCustomCurrentTimer = true
                }) {
                    Image(systemName: "checkmark")
                }
                .disabled(disabledCustomStart)
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
