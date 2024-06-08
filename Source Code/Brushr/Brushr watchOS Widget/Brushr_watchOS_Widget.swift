//
//  Brushr_watchOS_Widget.swift
//  Brushr watchOS Widget
//
//  Created by Mark Howard on 01/08/2023.
//

import WidgetKit
import SwiftUI

//Setup Widget Timeline And Widget Update Functions
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 24 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

//Setup Widget Timeline Entry
struct SimpleEntry: TimelineEntry {
    let date: Date
}

//SwiftUI Widget Views For Custom, 30 Second, 1, 2, 3, 4 And 5 minute Timers
struct Brushr_watchOS_WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            Text("N/A")
        case .systemMedium:
            Text("N/A")
        case .systemLarge:
            Text("N/A")
        case .systemExtraLarge:
            Text("N/A")
        case .accessoryCorner:
            VStack {
                Image(systemName: "mouth")
                    .resizable()
                    .foregroundColor(.orange)
                    .scaledToFit()
                    .widgetAccentable()
                    .widgetLabel {
                        Text("Custom")
                    }
            }
        case .accessoryCircular:
            ZStack {
                AccessoryWidgetBackground()
                Image(systemName: "mouth")
                    .resizable()
                    .padding(.all)
                    .scaledToFit()
                    .foregroundColor(.orange)
                    .widgetAccentable()
                    .widgetLabel {
                        Text("Custom")
                    }
            }
        case .accessoryRectangular:
            HStack {
                VStack(alignment: .leading) {
                    Label("Brushr", systemImage: "mouth")
                        .bold()
                        .foregroundColor(.orange)
                        .widgetAccentable()
                    Text("Start A Custom Timer")
                }
                Spacer()
            }
        case .accessoryInline:
            Label("Custom", systemImage: "mouth")
                .foregroundColor(.orange)
        @unknown default:
            Text("Unknown")
        }
    }
}

struct Brushr_30_watchOS_WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            Text("N/A")
        case .systemMedium:
            Text("N/A")
        case .systemLarge:
            Text("N/A")
        case .systemExtraLarge:
            Text("N/A")
        case .accessoryCorner:
            VStack {
                Image(systemName: "mouth")
                    .resizable()
                    .foregroundColor(.orange)
                    .scaledToFit()
                    .widgetAccentable()
                    .widgetLabel {
                        Text("00:30")
                    }
            }
        case .accessoryCircular:
            ZStack {
                AccessoryWidgetBackground()
                Image(systemName: "30.circle")
                    .resizable()
                    .padding(.all)
                    .scaledToFit()
                    .foregroundColor(.orange)
                    .widgetAccentable()
                    .widgetLabel {
                        Text("00:30")
                    }
            }
        case .accessoryRectangular:
            HStack {
                VStack(alignment: .leading) {
                    Label("Brushr", systemImage: "mouth")
                        .bold()
                        .foregroundColor(.orange)
                        .widgetAccentable()
                    Text("Start A 00:30 Timer")
                }
                Spacer()
            }
        case .accessoryInline:
            Label("00:30", systemImage: "mouth")
                .foregroundColor(.orange)
        @unknown default:
            Text("Unknown")
        }
    }
}

struct Brushr_1_watchOS_WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            Text("N/A")
        case .systemMedium:
            Text("N/A")
        case .systemLarge:
            Text("N/A")
        case .systemExtraLarge:
            Text("N/A")
        case .accessoryCorner:
            VStack {
                Image(systemName: "mouth")
                    .resizable()
                    .foregroundColor(.orange)
                    .scaledToFit()
                    .widgetAccentable()
                    .widgetLabel {
                        Text("01:00")
                    }
            }
        case .accessoryCircular:
            ZStack {
                AccessoryWidgetBackground()
                Image(systemName: "1.circle")
                    .resizable()
                    .padding(.all)
                    .scaledToFit()
                    .foregroundColor(.orange)
                    .widgetAccentable()
                    .widgetLabel {
                        Text("01:00")
                    }
            }
        case .accessoryRectangular:
            HStack {
                VStack(alignment: .leading) {
                    Label("Brushr", systemImage: "mouth")
                        .bold()
                        .foregroundColor(.orange)
                        .widgetAccentable()
                    Text("Start A 01:00 Timer")
                }
                Spacer()
            }
        case .accessoryInline:
            Label("01:00", systemImage: "mouth")
                .foregroundColor(.orange)
        @unknown default:
            Text("Unknown")
        }
    }
}

