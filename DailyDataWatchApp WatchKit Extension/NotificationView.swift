//
//  NotificationView.swift
//  DailyDataWatchApp WatchKit Extension
//
//  Created by Fede Duarte on 6/4/22.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack {
            Text("Flights and Crew info are ready on your iWatch!")
                .multilineTextAlignment(.center)
                .lineSpacing(5)
        }.padding(.horizontal)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
