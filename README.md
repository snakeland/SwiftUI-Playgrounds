# A Colection of useful playgrounds

This repo contains a collection of useful swift playgrounds. 

## PropertyWrappers Playground

Contains small example of usage with a multiple swift property wrappers for learning purpouses.

### Property wrappers

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