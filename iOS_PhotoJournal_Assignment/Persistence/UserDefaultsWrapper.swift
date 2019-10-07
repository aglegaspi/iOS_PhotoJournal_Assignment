import Foundation

class UserDefaultsWrapper {
    
    // MARK: - Static Properties
    static let manager = UserDefaultsWrapper()
    
    // MARK: - Internal Methods
    func store(scrollDirection: Bool) {
        UserDefaults.standard.set(scrollDirection, forKey: scrollDirectionKey)
    }
    
    func store(darkMode: Bool) {
        UserDefaults.standard.set(darkMode, forKey: darkModeKey)
    }
    
    func getScrollSetting() -> Bool? {
        return UserDefaults.standard.value(forKey: scrollDirectionKey) as? Bool
    }
    
    func getDarkModeSetting() -> Bool? {
        return UserDefaults.standard.value(forKey: darkModeKey) as? Bool
    }
    
    
    // MARK: - Private inits and properties
    private init() {}
    private let scrollDirectionKey = "scrollDirection"
    private let darkModeKey = "darkModeKey"
}

