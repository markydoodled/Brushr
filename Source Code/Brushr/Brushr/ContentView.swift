//
//  ContentView.swift
//  Brushr
//
//  Created by Mark Howard on 27/07/2023.
//

import SwiftUI
import AVFoundation
import MessageUI
import UserNotifications
import HealthKit
import ActivityKit

struct ContentView: View {
    //Store Value For Custom Minute And Seconds
    @AppStorage("customMinuteSelection") var customMinuteSelection = 1
    @AppStorage("customSecondSelection") var customSecondSelection = 30
    //Disable UI Elements Under Some Conditions
    @State var disabledCustomStart = false
    @State var disabledResume = true
    @State var disabledPause = false
    @State var disabledStartLiveActivity = false
    //Timer Tracking And Formatting UI Seconds
    @State var timeRemaining = 30
    @State var startTime = 30
    @State var customMinutes = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var formattedTimeSeconds = ""
    //Track If The App Is In The Foreground Or The Background
    @Environment(\.scenePhase) var scenePhase
    @State var backgroundTime: Date?
    @State var isActive = true
    //Link To The HealthKitManager Class To Save Times Back To HealthKit
    @StateObject private var healthKitManager = HealthKitManager()
    //UI State
    @State var showingCustomTimer = false
    @State var showingCurrentTimer = false
    @State var showingPermissionRequested = false
    @State var showingNotificationsScheduled = false
    @State var showingNotificationsCleared = false
    @State var tabSelection = 1
    //Setup Mail Sheet View And Result Trackers
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    //Times For Reminder Notifications
    @AppStorage("morningTime") var morningTime = Date.now
    @AppStorage("eveningTime") var eveningTime = Date.now
    //Stats Values
    @State var timesBrushed = ""
    @State var averageTimeBrushing = ""
    @State var totalTimeBrushing = ""
    var body: some View {
        //Tab Bar View To Swap Screens
        TabView(selection: $tabSelection) {
            home
                .tag(1)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            info
                .tag(2)
                .tabItem {
                    Label("Information", systemImage: "info.circle")
                }
            settings
                .tag(3)
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
    //Home View
    var home: some View {
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
                            self.timer.upstream.connect().cancel()
                            let systemSoundID: SystemSoundID = 1112
                            AudioServicesPlaySystemSound(systemSoundID)
                            if Activity<Brushr_iOS_Live_ActivityAttributes>.activities.isEmpty == false {
                                let finalContent = Brushr_iOS_Live_ActivityAttributes.ContentState(
                                    remainingTime: "\(formattedTimeSeconds)"
                                )
                                
                                let dismissalPolicy: ActivityUIDismissalPolicy = .immediate
                                
                                Task {
                                    await Activity<Brushr_iOS_Live_ActivityAttributes>.activities.first!.end(
                                        ActivityContent(state: finalContent, staleDate: nil),
                                        dismissalPolicy: dismissalPolicy)
                                }
                            }
                            showingCurrentTimer = false
                            disabledStartLiveActivity = false
                        }) {
                            Image(systemName: "xmark")
                                .font(.largeTitle)
                                .imageScale(.large)
                        }
                        .buttonStyle(.borderedProminent)
                        Button(action: {
                            do {
                                let attributes = Brushr_iOS_Live_ActivityAttributes(name: "Remaining Brushing Time")
                                
                                let initialState = Brushr_iOS_Live_ActivityAttributes.ContentState(remainingTime: "\(formattedTimeSeconds)")
                                let content = ActivityContent(state: initialState, staleDate: nil, relevanceScore: 0.0)
                                
                                let _ = try Activity.request(
                                    attributes: attributes,
                                    content: content,
                                    pushType: nil
                                )
                            } catch {
                                print("Live Activity Start Error")
                            }
                            disabledStartLiveActivity = true
                        }) {
                            Image(systemName: "clock.badge.fill")
                                .font(.largeTitle)
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(disabledStartLiveActivity)
                    }
                }
                .padding(.horizontal)
                //Monitor Scene Phase To Manage Current Timer
                .onChange(of: scenePhase) {
                    switch scenePhase {
                    case .background:
                        isActive = false
                        UIApplication.shared.isIdleTimerDisabled = false
                        //Store The Time When The App Goes To The Background
                        backgroundTime = Date()
                        //Stop The Timer
                        timer.upstream.connect().cancel()
                        
                    case .active:
                        isActive = true
                        UIApplication.shared.isIdleTimerDisabled = true
                        //Calculate The Time Difference And Subtract It From timeRemaining
                        if let backgroundTime = backgroundTime {
                            let timeDifference = Int(Date().timeIntervalSince(backgroundTime))
                            timeRemaining -= timeDifference
                        }
                        //Restart The Timer
                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    default:
                        break
                    }
                }
                .onReceive(timer) { time in
                    guard isActive else { return }
                    UIApplication.shared.isIdleTimerDisabled = true
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                        let formatter = DateComponentsFormatter()
                        formatter.allowedUnits = [.minute, .second]
                        formatter.unitsStyle = .positional
                        formattedTimeSeconds = formatter.string(from: TimeInterval(timeRemaining))!
                        //If timeRemaining Has Progressed By 10 Seconds Update Live Activity
                        if timeRemaining.isMultiple(of: 10) {
                            if Activity<Brushr_iOS_Live_ActivityAttributes>.activities.isEmpty == false {
                                let contentState = Brushr_iOS_Live_ActivityAttributes.ContentState(remainingTime: "\(formattedTimeSeconds)")
                                
                                Task {
                                    await Activity<Brushr_iOS_Live_ActivityAttributes>.activities.first!.update(
                                        ActivityContent<Brushr_iOS_Live_ActivityAttributes.ContentState>(
                                            state: contentState,
                                            staleDate: nil
                                        )
                                    )
                                }
                            }
                        }
                    } else {
                        self.timer.upstream.connect().cancel()
                        let systemSoundID: SystemSoundID = 1111
                        AudioServicesPlaySystemSound(systemSoundID)
                        if Activity<Brushr_iOS_Live_ActivityAttributes>.activities.isEmpty == false {
                            let finalContent = Brushr_iOS_Live_ActivityAttributes.ContentState(
                                remainingTime: "\(formattedTimeSeconds)"
                            )
                            
                            let dismissalPolicy: ActivityUIDismissalPolicy = .immediate
                            
                            Task {
                                await Activity<Brushr_iOS_Live_ActivityAttributes>.activities.first!.end(
                                    ActivityContent(state: finalContent, staleDate: nil),
                                    dismissalPolicy: dismissalPolicy)
                            }
                        }
                        healthKitManager.saveToothbrushingEvent(timeInSeconds: startTime)
                        showingCurrentTimer = false
                        disabledStartLiveActivity = false
                    }
                }
            }
        }
        //Check And Request HealthKit Access
        .onAppear() {
            healthKitManager.requestAuthorization()
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("Authorised")
                } else if let error {
                    print(error.localizedDescription)
                }
            }
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
    var info: some View {
        NavigationStack {
            Form {
                Section {
                    LabeledContent("Time Spent Brushing") {
                        Text("\(totalTimeBrushing)")
                    }
                    LabeledContent("Times Brushed") {
                        Text("\(timesBrushed)")
                    }
                    LabeledContent("Average Brushing Time") {
                        Text("\(averageTimeBrushing)")
                    }
                } header: {
                    Label("Brushing Stats", systemImage: "list.bullet.clipboard")
                }
                Section {
                    Link(destination: URL(string: "https://www.nhs.uk/nhs-services/dentists/")!) {
                        Label("NHS Dentists", systemImage: "heart.circle")
                    }
                    Link(destination: URL(string: "https://www.bda.org/")!) {
                        Label("British Dental Association", systemImage: "building.columns")
                    }
                    Link(destination: URL(string: "https://www.gdc-uk.org/")!) {
                        Label("General Dental Council", systemImage: "person.3")
                    }
                } header: {
                    Label("Useful Links", systemImage: "link")
                }
            }
            .navigationTitle("Information")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {fetchAndPrintToothbrushingData()}) {
                        Image(systemName: "arrow.clockwise")
                    }
                }
            }
        }
        .onAppear() {
            fetchAndPrintToothbrushingData()
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
                    DatePicker("Morning", selection: $morningTime, displayedComponents: .hourAndMinute)
                    Button(action: {
                        print("morningTime: \(morningTime)")
                        let hour = Calendar.current.dateComponents([.hour], from: morningTime)
                        print("Hour: \(hour)")
                        let min = Calendar.current.dateComponents([.minute], from: morningTime)
                        print("Min: \(min)")
                        
                        let content = UNMutableNotificationContent()
                        content.title = "Time To Brush"
                        content.subtitle = "Remember To Brush Your Teeth This Morning!"
                        content.sound = UNNotificationSound.default
                        let trigger = UNCalendarNotificationTrigger(dateMatching: DateComponents(hour: hour.hour, minute: min.minute), repeats: true)
                        print("Next Trigger: \(trigger.nextTriggerDate() ?? Date())")
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                        UNUserNotificationCenter.current().add(request)
                        
                        showingNotificationsScheduled = true
                    }) {
                        Label("Schedule Notification...", systemImage: "checklist")
                    }
                    DatePicker("Evening", selection: $eveningTime, displayedComponents: .hourAndMinute)
                    Button(action: {
                        print("eveningTime: \(eveningTime)")
                        let hour = Calendar.current.dateComponents([.hour], from: eveningTime)
                        print("Hour: \(hour)")
                        let min = Calendar.current.dateComponents([.minute], from: eveningTime)
                        print("Min: \(min)")
                        
                        let content2 = UNMutableNotificationContent()
                        content2.title = "Time To Brush"
                        content2.subtitle = "Remember To Brush Your Teeth This Evening!"
                        content2.sound = UNNotificationSound.default
                        let trigger2 = UNCalendarNotificationTrigger(dateMatching: DateComponents(hour: hour.hour, minute: min.minute), repeats: true)
                        print("Next Trigger: \(trigger2.nextTriggerDate() ?? Date())")
                        let request2 = UNNotificationRequest(identifier: UUID().uuidString, content: content2, trigger: trigger2)
                        UNUserNotificationCenter.current().add(request2)
                        
                        showingNotificationsScheduled = true
                    }) {
                        Label("Schedule Notification...", systemImage: "checklist.checked")
                    }
                    .alert("Notifications Scheduled", isPresented: $showingNotificationsScheduled) {
                        Button(action: {}) {
                            Text("Close")
                        }
                    }
                } header: {
                    Label("Notifications", systemImage: "bell.badge")
                }
                Section {
                    Button(action: {
                        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                        showingNotificationsCleared = true
                    }) {
                        Label("Clear Upcoming Notifications...", systemImage: "x.square")
                    }
                    .alert("Upcoming Notifications Cleared", isPresented: $showingNotificationsCleared) {
                        Button(action: {}) {
                            Text("Close")
                        }
                    }
                    Button(action: {
                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                            if success {
                                print("Authorised")
                            } else if let error {
                                print(error.localizedDescription)
                            }
                        }
                        showingPermissionRequested = true
                    }) {
                        Label("Request Permissions...", systemImage: "questionmark.bubble")
                    }
                    .alert("Notification Permissions Requested", isPresented: $showingPermissionRequested) {
                        Button(action: {}) {
                            Text("Close")
                        }
                    }
                }
                Section {
                    LabeledContent("Version", value: "1.3")
                    LabeledContent("Build", value: "12")
                } header: {
                    Label("Info", systemImage: "info.circle")
                }
                Section {
                    Button(action: {isShowingMailView.toggle()}) {
                        Text("Send Feedback...")
                    }
                    .sheet(isPresented: $isShowingMailView) {
                        MailView(isShowing: self.$isShowingMailView, result: self.$result)
                    }
                    Link("GitHub Repository...", destination: URL(string: "https://github.com/markydoodled/Brushr")!)
                    Link("Portfolio...", destination: URL(string: "http://markydoodled.com")!)
                } header: {
                    Label("Contact", systemImage: "person.crop.circle")
                }
            }
            .navigationTitle("Settings")
        }
    }
    func fetchToothbrushingData(completion: @escaping ([HKSample]?, Error?) -> Void) {
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(nil, NSError(domain: "com.MSJ.Brushr", code: 1, userInfo: [NSLocalizedDescriptionKey: "HealthKit Is Not Available."]))
            return
        }
        
        let toothbrushingType = HKObjectType.categoryType(forIdentifier: .toothbrushingEvent)!
        
        let healthStore = HKHealthStore()
        healthStore.requestAuthorization(toShare: nil, read: [toothbrushingType]) { (success, error) in
            guard success else {
                completion(nil, error)
                return
            }
            
            let predicate = HKQuery.predicateForSamples(withStart: Date.distantPast, end: Date(), options: .strictStartDate)
            
            let query = HKSampleQuery(sampleType: toothbrushingType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, samples, error) in
                guard let samples = samples else {
                    completion(nil, error)
                    return
                }
                
                completion(samples, nil)
            }
            
            healthStore.execute(query)
        }
    }
    func fetchAndPrintToothbrushingData() {
        fetchToothbrushingData { (samples, error) in
            if let error = error {
                print("Error Fetching Toothbrushing Data: \(error.localizedDescription)")
                return
            }
            
            guard let samples = samples else {
                print("No Toothbrushing Data Available.")
                return
            }
            
            var totalDuration: TimeInterval = TimeInterval()
            for sample in samples {
                if let sample = sample as? HKCategorySample {
                    timesBrushed = String("\(samples.count.formatted()) Times")
                    let start = sample.startDate
                    let end = sample.endDate
                    let duration = end.timeIntervalSince(start)
                    totalDuration += duration
                    totalTimeBrushing = String("\(Int(totalDuration / 60).formatted()) Minutes")
                    let avgDuration = totalDuration / Double(samples.count)
                    averageTimeBrushing = String("\(Int(avgDuration).formatted()) Seconds")
                }
            }
        }
    }
}

//Create Mail View To Send Feedback
struct MailView: UIViewControllerRepresentable {
    @Binding var isShowing: Bool
    @Binding var result: Result<MFMailComposeResult, Error>?
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var isShowing: Bool
        @Binding var result: Result<MFMailComposeResult, Error>?
        
        init(isShowing: Binding<Bool>, result: Binding<Result<MFMailComposeResult, Error>?>) {
            _isShowing = isShowing
            _result = result
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            defer {
                isShowing = false
            }
            
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            
            self.result = .success(result)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(isShowing: $isShowing, result: $result)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setSubject("Brushr Feedback")
        vc.setToRecipients(["markhoward2005@gmail.com"])
        vc.setMessageBody("Please Fill Out All Relevant Sections:\nReport A Bug - \nRate The App - \nSuggest An Improvement - \n", isHTML: false)
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: UIViewControllerRepresentableContext<MailView>) {

    }
}

extension Date: @retroactive RawRepresentable {
    public var rawValue: String {
        self.timeIntervalSinceReferenceDate.description
    }
    
    public init?(rawValue: String) {
        self = Date(timeIntervalSinceReferenceDate: Double(rawValue) ?? 0.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
