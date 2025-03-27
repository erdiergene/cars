import SwiftUI

struct ContentView: View {
  @Environment(\.managedObjectContext) private var viewContext
  @State private var selectedTab = 0
  
  var body: some View {
    TabView(selection: $selectedTab) {
      NavigationStack {
        CarListView()
      }
      .tabItem {
        Label("Araçlar", systemImage: "car.fill")
      }
      .tag(0)
      
      NavigationStack {
        MaintenanceListView()
      }
      .tabItem {
        Label("Bakımlar", systemImage: "wrench.and.screwdriver.fill")
      }
      .tag(1)
      
      NavigationStack {
        FuelTrackingView()
      }
      .tabItem {
        Label("Yakıt", systemImage: "fuelpump.fill")
      }
      .tag(2)
      
      NavigationStack {
        SettingsView()
      }
      .tabItem {
        Label("Ayarlar", systemImage: "gear")
      }
      .tag(3)
    }
  }
}