//  Created by Fede Duarte on 6/4/22.

import SwiftUI
import CoreData
import UserNotifications


struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(fetchRequest: Flightdata.getFlightdata())
    private var flightdata: FetchedResults<Flightdata>
    @State private var showingAlert = false
    var body: some View {
        
        ScrollView {
            ForEach(flightdata) { fl in
// MARK: - Destination
                iWatchDestination(dest1: fl.destination1Name, dest2: fl.destination2Name, reg: fl.registrationName)
                    .padding(.leading, 2)
                Divider()
// MARK: - Fligths
                VStack {
                    if !fl.flight1Name.isEmpty {
                        iWatchFlights(flight: fl.flight1Name, std: fl.departure1Name, sta: fl.arrival1Name, pax: fl.pax1Name)
                    } else { EmptyView() }
                    
                    if !fl.flight2Name.isEmpty {
                        iWatchFlights(flight: fl.flight2Name, std: fl.departure2Name, sta: fl.arrival2Name, pax: fl.pax2Name)
                    } else { EmptyView() }
                    
                    if !fl.flight3Name.isEmpty {
                        iWatchFlights(flight: fl.flight3Name, std: fl.departure3Name, sta: fl.arrival3Name, pax: fl.pax3Name)
                    } else { EmptyView() }
                    
                    if !fl.flight4Name.isEmpty {
                        iWatchFlights(flight: fl.flight4Name, std: fl.departure4Name, sta: fl.arrival4Name, pax: fl.pax4Name)
                    } else { EmptyView() }
                }
                Divider()
// MARK: - Crew
                VStack {
                    if !fl.flightcrew1Name.isEmpty {
                        iWatchCrew(crew: fl.flightcrew1Name, num: fl.flightcrew1Number)
                    } else { EmptyView() }
                    
                    if !fl.flightcrew2Name.isEmpty {
                        iWatchCrew(crew: fl.flightcrew2Name, num: fl.flightcrew2Number)
                    } else { EmptyView() }
                    
                    if !fl.cabincrew2Name.isEmpty {
                        iWatchCrew(crew: fl.cabincrew2Name, num: fl.crew2Number)
                    } else { EmptyView() }
                    
                    if !fl.cabincrew3Name.isEmpty {
                        iWatchCrew(crew: fl.cabincrew3Name, num: fl.crew3Number)
                    } else { EmptyView() }
                    
                    if !fl.cabincrew4Name.isEmpty {
                        iWatchCrew(crew: fl.cabincrew4Name, num: fl.crew4Number)
                    } else { EmptyView() }
                    
                    if !fl.cabincrew5Name.isEmpty {
                        iWatchCrew(crew: fl.cabincrew5Name, num: fl.crew5Number)
                    } else { EmptyView() }
                }
                
                .padding(.horizontal, 2)
                
                clearButton().padding(.top, 4)
                
                notificationPermission()
                
                showNotification()
                
            }
            if flightdata.count == 0 { EmptyData() } // FE
            
            Spacer()
        }
        
         // SW
        .navigationTitle("DailyData")
        .navigationBarTitleDisplayMode(.inline)
        .confirmationDialog("Are you sure you want to delete all the data?", isPresented: $showingAlert, titleVisibility: .visible) {
            Button("Delete all", role: .destructive) {
                PersistentContainer.deleteBatch()
                
            }
        }
    }
    func clearButton() -> some View {
        Button(action: { showingAlert.toggle() }) { Text("Delete all") }
    }
    func notificationPermission() -> some View {
        Button(action: {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("All set!")
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
        }) {
            Text("Request permission")
        }
    }
    func showNotification() -> some View {
        Button(action: {
            let content = UNMutableNotificationContent()
            content.title = "First Test"
            content.subtitle = "Nice work!"
            content.categoryIdentifier = "myCategory"
            content.sound = UNNotificationSound.default
//            let category = UNNotificationCategory(identifier: "myCategory", actions: [], intentIdentifiers: [])
//            UNUserNotificationCenter.current().setNotificationCategories([category])
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        }) {
            Text("Show my Notification")
        }
    }
}


