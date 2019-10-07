import Foundation

class UserDefaultsWrapper {
    
    // MARK: - Static Properties
    static let manager = UserDefaultsWrapper()
    
    // MARK: - Internal Methods
    func store(scrollDirection: String) {
        UserDefaults.standard.set(scrollDirection, forKey: scrollDirectionKey)
    }
    
    func getSunSign() -> String? {
        return UserDefaults.standard.value(forKey: scrollDirectionKey) as? String
    }
    
    // MARK: - Private inits and properties
    private init() {}
    private let scrollDirectionKey = "scrollDirection"
}
