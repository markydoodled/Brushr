//
//  Brushr_iOS_Widget.swift
//  Brushr iOS Widget
//
//  Created by Mark Howard on 31/07/2023.
//

import WidgetKit
import SwiftUI

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

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct Brushr_iOS_WidgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        ZStack {
            AccessoryWidgetBackground()
            VStack {
                Image(systemName: "mouth")
                Text("Custom")
                    .font(.caption)
            }
        }
    }
}

struct Brushr_30_iOS_WidgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        ZStack {
            AccessoryWidgetBackground()
            VStack {
                Image(systemName: "mouth")
                Text("00:30")
                    .font(.callout)
            }
        }
    }
}

struct Brushr_1_iOS_WidgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        ZStack {
            AccessoryWidgetBackground()
            VStack {
                Image(systemName: "mouth")
                Text("01:00")
                    .font(.callout)
            }
        }
    }
}

struct Brushr_2_iOS_WidgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        ZStack {
            AccessoryWidgetBackground()
            VStack {
                Image(systemName: "mouth")
                Text("02:00")
                    .font(.callout)
            }
        }
    }
}

struct Brushr_3_iOS_WidgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        ZStack {
            AccessoryWidgetBackground()
            VStack {
                Image(systemName: "mouth")
                Text("03:00")
                    .font(.callout)
            }
        }
    }
}

struct Brushr_4_iOS_WidgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        ZStack {
            AccessoryWidgetBackground()
            VStack {
                Image(systemName: "mouth")
                Text("04:00")
                    .font(.callout)
            }
        }
    }
}

struct Brushr_5_iOS_WidgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        ZStack {
            AccessoryWidgetBackground()
            VStack {
                Image(systemName: "mouth")
                Text("05:00")
                    .font(.callout)
            }
        }
    }
}

struct Brushr_iOS_Widget: Widget {
    let kind: String = "Brushr_iOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_iOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://custom")!)
        }
        .configurationDisplayName("Start A Custom Timer")
        .supportedFamilies([.accessoryCircular])
        .description("Open The App And Start A Custom Timer.")
    }
}

struct Brushr_30_iOS_Widget: Widget {
    let kind: String = "Brushr_30_iOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_30_iOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://30sec")!)
        }
        .configurationDisplayName("Start A 00:30 Timer")
        .supportedFamilies([.accessoryCircular])
        .description("Open The App And Start A 00:30 Timer.")
    }
}

struct Brushr_1_iOS_Widget: Widget {
    let kind: String = "Brushr_1_iOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_1_iOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://1min")!)
        }
        .configurationDisplayName("Start A 01:00 Timer")
        .supportedFamilies([.accessoryCircular])
        .description("Open The App And Start A 01:00 Timer.")
    }
}

struct Brushr_2_iOS_Widget: Widget {
    let kind: String = "Brushr_2_iOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_2_iOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://2min")!)
        }
        .configurationDisplayName("Start A 02:00 Timer")
        .supportedFamilies([.accessoryCircular])
        .description("Open The App And Start A 02:00 Timer.")
    }
}

struct Brushr_3_iOS_Widget: Widget {
    let kind: String = "Brushr_3_iOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_3_iOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://3min")!)
        }
        .configurationDisplayName("Start A 03:00 Timer")
        .supportedFamilies([.accessoryCircular])
        .description("Open The App And Start A 03:00 Timer.")
    }
}

struct Brushr_4_iOS_Widget: Widget {
    let kind: String = "Brushr_4_iOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_4_iOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://4min")!)
        }
        .configurationDisplayName("Start A 04:00 Timer")
        .supportedFamilies([.accessoryCircular])
        .description("Open The App And Start A 04:00 Timer.")
    }
}

struct Brushr_5_iOS_Widget: Widget {
    let kind: String = "Brushr_5_iOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_5_iOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://5min")!)
        }
        .configurationDisplayName("Start A 05:00 Timer")
        .supportedFamilies([.accessoryCircular])
        .description("Open The App And Start A 055:00 Timer.")
    }
}

struct Brushr_iOS_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Brushr_iOS_WidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