struct Brushr_2_watchOS_WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            Text("N/A")
        case .systemMedium:
            Text("N/A")
        case .systemLarge:
            Text("N/A")
        case .systemExtraLarge:
            Text("N/A")
        case .accessoryCorner:
            VStack {
                Image(systemName: "mouth")
                    .resizable()
                    .foregroundColor(.orange)
                    .scaledToFit()
                    .widgetAccentable()
                    .widgetLabel {
                        Text("02:00")
                    }
            }
        case .accessoryCircular:
            ZStack {
                AccessoryWidgetBackground()
                Image(systemName: "2.circle")
                    .resizable()
                    .padding(.all)
                    .scaledToFit()
                    .foregroundColor(.orange)
                    .widgetAccentable()
                    .widgetLabel {
                        Text("02:00")
                    }
            }
        case .accessoryRectangular:
            HStack {
                VStack(alignment: .leading) {
                    Label("Brushr", systemImage: "mouth")
                        .bold()
                        .foregroundColor(.orange)
                        .widgetAccentable()
                    Text("Start A 02:00 Timer")
                }
                Spacer()
            }
        case .accessoryInline:
            Label("02:00", systemImage: "mouth")
                .foregroundColor(.orange)
        @unknown default:
            Text("Unknown")
        }
    }
}

struct Brushr_3_watchOS_WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            Text("N/A")
        case .systemMedium:
            Text("N/A")
        case .systemLarge:
            Text("N/A")
        case .systemExtraLarge:
            Text("N/A")
        case .accessoryCorner:
            VStack {
                Image(systemName: "mouth")
                    .resizable()
                    .foregroundColor(.orange)
                    .scaledToFit()
                    .widgetAccentable()
                    .widgetLabel {
                        Text("03:00")
                    }
            }
        case .accessoryCircular:
            ZStack {
                AccessoryWidgetBackground()
                Image(systemName: "3.circle")
                    .resizable()
                    .padding(.all)
                    .scaledToFit()
                    .foregroundColor(.orange)
                    .widgetAccentable()
                    .widgetLabel {
                        Text("03:00")
                    }
            }
        case .accessoryRectangular:
            HStack {
                VStack(alignment: .leading) {
                    Label("Brushr", systemImage: "mouth")
                        .bold()
                        .foregroundColor(.orange)
                        .widgetAccentable()
                    Text("Start A 03:00 Timer")
                }
                Spacer()
            }
        case .accessoryInline:
            Label("03:00", systemImage: "mouth")
                .foregroundColor(.orange)
        @unknown default:
            Text("Unknown")
        }
    }
}

struct Brushr_4_watchOS_WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            Text("N/A")
        case .systemMedium:
            Text("N/A")
        case .systemLarge:
            Text("N/A")
        case .systemExtraLarge:
            Text("N/A")
        case .accessoryCorner:
            VStack {
                Image(systemName: "mouth")
                    .resizable()
                    .foregroundColor(.orange)
                    .scaledToFit()
                    .widgetAccentable()
                    .widgetLabel {
                        Text("04:00")
                    }
            }
        case .accessoryCircular:
            ZStack {
                AccessoryWidgetBackground()
                Image(systemName: "4.circle")
                    .resizable()
                    .padding(.all)
                    .scaledToFit()
                    .foregroundColor(.orange)
                    .widgetAccentable()
                    .widgetLabel {
                        Text("04:00")
                    }
            }
        case .accessoryRectangular:
            HStack {
                VStack(alignment: .leading) {
                    Label("Brushr", systemImage: "mouth")
                        .bold()
                        .foregroundColor(.orange)
                        .widgetAccentable()
                    Text("Start A 04:00 Timer")
                }
                Spacer()
            }
        case .accessoryInline:
            Label("04:00", systemImage: "mouth")
                .foregroundColor(.orange)
        @unknown default:
            Text("Unknown")
        }
    }
}

