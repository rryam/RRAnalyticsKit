import TelemetryClient
import SwiftUI

public struct RRAnalyticsKit {
    public static func initialise(with appID: String) {
        let configuration = TelemetryManagerConfiguration(appID: appID)
        
        TelemetryManager.initialize(with: configuration)
    }
    
    public static func publish(event: String, metadata: [String: String]? = nil) {
        if let metadata = metadata {
            TelemetryManager.send(event, with: metadata)
        } else {
            TelemetryManager.send(event)
        }
    }
    
    public static func publish(event: RRAnalyticsPoint, metadata: [String: String]? = nil) {
        if let metadata = metadata {
            print(metadata)
            TelemetryManager.send(event.description, with: metadata)
        } else {
            TelemetryManager.send(event.description)
        }
    }
}

public enum RRAnalyticsPoint: CustomStringConvertible {
    case onAppear(String)
    case onDisappear(String)
    case onClickView(String)
    case onClickButton(String)
    
    public var description: String {
        switch self {
            case .onAppear(let view):
                return "Appeared: \(view)".uppercased()
            case .onDisappear(let view):
                return "Disappeared: \(view)".uppercased()
            case .onClickView(let view): return "Tapped \(view) view".uppercased()
            case .onClickButton(let button): return "Tapped \(button) button".uppercased()
        }
    }
}

public extension View {
    func sendViewData(with metadata: [String: String]? = nil,
                          onAppear: Bool = false,
                          onDisappear: Bool = false) -> some View {
        self
            .onAppear {
                if onAppear {
                    RRAnalyticsKit.publish(event: .onAppear(String(describing: Self.self)), metadata: metadata)
                }
            }
            .onDisappear {
                if onDisappear {
                    RRAnalyticsKit.publish(event: .onDisappear(String(describing: Self.self)), metadata: metadata)
                }
            }
    }
}
