
import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys : String {
        case hasOnborded
    }
    
    var hasOnborded: Bool {
        get {
            bool(forKey: UserDefaultsKeys.hasOnborded.rawValue)
        }
        set {
            setValue(newValue, forKey: UserDefaultsKeys.hasOnborded.rawValue)
        }
    }
}
