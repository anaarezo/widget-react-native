//
//  GreetingLiveActivity.swift
//  Greeting
//
//  Created by Ana Arezo on 12/07/2025.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct GreetingAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct GreetingLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: GreetingAttributes.self) { context in
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

extension GreetingAttributes {
    fileprivate static var preview: GreetingAttributes {
        GreetingAttributes(name: "World")
    }
}

extension GreetingAttributes.ContentState {
    fileprivate static var smiley: GreetingAttributes.ContentState {
        GreetingAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: GreetingAttributes.ContentState {
         GreetingAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: GreetingAttributes.preview) {
   GreetingLiveActivity()
} contentStates: {
    GreetingAttributes.ContentState.smiley
    GreetingAttributes.ContentState.starEyes
}
