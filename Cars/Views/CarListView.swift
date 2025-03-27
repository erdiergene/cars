import SwiftUI
import CoreData

struct CarListView: View {
  @Environment(\.managedObjectContext) private var viewContext
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Car.brand, ascending: true)],
    animation: .default)
  private var cars: FetchedResults<Car>
  
  @State private var showingAddCar = false
  
  var body: some View {
    List {
      ForEach(cars) { car in
        NavigationLink {
          CarDetailView(car: car)
        } label: {
          CarRow(car: car)
        }
      }
      .onDelete(perform: deleteCars)
    }
    .navigationTitle("Araçlarım")
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button {
          showingAddCar = true
        } label: {
          Label("Araç Ekle", systemImage: "plus")
        }
      }
    }
    .sheet(isPresented: $showingAddCar) {
      AddCarView()
    }
  }
  
  private func deleteCars(offsets: IndexSet) {
    withAnimation {
      offsets.map { cars[$0] }.forEach(viewContext.delete)
      
      do {
        try viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Silme hatası: \(nsError)")
      }
    }
  }
}

struct CarRow: View {
  let car: Car
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("\(car.brand) \(car.model)")
        .font(.headline)
      
      HStack {
        Text(car.plateNumber)
          .font(.subheadline)
          .foregroundColor(.secondary)
        
        Spacer()
        
        Text("\(Int(car.mileage)) km")
          .font(.caption)
          .foregroundColor(.secondary)
      }
    }
  }
}