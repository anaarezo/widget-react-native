//
//  Greeting.swift
//  Greeting
//
//  Created by Ana Arezo on 12/07/2025.
//
import WidgetKit
import SwiftUI

struct Greeting: Widget {
    let kind: String = "Greeting"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: GreetingTimeline()) { entry in
            GreetingEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
        .configurationDisplayName("Greeting Widget")
        .description("It will greet as per currnent time.")
    }
}

struct Greeting_Previews: PreviewProvider {
    static var previews: some View {
        GreetingEntryView(entry: GreetingEntryModel(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
