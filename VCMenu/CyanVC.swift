
import UIKit

class CyanVC: UIViewController {


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

enum UserType {
  case Buyer
  case Seller
  case Maker
}

class ProductDetailViewController: UITableViewController {
  var product: Product
  var userType: UserType
  var productImageView:UIImageView!
  var productTitleLabel: UILabel!
  var productDescription: UITextField!
  var actionButton: UIButton!
  var buttonAction: (() -> ())
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    performSegueWithIdentifier("ProductDetailViewController", sender: nil)
    let detailVC = ProductDetailViewController(product: Product(), userType: UserType.Buyer) {
      
    }
    
  }
  
  func titleLabel() -> UILabel {
    return UILabel()
  }
  
  init(product: Product, userType: UserType, buttonAction: () -> ()) {
    self.product = product
    self.userType = userType
    self.buttonAction = buttonAction
    super.init(nibName: nil, bundle: nil)
    setupViews()
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    put(productTitleLabel, inside: view, onThe: .Top, withPadding: 44)
    put(productImageView, inside: view, onThe: .Middle, withPadding: 0)
    put(productDescription, inside: view, onThe: .Bottom, withPadding: 22)
    put(actionButton, atThe: .Right, of: view, withSpacing: 15)
    buttonAction()
  }
  
  
  //...
}