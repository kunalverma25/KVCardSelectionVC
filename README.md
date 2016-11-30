# KVCardSelectionVC
Awesome looking Dial like card selection ViewController

An updated Swift 3 working version of : https://github.com/atljeremy/JFCardSelectionViewController

What It Looks Like:
------------------

![Example](https://github.com/kunalverma25/KVCardSelectionVC/raw/master/KVVC2.gif)

How To Use It:
-------------

### Basic Example

First create a new class that subclasses `KVCardSelectionViewController`
```swift
import UIKit
import KVCardSelectionVC

class UserSelectionViewController: KVCardSelectionViewController {
    
    var cards: [User]? {
      didSet {
        // Call `reloadData()` once you are ready to display your `CardPresentable` data or when there have been changes to that data that need to be represented in the UI.
        reloadData()
      }
    }
    
    override func viewDidLoad() {
        
        // You can set a permanent background by setting a UIImage on the `backgroundImage` property. If not set, the `backgroundImage` will be set using the currently selected Card's `imageURLString`.
        // backgroundImage = UIImage(named: "bg")
        
        // Set the datasource so that `KVCardSelectionViewController` can get the CardPresentable data you want to dispaly
        dataSource = self
        
        // Set the delegate so that `KVCardSelectionViewController` can notify the `delegate` of events that take place on the focused CardPresentable.
        delegate = self
        
        // Set the desired `KVCardSelectionViewSelectionAnimationStyle` to either `.slide` or `.fade`. Defaults to `.fade`.
        selectionAnimationStyle = .slide
        
        // Call up to super after configuring your subclass of `KVCardSelectionViewController`. Calling super before configuring will cause undesirable side effects.
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        /*
        NOTE: If you are displaying an instance of `KVCardSelectionViewController` within a `UINavigationController`, you can use the code below to hide the navigation bar. This isn't required to use `KVCardSelectionViewController`, but `KVCardSelectionViewController` was designed to be used without a UINavigationBar.
        let image = UIImage()
        let navBar = navigationController?.navigationBar
        navBar?.setBackgroundImage(image, for: .default)
        navBar?.shadowImage = image
        */
        
        // Load your dynamic CardPresentable data
        cards = [
          User(name: "Jennifer Adams", photoURL: "https://s-media-cache-ak0.pinimg.com/736x/5d/43/0b/5d430bd15603971c939fcc9a4358a35f.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
          User(name: "Jim Adel", photoURL: "http://a3.files.blazepress.com/image/upload/c_fit,cs_srgb,dpr_1.0,q_80,w_620/MTI4OTkyOTM4OTM5MTYxMDU0.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
          User(name: "Jane Aden", photoURL: "https://s-media-cache-ak0.pinimg.com/236x/b7/65/2d/b7652d8c4cf40bc0b1ebac37bb254fcb.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
          User(name: "Avery Adil", photoURL: "http://boofos.com/wp-content/uploads/2013/02/Celebrity-Portraits-by-Andy-Gotts-10.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
          User(name: "Jamar Baar", photoURL: "https://s-media-cache-ak0.pinimg.com/736x/85/e3/8a/85e38ab9e480790e216c4f9359bb677f.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
          User(name: "Steven Babel", photoURL: "http://blog.picr.com/wp-content/uploads/2015/09/Andy-Gotts.jpeg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345)
        ]
    }
}
```

Second, conform to the `KVCardSelectionViewControllerDelegate` and `KVCardSelectionViewControllerDataSource` protocols so that you can provide the CardPresentable data to the `KVCardSelectionViewController` and to receive callbacks of touch events in the action buttons.
```swift
extension UserSelectionViewController: KVCardSelectionViewControllerDataSource {
    public func cardSelectionViewController(_ cardSelectionViewController: KVCardSelectionViewController, cardForItemAtIndexPath indexPath: IndexPath) -> CardPresentable {
        return cards[indexPath.row]
    }
    
    
    func numberOfCardsForCardSelectionViewController(_ cardSelectionViewController: KVCardSelectionViewController) -> Int {
        return cards.count
    }
    
}

extension UserSelectionViewController: KVCardSelectionViewControllerDelegate {
    
    func cardSelectionViewController(_ cardSelectionViewController: KVCardSelectionViewController, didSelectCardAction cardAction: CardAction, forCardAtIndexPath indexPath: IndexPath) {
        let card = cards[(indexPath as NSIndexPath).row]
        if let action = card.actionOne , action.title == cardAction.title {
            print("----------- \nCard action fired! \nAction Title: \(cardAction.title) \nIndex Path: \(indexPath)")
        }
        if let action = card.actionTwo , action.title == cardAction.title {
            print("----------- \nCard action fired! \nAction Title: \(cardAction.title) \nIndex Path: \(indexPath)")
        }
    }
    
    func cardSelectionViewController(_ cardSelectionViewController: KVCardSelectionViewController, didSelectDetailActionForCardAtIndexPath indexPath: IndexPath) {
        print("CARD SELECTED for \(indexPath)")
    }
}
```

Then, in the models you want to be presentable within the card selection view controller, just have them conform to the `CardPresentable` protocol.
```swift
struct User {
    var name: String
    var photoURL: String
    var address: String
    var city: String
    var state: String
    var zip: Int
}

extension User: CardPresentable {
    
    var imageURLString: String {
        return photoURL
    }
    
    var placeholderImage: UIImage? {
        return UIImage(named: "default")
    }
    
    var titleText: String {
        return name
    }
    
    var detailTextLineOne: String {
        return address
    }
    
    var detailTextLineTwo: String {
        return "\(city), \(state) \(zip)"
    }
    
    var actionOne: CardAction? {
        return CardAction(title: "Call")
    }
    
    var actionTwo: CardAction? {
        return CardAction(title: "Email")
    }
    
}
```

### Installation

#### CocoaPods
```
pod 'KVCardSelectionVC'
```

#### Example
Check Example Folder for the same.

#### Dependencies
KVCardSelectionVC has dependencies on pod 'Try' and pod 'Kingfisher'

Try is used for handling NSExceptions which swift cannot handle.

Kingfisher is used for Image downloading and cache.

The max size of cache is 50 Mb and cache expiry is one week.

#### Images Not Showing/Downloading
Quick Fix - Add Allow Arbitrary Loads to your project's Info.plist

License
-------
Distributed under the ```MIT``` license. See ```LICENSE``` for more information.
