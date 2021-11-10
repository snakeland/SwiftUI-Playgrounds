/*:
 # Property wrappers example
 
 1. `ObservableObject` Protocol [more](https://developer.apple.com/documentation/combine/observableobject).
 
 2. `@Published` Class contrained [more](https://developer.apple.com/documentation/combine/published/).
 
 3. `@State` Should be private if possible. Holds state for specific view [more](https://developer.apple.com/documentation/swiftui/state).
 
 4. `@StateObject` To be used together with ObservableObject [more](https://developer.apple.com/documentation/swiftui/stateobject/).
 
 5. `@ObservedObject` [more](https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-observedobject-to-manage-state-from-external-objects).\
    **Tip** It is really important that you use `@ObservedObject` only with views that were passed in from elsewhere. You should not use this property wrapper to create the initial instance of an observable object – that’s what `@StateObject` is for.
 
 6. `@EnvironmentObject` [more](https://www.hackingwithswift.com/quick-start/swiftui/whats-the-difference-between-observedobject-state-and-environmentobject)
 
 7. `@Binding` Connects a property to a source of truth stored elsewhere [more](https://developer.apple.com/documentation/swiftui/binding/).
 
 ## Reference links and articles
 
 * [Nested observable objects is SwifUI](https://rhonabwy.com/2021/02/13/nested-observable-objects-in-swiftui/)
 * [Difference bettwen @ObservedObject, @State and @EnvironmentObject](https://www.hackingwithswift.com/quick-start/swiftui/whats-the-difference-between-observedobject-state-and-environmentobject)
 */

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
  @State var numberOfTimes: Int = 0
  @StateObject var viewModel: ViewModel = ViewModel()
  
  var body: some View {
    ZStack {
      Color.white.frame(width: 250, height: 500)
      VStack {
        Spacer()
        Group {
          Text("@State")
            .font(.caption2)
          Text("\(numberOfTimes)")
            .frame(width: 30)
            .padding(10)
            .background(Color.gray)
            .foregroundColor(Color.white)
            .cornerRadius(10)
          Button("Press me!") {
            numberOfTimes += 1
          }
        }
        Spacer()
        Group {
          Text("@StateObject ViewModel + Type")
            .font(.caption2)
          Text("\(viewModel.numberOfTimes)")
            .frame(width: 30)
            .padding(10)
            .background(Color.gray)
            .foregroundColor(Color.white)
            .cornerRadius(10)
          Button("Press me!") {
            viewModel.numberOfTimes += 1
          }
        }
        Spacer()
        Group {
          Text("@StateObject VM + Struct")
            .font(.caption2)
          Text("\(viewModel.structModel.numberOfTimes)")
            .frame(width: 30)
            .padding(10)
            .background(Color.gray)
            .foregroundColor(Color.white)
            .cornerRadius(10)
          Button("Press me!") {
            viewModel.structModel.numberOfTimes += 1
          }
        }
        Spacer()
        Group {
          Text("@StateObject VM + Class")
            .font(.caption2)
          Text("\(viewModel.classModel.numberOfTimes)")
            .frame(width: 30)
            .padding(10)
            .background(Color.gray)
            .foregroundColor(Color.white)
            .cornerRadius(10)
          Button("Press me!") {
            viewModel.classModel.numberOfTimes += 1
          }
        }
        Spacer()
      }
      .shadow(radius: 10)
    }
  }
}

import Combine
class ViewModel: ObservableObject {
  @Published var numberOfTimes: Int = 0
  @Published var structModel: StructModelObject = StructModelObject()
  @Published var classModel: ClassModelObject = ClassModelObject()
  
  var cancellables = Set<AnyCancellable>()
  
  init() {
    classModel
      .$numberOfTimes
      .sink { [weak self] _ in
        self?.objectWillChange.send()
      }.store(in: &cancellables)
  }
}

struct StructModelObject {
  var numberOfTimes: Int = 0
}

class ClassModelObject: ObservableObject {
  @Published var numberOfTimes: Int = 0
}

PlaygroundPage.current.setLiveView(ContentView())
