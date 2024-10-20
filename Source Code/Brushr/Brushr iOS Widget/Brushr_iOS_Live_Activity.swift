//
//  Brushr_iOS_Live_Activity.swift
//  Brushr
//
//  Created by Mark Howard on 02/10/2024.
//

import ActivityKit
import WidgetKit
import SwiftUI
import AppIntents

struct Brushr_iOS_Live_ActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        //Dynamic Stateful Properties
        var remainingTime: String
    }

    //Fixed Non-Changing Properties
    var name: String
}

struct Brushr_iOS_Live_Activity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Brushr_iOS_Live_ActivityAttributes.self) { context in
            //Lock Screen UI
            HStack {
                VStack(alignment: .leading) {
                    Label("Brushr", systemImage: "mouth")
                        .bold()
                        .foregroundStyle(.white)
                    Text("Remaining Time")
                        .foregroundStyle(.white)
                }
                Spacer()
                Text("\(context.state.remainingTime)")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                Button(intent: RefreshTime()) {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .foregroundStyle(.white)
                }
            }
            .padding(.horizontal)
            .activityBackgroundTint(Color.orange)
            .activitySystemActionForegroundColor(Color.orange)
        } dynamicIsland: { context in
            DynamicIsland {
                //Expanded Dynamic Island UI
                DynamicIslandExpandedRegion(.leading) {
                    VStack {
                        Spacer()
                        Text("Remaining\nTime")
                            .bold()
                            .font(.headline)
                            .padding(.horizontal)
                            .foregroundStyle(.orange)
                        Spacer()
                    }
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Button(intent: RefreshTime()) {
                        Label("Update Time", systemImage: "arrow.clockwise.circle")
                    }
                    .tint(.orange)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    VStack {
                        Spacer()
                        Text("\(context.state.remainingTime)")
                            .bold()
                            .font(.title)
                            .padding()
                        Spacer()
                    }
                }
            } compactLeading: {
                Text("Remaining")
                    .foregroundStyle(.orange)
            } compactTrailing: {
                Text("\(context.state.remainingTime)")
            } minimal: {
                Image(systemName: "mouth")
                    .foregroundStyle(.orange)
            }
            .keylineTint(Color.orange)
        }
    }
}

struct RefreshTime: LiveActivityIntent {
    
    static var title: LocalizedStringResource = "Update Live Activity Time"
    static var description = IntentDescription("Updates The Current Countdown Time Of A Live Activity.")
    
    func perform() async throws -> some IntentResult {
        let contentState = Brushr_iOS_Live_ActivityAttributes.ContentState(remainingTime: "")
        
        Task {
            await Activity<Brushr_iOS_Live_ActivityAttributes>.activities.first!.update(
                ActivityContent<Brushr_iOS_Live_ActivityAttributes.ContentState>(
                    state: contentState,
                    staleDate: nil
                )
            )
        }
        return .result()
    }
}
