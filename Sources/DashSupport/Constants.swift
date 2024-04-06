import Foundation

public enum Constants {
    public static let versionFileName = ".dash-version"
    public static let binName = "dash"
    public static let version = "1.0.0"

    /// Pass these variables to make custom configuration of dash
    /// These variables are not supposed to be used by end users
    /// But only eg. for acceptance tests and other cases needed internally
    public enum EnvironmentVariables {
        public static let verbose = "Dash_CONFIG_VERBOSE"
    }
}