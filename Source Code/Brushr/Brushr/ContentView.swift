//
//  ContentView.swift
//  Brushr
//
//  Created by Mark Howard on 27/07/2023.
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
                                    .frame(width: 105, height: 105)
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 100, height: 100)
                                    .padding()
                                Text("00:30")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                        Button(action: {showingCurrentTimer = true}) {
                            ZStack {
                                Circle()
                                    .stroke(style: .init(lineWidth: 5))
                                    .foregroundColor(.accentColor)
                                    .frame(width: 105, height: 105)
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 100, height: 100)
                                    .padding()
                                Text("01:00")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                        Button(action: {showingCurrentTimer = true}) {
                            ZStack {
                                Circle()
                                    .stroke(style: .init(lineWidth: 5))
                                    .foregroundColor(.accentColor)
                                    .frame(width: 105, height: 105)
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 100, height: 100)
                                    .padding()
                                Text("02:00")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    GridRow {
                        Button(action: {showingCurrentTimer = true}) {
                            ZStack {
                                Circle()
                                    .stroke(style: .init(lineWidth: 5))
                                    .foregroundColor(.accentColor)
                                    .frame(width: 105, height: 105)
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 100, height: 100)
                                    .padding()
                                Text("03:00")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                        Button(action: {showingCurrentTimer = true}) {
                            ZStack {
                                Circle()
                                    .stroke(style: .init(lineWidth: 5))
                                    .foregroundColor(.accentColor)
                                    .frame(width: 105, height: 105)
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 100, height: 100)
                                    .padding()
                                Text("04:00")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                        Button(action: {showingCurrentTimer = true}) {
                            ZStack {
                                Circle()
                                    .stroke(style: .init(lineWidth: 5))
                                    .foregroundColor(.accentColor)
                                    .frame(width: 105, height: 105)
                                Circle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 100, height: 100)
                                    .padding()
                                Text("05:00")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                HStack {
                    Spacer()
                    VStack {
                        Stepper("\(customMinuteSelection) Minutes", value: $customMinuteSelection, in: 0...10)
                        Stepper("\(customSecondSelection) Seconds", value: $customSecondSelection, in: 0...59)
                        Button(action: {showingCurrentTimer = true}) {
                            Text("Start Custom Timer")
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
                    Text("00:00")
                        .bold()
                        .font(.largeTitle)
                    ProgressView(value: 0.75, total: 1.0)
                        .progressViewStyle(.linear)
                        .padding(.bottom)
                    Button(action: {}) {
                        Text("Pause")
                            .bold()
                            .font(.title)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(disabledPause)
                    .padding(.bottom)
                    Button(action: {}) {
                        Text("Resume")
                            .bold()
                            .font(.title)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(disabledResume)
                    .padding(.bottom)
                    Button(action: {showingCurrentTimer = false}) {
                        Text("End")
                            .bold()
                            .font(.title)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom)
                }
                .padding(.horizontal)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
