
import UIKit

class FoldoutCollectionVC: UICollectionViewController {
    
    var cellSize:CGSize!
    var currentFolder:FoldoutCollectionFolderView?
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        registerCell()
        registerReusableViews()
        collectionView!.backgroundColor = UIColor.whiteColor()
        
        collectionView!.resize(toWidth: collectionView!.width - 10, toHeight: collectionView!.height - 10)
        put(collectionView!, inside: view, onThe: .Top, withPadding: 3);
    }
    
    func configureLayout() {
        guard let layout = self.collectionView?.collectionViewLayout as? RBCollectionViewInfoFolderLayout else {
            assert(false, "Instantiate with a RBCollectionViewInfoFolderLayout!!")
        }
        layout.cellSize = CGSizeMake(collectionView!.width/2 - 10, collectionView!.width/2 + 40)
        cellSize = layout.cellSize
        layout.stickyHeaders = true //TRY
    }
    
    func registerCell() {
        collectionView?.registerClass(FoldoutCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(FoldoutCollectionViewCell))
        registerReusableViews()
    }
    
    func registerReusableViews() {
        collectionView?.registerClass(FoldoutCollectionHeaderView.self, forSupplementaryViewOfKind: RBCollectionViewInfoFolderHeaderKind, withReuseIdentifier: NSStringFromClass(FoldoutCollectionHeaderView))
        collectionView?.registerClass(FoldoutCollectionFolderView.self, forSupplementaryViewOfKind: RBCollectionViewInfoFolderFolderKind, withReuseIdentifier: NSStringFromClass(FoldoutCollectionFolderView))
        collectionView?.registerClass(RBCollectionViewInfoFolderDimple.self, forSupplementaryViewOfKind: RBCollectionViewInfoFolderDimpleKind, withReuseIdentifier: NSStringFromClass(RBCollectionViewInfoFolderDimple))
        collectionView?.registerClass(FoldoutCollectionFooterView.self, forSupplementaryViewOfKind: RBCollectionViewInfoFolderFooterKind, withReuseIdentifier: NSStringFromClass(FoldoutCollectionFooterView))
        
        
    }
    

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(NSStringFromClass(FoldoutCollectionViewCell), forIndexPath: indexPath) as! FoldoutCollectionViewCell
        cell.product = Product()
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let layout = (self.collectionView?.collectionViewLayout as! RBCollectionViewInfoFolderLayout)
        layout.toggleFolderViewForIndexPath(indexPath)
        if let folder = currentFolder {
            folder.expanded = !folder.expanded
        }
    }
    
    
    
    
    
    
}

extension FoldoutCollectionVC {
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        //header, folder, dimple.
        var reusableView:UICollectionReusableView!
        switch kind {
        case RBCollectionViewInfoFolderHeaderKind:
            reusableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: NSStringFromClass(FoldoutCollectionHeaderView), forIndexPath: indexPath)
        case RBCollectionViewInfoFolderFolderKind:
            reusableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: NSStringFromClass(FoldoutCollectionFolderView), forIndexPath: indexPath)
            reusableView.backgroundColor = UIColor.whiteColor()
            reusableView.shift(toRight: 0, toBottom: -20)
            currentFolder = reusableView as! FoldoutCollectionFolderView
        case RBCollectionViewInfoFolderDimpleKind:
            let dimple = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: NSStringFromClass(RBCollectionViewInfoFolderDimple), forIndexPath: indexPath) as! RBCollectionViewInfoFolderDimple
            dimple.color = UIColor.lightGrayColor()
            reusableView = dimple
            
        case RBCollectionViewInfoFolderFooterKind:
            reusableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: NSStringFromClass(FoldoutCollectionFooterView), forIndexPath: indexPath)
        default:
            assert(false, "Unknown reusable view kind! \(kind)")
        }
        return reusableView
    }
    
}

extension FoldoutCollectionVC: RBCollectionViewInfoFolderLayoutDelegate {
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: RBCollectionViewInfoFolderLayout!, heightForFolderAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        //
        
        return cellSize.height
    }
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: RBCollectionViewInfoFolderLayout!, sizeForFooterInSection section: Int) -> CGSize {
        //
        return CGSizeMake(0, 0)
    }
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: RBCollectionViewInfoFolderLayout!, sizeForHeaderInSection section: Int) -> CGSize {
        //
        return CGSizeMake(0, 0)
    }
    
    
    
    
}

extension FoldoutCollectionVC: FoldoutCollectionFolderViewDelegate {
    func folderViewDidSelect(folder: FoldoutCollectionFolderView, product: Product) {
        //TODO: push
    }
}













