//
//  GreetingEntryView.swift
//  GreetingExtension
//
//  Created by Ana Arezo on 13/07/2025.
//

import WidgetKit
import SwiftUI

struct GreetingEntryView: View {
    
    let entry: GreetingEntryModel
    
    var body: some View {
        
        ZStack {
            // Background Image
            Image("BackgroundImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
            
            // Semi-transparent overlay for better text readability
            Color.black.opacity(0.3)
            
            // Content
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(Date(), style: .time)
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                Spacer()
                
                Text(greeting())
                    .font(.headline)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
            }
            .padding(16)
        }
        .font(.headline)
        .foregroundColor(.white)
    }
    
    /// Get greeting as per current time
    
    func greeting() -> String {
            
        var greet = ""
         
        let midNight0 = Calendar.current.date(bySettingHour: 0, minute: 00, second: 00, of: entry.date)!
        let nightEnd = Calendar.current.date(bySettingHour: 3, minute: 59, second: 59, of: entry.date)!
        
        let morningStart = Calendar.current.date(bySettingHour: 4, minute: 00, second: 0, of: entry.date)!
        let morningEnd = Calendar.current.date(bySettingHour: 11, minute: 59, second: 59, of: entry.date)!
        
        let noonStart = Calendar.current.date(bySettingHour: 12, minute: 00, second: 00, of: entry.date)!
        let noonEnd = Calendar.current.date(bySettingHour: 16, minute: 59, second: 59, of: entry.date)!
        
        let eveStart = Calendar.current.date(bySettingHour: 17, minute: 00, second: 00, of: entry.date)!
        let eveEnd = Calendar.current.date(bySettingHour: 20, minute: 59, second: 59, of: entry.date)!
        
        let nightStart = Calendar.current.date(bySettingHour: 21, minute: 00, second: 00, of: entry.date)!
        let midNight24 = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: entry.date)!
        
        if ((entry.date >= midNight0) && (nightEnd >= entry.date)) {
            greet = "Good Night 🌙"
        } else if ((entry.date >= morningStart) && (morningEnd >= entry.date)) {
            greet = "Good Morning 🌤"
        } else if ((entry.date >= noonStart) && (noonEnd >= entry.date)) {
            greet = "Good Afternoon ☀️"
        } else if ((entry.date >= eveStart) && (eveEnd >= entry.date)) {
            greet = "Good Evening 🌥"
        } else if ((entry.date >= nightStart) && (midNight24 >= entry.date)) {
            greet = "Good Night 🌙"
        }

        /// Set name of device with greeting

        return "Hi \(UIDevice.current.name),\n\(greet)"
    }
}

struct GreetingEntryView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingEntryView(entry: GreetingEntryModel(date: Date()))
    }
}
