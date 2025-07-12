//
//  ClockWidgetLiveActivity.swift
//  ClockWidget
//
//  Created by Ana Arezo on 12/07/2025.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ClockWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct ClockWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ClockWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension ClockWidgetAttributes {
    fileprivate static var preview: ClockWidgetAttributes {
        ClockWidgetAttributes(name: "World")
    }
}

extension ClockWidgetAttributes.ContentState {
    fileprivate static var smiley: ClockWidgetAttributes.ContentState {
        ClockWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: ClockWidgetAttributes.ContentState {
         ClockWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: ClockWidgetAttributes.preview) {
   ClockWidgetLiveActivity()
} contentStates: {
    ClockWidgetAttributes.ContentState.smiley
    ClockWidgetAttributes.ContentState.starEyes
}
