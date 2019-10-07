import UIKit

class SettingsViewController: UIViewController {
    

    @IBOutlet weak var scrollSwitch: UISwitch!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let switched = UserDefaultsWrapper.manager.getScrollSetting() {
            scrollSwitch.isOn = switched
        }
        
        if let mode = UserDefaultsWrapper.manager.getDarkModeSetting() {
            darkModeSwitch.isOn = mode
            darkModeSettings()
        }
        
        
        
    }


    @IBAction func scrollSwitchPressed(_ sender: UISwitch) {
            UserDefaultsWrapper.manager.store(scrollDirection: sender.isOn)
    }
    
    @IBAction func darkModeSwitchPressed(_ sender: UISwitch) {
            UserDefaultsWrapper.manager.store(darkMode: sender.isOn)
        darkModeSettings()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    private func darkModeSettings() {
        let mode = UserDefaultsWrapper.manager.getDarkModeSetting() ?? false
        
        switch mode {
        case true:
            self.view.backgroundColor = .black
            
            print("dark mode is ON")
        default:
            self.view.backgroundColor = .yellow
            print("dark mode is OFF")
        }
    }
}
