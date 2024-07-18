import Foundation

public enum Constants {
    public static let versionFileName = ".fire-version"
    public static let binName = "fire"
    public static let version = "1.0.0"

    /// Pass these variables to make custom configuration of fire
    /// These variables are not supposed to be used by end users
    /// But only eg. for acceptance tests and other cases needed internally
    public enum EnvironmentVariables {
        public static let verbose = "FIRE_CONFIG_VERBOSE"
    }
}