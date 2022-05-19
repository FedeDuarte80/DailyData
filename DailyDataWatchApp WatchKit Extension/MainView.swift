//
//  MainView.swift
//  DailyDataWatchApp WatchKit Extension
//
//  Created by Fede Duarte on 20/5/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ScrollView {
            HStack {
                HStack {
                    Text("VCE")
                    Text("-")
                    Text("MAH")
                }
                Spacer()
                HStack {
                    Text("EC - ")
                    Text("MAN")
                }
            }
            Divider()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
