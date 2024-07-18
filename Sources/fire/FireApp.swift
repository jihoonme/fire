import Foundation
import TSCBasic
import DashKit
import DashSupport

@main
@_documentation(visibility: private)
private enum FireApp {
    static func main() async throws {
        if CommandLine.arguments.contains("--verbose") {
            try? ProcessEnv.setVar(Constants.EnvironmentVariables.verbose, value: "true")
        }
    }
}