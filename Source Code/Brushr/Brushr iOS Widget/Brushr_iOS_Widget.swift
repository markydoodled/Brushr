//
//  Brushr_iOS_Widget.swift
//  Brushr iOS Widget
//
//  Created by Mark Howard on 31/07/2023.
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
struct Brushr_iOS_WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    var body: some View {
        if widgetFamily == .accessoryCircular {
            ZStack {
                AccessoryWidgetBackground()
                VStack {
                    Image(systemName: "mouth")
                    Text("Custom")
                        .font(.caption)
                }
            }
        } else if widgetFamily == .systemSmall {
            ZStack {
                Rectangle()
                    .scaledToFill()
                    .foregroundStyle(.accent)
                VStack {
                    Image(systemName: "mouth")
                        .imageScale(.large)
                    Text("Custom")
                        .font(.title3)
                }
            }
        }
    }
}

struct Brushr_30_iOS_WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    var body: some View {
        if widgetFamily == .accessoryCircular {
            ZStack {
                AccessoryWidgetBackground()
                VStack {
                    Image(systemName: "mouth")
                    Text("00:30")
                        .font(.callout)
                }
            }
        } else if widgetFamily == .systemSmall {
            ZStack {
                Rectangle()
                    .scaledToFill()
                    .foregroundStyle(.accent)
                VStack {
                    Image(systemName: "mouth")
                        .imageScale(.large)
                    Text("00:30")
                        .font(.title3)
                }
            }
        }
    }
}

struct Brushr_1_iOS_WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    var body: some View {
        if widgetFamily == .accessoryCircular {
            ZStack {
                AccessoryWidgetBackground()
                VStack {
                    Image(systemName: "mouth")
                    Text("01:00")
                        .font(.callout)
                }
            }
        } else if widgetFamily == .systemSmall {
            ZStack {
                Rectangle()
                    .scaledToFill()
                    .foregroundStyle(.accent)
                VStack {
                    Image(systemName: "mouth")
                        .imageScale(.large)
                    Text("01:00")
                        .font(.title3)
                }
            }
        }
    }
}

struct Brushr_2_iOS_WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    var body: some View {
        if widgetFamily == .accessoryCircular {
            ZStack {
                AccessoryWidgetBackground()
                VStack {
                    Image(systemName: "mouth")
                    Text("02:00")
                        .font(.callout)
                }
            }
        } else if widgetFamily == .systemSmall {
            ZStack {
                Rectangle()
                    .scaledToFill()
                    .foregroundStyle(.accent)
                VStack {
                    Image(systemName: "mouth")
                        .imageScale(.large)
                    Text("02:00")
                        .font(.title3)
                }
            }
        }
    }
}

struct Brushr_3_iOS_WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    var body: some View {
        if widgetFamily == .accessoryCircular {
            ZStack {
                AccessoryWidgetBackground()
                VStack {
                    Image(systemName: "mouth")
                    Text("03:00")
                        .font(.callout)
                }
            }
        } else if widgetFamily == .systemSmall {
            ZStack {
                Rectangle()
                    .scaledToFill()
                    .foregroundStyle(.accent)
                VStack {
                    Image(systemName: "mouth")
                        .imageScale(.large)
                    Text("03:00")
                        .font(.title3)
                }
            }
        }
    }
}

struct Brushr_4_iOS_WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    var body: some View {
        if widgetFamily == .accessoryCircular {
            ZStack {
                AccessoryWidgetBackground()
                VStack {
                    Image(systemName: "mouth")
                    Text("04:00")
                        .font(.callout)
                }
            }
        } else if widgetFamily == .systemSmall {
            ZStack {
                Rectangle()
                    .scaledToFill()
                    .foregroundStyle(.accent)
                VStack {
                    Image(systemName: "mouth")
                        .imageScale(.large)
                    Text("04:00")
                        .font(.title3)
                }
            }
        }
    }
}

struct Brushr_5_iOS_WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    var body: some View {
        if widgetFamily == .accessoryCircular {
            ZStack {
                AccessoryWidgetBackground()
                VStack {
                    Image(systemName: "mouth")
                    Text("05:00")
                        .font(.callout)
                }
            }
        } else if widgetFamily == .systemSmall {
            ZStack {
                Rectangle()
                    .scaledToFill()
                    .foregroundStyle(.accent)
                VStack {
                    Image(systemName: "mouth")
                        .imageScale(.large)
                    Text("05:00")
                        .font(.title3)
                }
            }
        }
    }
}

//Package Views Into Separate Widget Entries 
struct Brushr_iOS_Widget: Widget {
    let kind: String = "Brushr_iOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_iOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://custom")!)
                .containerBackground(for: .widget) {
                    Color.orange
                }
        }
        .configurationDisplayName("Start A Custom Timer")
        .supportedFamilies([.accessoryCircular, .systemSmall])
        .description("Open The App And Start A Custom Timer.")
    }
}

struct Brushr_30_iOS_Widget: Widget {
    let kind: String = "Brushr_30_iOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_30_iOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://30sec")!)
                .containerBackground(for: .widget) {
                    Color.orange
                }
        }
        .configurationDisplayName("Start A 00:30 Timer")
        .supportedFamilies([.accessoryCircular, .systemSmall])
        .description("Open The App And Start A 00:30 Timer.")
    }
}

struct Brushr_1_iOS_Widget: Widget {
    let kind: String = "Brushr_1_iOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_1_iOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://1min")!)
                .containerBackground(for: .widget) {
                    Color.orange
                }
        }
        .configurationDisplayName("Start A 01:00 Timer")
        .supportedFamilies([.accessoryCircular, .systemSmall])
        .description("Open The App And Start A 01:00 Timer.")
    }
}

struct Brushr_2_iOS_Widget: Widget {
    let kind: String = "Brushr_2_iOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_2_iOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://2min")!)
                .containerBackground(for: .widget) {
                    Color.orange
                }
        }
        .configurationDisplayName("Start A 02:00 Timer")
        .supportedFamilies([.accessoryCircular, .systemSmall])
        .description("Open The App And Start A 02:00 Timer.")
    }
}

struct Brushr_3_iOS_Widget: Widget {
    let kind: String = "Brushr_3_iOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_3_iOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://3min")!)
                .containerBackground(for: .widget) {
                    Color.orange
                }
        }
        .configurationDisplayName("Start A 03:00 Timer")
        .supportedFamilies([.accessoryCircular, .systemSmall])
        .description("Open The App And Start A 03:00 Timer.")
    }
}

struct Brushr_4_iOS_Widget: Widget {
    let kind: String = "Brushr_4_iOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_4_iOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://4min")!)
                .containerBackground(for: .widget) {
                    Color.orange
                }
        }
        .configurationDisplayName("Start A 04:00 Timer")
        .supportedFamilies([.accessoryCircular, .systemSmall])
        .description("Open The App And Start A 04:00 Timer.")
    }
}

struct Brushr_5_iOS_Widget: Widget {
    let kind: String = "Brushr_5_iOS_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Brushr_5_iOS_WidgetEntryView(entry: entry)
                .widgetURL(URL(string: "brushr://5min")!)
                .containerBackground(for: .widget) {
                    Color.orange
                }
        }
        .configurationDisplayName("Start A 05:00 Timer")
        .supportedFamilies([.accessoryCircular, .systemSmall])
        .description("Open The App And Start A 05:00 Timer.")
    }
}

struct Brushr_iOS_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Brushr_iOS_WidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
