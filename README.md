# RRAnalyticsKit

Analytics for my apps. Currently using [Telemetry](https://apptelemetry.io) as the provider

## Usage 

For example, I've a method `evaluate()` in `MainViewModel` that acts as the parent class for `RGBViewModel`, `HSBViewModel` and `CMYKViewModel`. I would like to send an event that contains the color model, current score, high score, and seconds taken - 

```swift 
let metadata = ["Color Model": String(describing: Self.self),
                "Score": String(describing: currentScore),
                "High Score": String(describing: highScore),
                "Seconds Taken": String(describing: secondsTaken)]

RRAnalyticsKit.publish(event: .onClickButton(ButtonText.evaluate), metadata: metadata)
```

For a SwiftUI view's lifecycle, you can use `View.sendViewData(with:onAppear:onDisappear:)` - 

```swift
struct ContentView: View {
    @State private var showAnalyticsView = false
    
    var body: some View {
        Button(action: { showAnalyticsView.toggle() }) {
            Text("RRAnalyticsKit")
        }
        .fullScreenCover(isPresented: $showAnalyticsView) { 
            AnalyticsView()
                .sendViewData(with: ["Parent View": String(describing: Self.self)], onAppear: true, onDisappear: true)
        }
    }
}

struct AnalyticsView: View {
    var body: some View {
        Text("AnalyticsView")
    }
}
```

