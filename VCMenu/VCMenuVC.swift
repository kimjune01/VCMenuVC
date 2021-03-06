
import UIKit

class VCMenuVC: UITableViewController {
  
  var viewControllersOnTheMenu:[UIViewController]{
    return [
      GrayVC(),
      ClearVC(),
      WhiteVC(),
      YellowVC(),
      GreenVC(),
      RedVC(),
      FoldoutCollectionVC(collectionViewLayout: RBCollectionViewInfoFolderLayout()),
      CyanVC(),
      
    ]
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addTableView()
    tableView.registerClass(KabuniTableCell.self, forCellReuseIdentifier: "KabuniTableCell")
  }
  
  
  func addTableView() {
    tableView.frame = view.bounds
    tableView.backgroundColor = UIColor.lightGrayColor()
  }
  
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

extension VCMenuVC {
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    if let navVC = navigationController {
      navVC.pushViewController(viewControllersOnTheMenu[indexPath.row], animated: true)
    } else {
      presentViewController(viewControllersOnTheMenu[indexPath.row], animated: true, completion: { () -> Void in
        //
      })
    }
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewControllersOnTheMenu.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("KabuniTableCell", forIndexPath: indexPath)
    cell.textLabel?.text = viewControllersOnTheMenu[indexPath.row].name()
    return cell
  }
}


extension UIViewController {
  func name() -> String {
    return  NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last!
  }
}