struct Brushr_5_watchOS_WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            Text("N/A")
        case .systemMedium:
            Text("N/A")
        case .systemLarge:
            Text("N/A")
        case .systemExtraLarge:
            Text("N/A")
        case .accessoryCorner:
            VStack {
                Image(systemName: "mouth")
                    .resizable()
                    .foregroundColor(.orange)
                    .scaledToFit()
                    .widgetAccentable()
                    .widgetLabel {
                        Text("05:00")
                    }
            }
        case .accessoryCircular:
            ZStack {
                AccessoryWidgetBackground()
                Image(systemName: "5.circle")
                    .resizable()
                    .padding(.all)
                    .scaledToFit()
                    .foregroundColor(.orange)
                    .widgetAccentable()
                    .widgetLabel {
                        Text("05:00")
                    }
            }
        case .accessoryRectangular:
            HStack {
                VStack(alignment: .leading) {
                    Label("Brushr", systemImage: "mouth")
                        .bold()
                        .foregroundColor(.orange)
                        .widgetAccentable()
                    Text("Start A 05:00 Timer")
                }
                Spacer()
            }
        case .accessoryInline:
            Label("05:00", systemImage: "mouth")
                .foregroundColor(.orange)
        @unknown default:
            Text("Unknown")
        }
    }
}

//Package Views Into Separate Widget Entries 
struct Brushr_watchOS_Widget: Widget {
    let kind: String = "Brushr_watchOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_watchOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://custom"))
                .containerBackground(for: .widget) {
                    Color.accentColor
                }
        }
        .configurationDisplayName("Start A Custom Timer")
        .supportedFamilies([.accessoryCircular, .accessoryCorner, .accessoryRectangular, .accessoryInline])
        .description("Open The App And Start A Custom Timer.")
    }
}

struct Brushr_30_watchOS_Widget: Widget {
    let kind: String = "Brushr_30_watchOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_30_watchOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://30sec")!)
                .containerBackground(for: .widget) {
                    Color.accentColor
                }
        }
        .configurationDisplayName("Start A 00:30 Timer")
        .supportedFamilies([.accessoryCircular, .accessoryCorner, .accessoryRectangular, .accessoryInline])
        .description("Open The App And Start A 00:30 Timer.")
    }
}

struct Brushr_1_watchOS_Widget: Widget {
    let kind: String = "Brushr_1_watchOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_1_watchOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://1min")!)
                .containerBackground(for: .widget) {
                    Color.accentColor
                }
        }
        .configurationDisplayName("Start A 01:00 Timer")
        .supportedFamilies([.accessoryCircular, .accessoryCorner, .accessoryRectangular, .accessoryInline])
        .description("Open The App And Start A 01:00 Timer.")
    }
}

struct Brushr_2_watchOS_Widget: Widget {
    let kind: String = "Brushr_2_watchOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_2_watchOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://2min")!)
                .containerBackground(for: .widget) {
                    Color.accentColor
                }
        }
        .configurationDisplayName("Start A 02:00 Timer")
        .supportedFamilies([.accessoryCircular, .accessoryCorner, .accessoryRectangular, .accessoryInline])
        .description("Open The App And Start A 02:00 Timer.")
    }
}

struct Brushr_3_watchOS_Widget: Widget {
    let kind: String = "Brushr_3_watchOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_3_watchOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://3min")!)
                .containerBackground(for: .widget) {
                    Color.accentColor
                }
        }
        .configurationDisplayName("Start A 03:00 Timer")
        .supportedFamilies([.accessoryCircular, .accessoryCorner, .accessoryRectangular, .accessoryInline])
        .description("Open The App And Start A 03:00 Timer.")
    }
}

struct Brushr_4_watchOS_Widget: Widget {
    let kind: String = "Brushr_4_watchOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_4_watchOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://4min")!)
                .containerBackground(for: .widget) {
                    Color.accentColor
                }
        }
        .configurationDisplayName("Start A 04:00 Timer")
        .supportedFamilies([.accessoryCircular, .accessoryCorner, .accessoryRectangular, .accessoryInline])
        .description("Open The App And Start A 04:00 Timer.")
    }
}

struct Brushr_5_watchOS_Widget: Widget {
    let kind: String = "Brushr_5_watchOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_5_watchOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://5min")!)
                .containerBackground(for: .widget) {
                    Color.accentColor
                }
        }
        .configurationDisplayName("Start A 05:00 Timer")
        .supportedFamilies([.accessoryCircular, .accessoryCorner, .accessoryRectangular, .accessoryInline])
        .description("Open The App And Start A 05:00 Timer.")
    }
}

struct Brushr_watchOS_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Brushr_watchOS_WidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
