import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scrollSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func scrollSwitchPressed(_ sender: UISwitch) {
        
        switch sender.isOn {
        case true:
            print("true")
        case false:
            print("false")
        }
    }
}
