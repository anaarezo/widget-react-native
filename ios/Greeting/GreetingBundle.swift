//
//  GreetingBundle.swift
//  Greeting
//
//  Created by Ana Arezo on 12/07/2025.
//

import WidgetKit
import SwiftUI

@main
struct GreetingBundle: WidgetBundle {
    var body: some Widget {
        Greeting()
        GreetingControl()
        GreetingLiveActivity()
    }
}