struct iWatchDestination: View {
    let dest1: String
    let dest2: String
    let reg: String
    var body: some View {
        VStack {
            HStack {
                Text(dest1)
                Text("-").opacity(dest2.isEmpty ? 0 : 1)
                Text(dest2)
                Spacer()
            }
            HStack {
                Text("EC - ")
                Text(reg)
                Spacer()
            }
        }
    }
}

struct iWatchFlights: View {
    let flight: String
    let std: String
    let sta: String
    let pax: String
    let w: CGFloat = 42
    var body: some View {
        HStack {
            Text(flight).frame(width: w)
            Text(std).frame(width: w)
            Text(sta).frame(width: w)
            Text(pax).frame(width: 30)
        }.lineLimit(1)
    }
}

struct iWatchCrew: View {
    let crew: String
    let num: String
    var body: some View {
        HStack {
            Text(crew)
            Spacer()
            Text(num)
        }.lineLimit(1)
    }
}

/*
 
 if fl.flight2Name.isEmpty && fl.flight3Name.isEmpty && fl.flight4Name.isEmpty {
     iWatchFlights(flight: fl.flight1Name, std: fl.departure1Name, sta: fl.arrival1Name, pax: fl.pax1Name)
 } else if fl.flight3Name.isEmpty && fl.flight4Name.isEmpty {
     iWatchFlights(flight: fl.flight1Name, std: fl.departure1Name, sta: fl.arrival1Name, pax: fl.pax1Name)
     iWatchFlights(flight: fl.flight2Name, std: fl.departure2Name, sta: fl.arrival2Name, pax: fl.pax2Name)
 } else if fl.flight4Name.isEmpty {
     iWatchFlights(flight: fl.flight1Name, std: fl.departure1Name, sta: fl.arrival1Name, pax: fl.pax1Name)
     iWatchFlights(flight: fl.flight2Name, std: fl.departure2Name, sta: fl.arrival2Name, pax: fl.pax2Name)
     iWatchFlights(flight: fl.flight3Name, std: fl.departure3Name, sta: fl.arrival3Name, pax: fl.pax3Name)
 } else {
     iWatchFlights(flight: fl.flight1Name, std: fl.departure1Name, sta: fl.arrival1Name, pax: fl.pax1Name)
     iWatchFlights(flight: fl.flight2Name, std: fl.departure2Name, sta: fl.arrival2Name, pax: fl.pax2Name)
     iWatchFlights(flight: fl.flight3Name, std: fl.departure3Name, sta: fl.arrival3Name, pax: fl.pax3Name)
     iWatchFlights(flight: fl.flight4Name, std: fl.departure4Name, sta: fl.arrival4Name, pax: fl.pax4Name)
 }
 
 if fl.cabincrew4Name.isEmpty && fl.cabincrew5Name.isEmpty {
     iWatchCrew(crew: fl.flightcrew1Name, num: fl.flightcrew1Number)
     iWatchCrew(crew: fl.flightcrew2Name, num: fl.flightcrew2Number)
     iWatchCrew(crew: fl.cabincrew2Name, num: fl.crew2Number)
     iWatchCrew(crew: fl.cabincrew3Name, num: fl.crew3Number)
 } else if fl.cabincrew5Name.isEmpty {
     iWatchCrew(crew: fl.flightcrew1Name, num: fl.flightcrew1Number)
     iWatchCrew(crew: fl.flightcrew2Name, num: fl.flightcrew2Number)
     iWatchCrew(crew: fl.cabincrew2Name, num: fl.crew2Number)
     iWatchCrew(crew: fl.cabincrew3Name, num: fl.crew3Number)
     iWatchCrew(crew: fl.cabincrew4Name, num: fl.crew4Number)
 } else {
     iWatchCrew(crew: fl.flightcrew1Name, num: fl.flightcrew1Number)
     iWatchCrew(crew: fl.flightcrew2Name, num: fl.flightcrew2Number)
     iWatchCrew(crew: fl.cabincrew2Name, num: fl.crew2Number)
     iWatchCrew(crew: fl.cabincrew3Name, num: fl.crew3Number)
     iWatchCrew(crew: fl.cabincrew4Name, num: fl.crew4Number)
     iWatchCrew(crew: fl.cabincrew5Name, num: fl.crew5Number)
 }
 
 */
