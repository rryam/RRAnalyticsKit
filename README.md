# RRAnalyticsKit

Analytics for my apps. Currently using [Telemetry](https://apptelemetry.io) as the provider

## Usage 

For example, I've a method `evaluate()` in `MainViewModel` that acts as the parent class for `RGBViewModel`, `HSBViewModel` and `CMYKViewModel`. I would like to send an event that contains the color model, current score, high score, and seconds taken - 

```swift 
RRAnalyticsKit.publish(event: .onClickButton(ButtonText.evaluate), metadata:
                        ["Color Model": String(describing: Self.self),
                         "Score": String(describing: currentScore),
                         "High Score": String(describing: highScore),
                         "Seconds Taken": String(describing: secondsTaken)])

```
