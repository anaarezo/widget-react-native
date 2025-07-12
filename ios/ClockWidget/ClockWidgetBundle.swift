//
//  ClockWidgetBundle.swift
//  ClockWidget
//
//  Created by Ana Arezo on 12/07/2025.
//

import WidgetKit
import SwiftUI

@main
struct ClockWidgetBundle: WidgetBundle {
    var body: some Widget {
        ClockWidget()
        ClockWidgetControl()
        ClockWidgetLiveActivity()
    }
}
