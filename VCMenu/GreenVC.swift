
import UIKit

class GreenVC: UIViewController {

    let tower = TowerView(
        width: screenWidth * 0.85,
        height: screenHeight * 0.7)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.3)
        
        tower.position = .Bottom
        tower.rows = [
            addWideButton("Bathroom", imageName: "bathroom"),
            addWideButton("Bedroom", imageName: "bedroom"),
        ]
        put(tower,
            inside: view,
            onThe: .Bottom,
            withPadding: navigationBarHeight() + statusBarHeight)
        
        view.debugColors()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tower.show()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        tower.hide()
    }
    
    func addWideButton(text:String, imageName:String) -> UIButton {
        let button = WideButton(
            buttonText: text,
            icon: UIImage(named: imageName))
        let selectorName = Selector(stringLiteral: text + "ButtonTapped")
        button.addTarget(self,
            action: selectorName,
            forControlEvents: .TouchUpInside)
        return button
    }
    
    func BathroomButtonTapped() {
        print("bathroomButtonTapped()")
        tower.hide()
    }

    func BedroomButtonTapped() {
        print("bedroomButtonTapped()")
        tower.show()
    }
    

}
