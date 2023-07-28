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
    var body: some View {
        NavigationStack {
            ScrollView {
                Grid {
                    GridRow {
                        Button(action: {showingCurrentTimer = true}) {
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
                        Button(action: {showingCurrentTimer = true}) {
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
                        Button(action: {showingCurrentTimer = true}) {
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
                    }
                    GridRow {
                        Button(action: {showingCurrentTimer = true}) {
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
                        Button(action: {showingCurrentTimer = true}) {
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
                        Button(action: {showingCurrentTimer = true}) {
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
                        Button(action: {showingCurrentTimer = true}) {
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
                        Text("00:00")
                            .bold()
                            .font(.largeTitle)
                        ProgressView(value: 0.75, total: 1.0)
                            .progressViewStyle(.linear)
                            .padding(.bottom)
                        Button(action: {}) {
                            Text("Pause")
                                .bold()
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(disabledPause)
                        .padding(.bottom)
                        Button(action: {}) {
                            Text("Resume")
                                .bold()
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(disabledResume)
                        .padding(.bottom)
                        Button(action: {showingCurrentTimer = false}) {
                            Text("End")
                                .bold()
                        }
                        .buttonStyle(.borderedProminent)
                        .padding(.bottom)
                    }
                    .padding(.horizontal)
                }
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
