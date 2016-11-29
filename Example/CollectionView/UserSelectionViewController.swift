//
//  ViewController.swift
//  KVCardSelectionVC
//
//  Created by Kunal Verma on 29/11/16.
//  Copyright © 2016 Videocon. All rights reserved.
//

import UIKit
import KVCardSelectionVC

class UserSelectionViewController: KVCardSelectionViewController {
    
    override func viewDidLoad() {
        
        // You can set a permanent background by setting a UIImage on the `backgroundImage` property. If not set, the `backgroundImage` will be set using the currently selected Card's `imageURLString`.
        // backgroundImage = UIImage(named: "bg")
        
        // Set the datasource so that `JFCardSelectionViewController` can get the CardPresentable data you want to dispaly
        dataSource = self
        
        // Set the delegate so that `JFCardSelectionViewController` can notify the `delegate` of events that take place on the focused CardPresentable.
        delegate = self
        
        // Set the desired `JFCardSelectionViewSelectionAnimationStyle` to either `.Slide` or `.Fade`. Defaults to `.Fade`.
        selectionAnimationStyle = .slide
        
        // Call up to super after configuring your subclass of `JFCardSelectionViewController`. Calling super before configuring will cause undesirable side effects.
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /*
         NOTE: If you are displaying an instance of `JFCardSelectionViewController` within a `UINavigationController`, you can use the code below to hide the navigation bar. This isn't required to use `JFCardSelectionViewController` and you can display with navigation bar is you'd like. If you are not embedding it within a navigation controller then this code isn't needed.
         */
        let image = UIImage()
        let navBar = navigationController?.navigationBar
        navBar?.setBackgroundImage(image, for: .default)
        navBar?.shadowImage = image
        
        // Call `reloadData()` once you are ready to display your `CardPresentable` data or when there have been changes to that data that need to be represented in the UI.
        reloadData()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        if segue.identifier == "ShowUserDetailVC" {
//            guard let indexPath = sender as? IndexPath else { return }
//            let user = cards[(indexPath as NSIndexPath).row]
//            let userDetailVC = segue.destination as? UserDetailViewController
//            userDetailVC?.user = user
//        }
//    }
    
}

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
        performSegue(withIdentifier: "ShowUserDetailVC", sender: indexPath)
    }
    
}

// Mock Data
extension UserSelectionViewController {
    var cards: [User] {
        return [
            User(name: "Jennifer Adams", photoURL: "https://s-media-cache-ak0.pinimg.com/736x/5d/43/0b/5d430bd15603971c939fcc9a4358a35f.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jim Adel", photoURL: "http://a3.files.blazepress.com/image/upload/c_fit,cs_srgb,dpr_1.0,q_80,w_620/MTI4OTkyOTM4OTM5MTYxMDU0.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jane Aden", photoURL: "https://s-media-cache-ak0.pinimg.com/236x/b7/65/2d/b7652d8c4cf40bc0b1ebac37bb254fcb.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Avery Adil", photoURL: "http://boofos.com/wp-content/uploads/2013/02/Celebrity-Portraits-by-Andy-Gotts-10.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jamar Baar", photoURL: "https://s-media-cache-ak0.pinimg.com/736x/85/e3/8a/85e38ab9e480790e216c4f9359bb677f.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Steven Babel", photoURL: "http://blog.picr.com/wp-content/uploads/2015/09/Andy-Gotts.jpeg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Dude Backman", photoURL: "http://boofos.com/wp-content/uploads/2013/02/Celebrity-Portraits-by-Andy-Gotts-02.jpg", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "John Bair", photoURL: "http://cdn.playbuzz.com/cdn/cf0421b5-9d12-4a9e-b7be-94e8b6a9113d/c6817fa1-322d-4d54-b17d-2b741ee3d423.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jim Ballow", photoURL: "http://www.frontlineactors.com/wp-content/uploads/2015/04/Tom-Moran-Headshot-1-2016-400x595.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jane Bally", photoURL: "http://cdn5.thr.com/sites/default/files/imagecache/NFE_portrait/2011/11/torrey_devitto_a_p_0.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Avery Bane", photoURL: "http://images.bwwstatic.com/upload10/461245/campbell.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jamar Barney", photoURL: "https://s-media-cache-ak0.pinimg.com/736x/29/80/94/298094c2d1dbf6267d5e61d741b902c2.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Charlette Bartin", photoURL: "https://s-media-cache-ak0.pinimg.com/236x/33/ee/7b/33ee7b6f7fd799bf8ddbbcc1a07eccf4.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Dude Bartlett", photoURL: "http://cartermatt.com/wp-content/uploads/2013/09/Damon-e1379604167617-300x247.jpg", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "John Barts", photoURL: "http://2.bp.blogspot.com/--1GQY4HZyfw/TnCjX0gzI5I/AAAAAAAAANA/ylJtorLIKLk/s1600/matt.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jammey Bate", photoURL: "http://vampirediaries.com/wp-content/blogs.dir/6/files/happy-birthday-bianca-lawson/bianca-lawson-actress.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jane Cagan", photoURL: "http://cdn5.thr.com/sites/default/files/imagecache/NFE_portrait/2011/10/shonda_rhimes_headshot_a_p.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Avery Cage", photoURL: "http://cdn5.thr.com/sites/default/files/imagecache/NFE_portrait/2012/09/mckayla_maroney_headshot_a_p.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jamar Cain", photoURL: "http://cdn1.thr.com/sites/default/files/imagecache/NFE_portrait/2012/02/spt_headshot.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Stepheney Cake", photoURL: "http://cdn2.thr.com/sites/default/files/imagecache/NFE_portrait/2014/07/emily_c_chang_a_p.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Dude Calaway", photoURL: "http://1.bp.blogspot.com/-TkNaJAXkKB0/TmWr8fMUueI/AAAAAAAANXE/3Dk_ZmabyRs/s1600/dillon+casey+nikita+headshot.jpg", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "John Cali", photoURL: "https://s-media-cache-ak0.pinimg.com/236x/93/cf/ae/93cfae9c375d2d7348447e73ee6fe3b9.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jessalyn Call", photoURL: "http://cdn1.thr.com/sites/default/files/imagecache/NFE_portrait/2012/06/jessalyn_gilsig.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jane Callen", photoURL: "https://s-media-cache-ak0.pinimg.com/736x/6e/b4/32/6eb43227d94cbbf03079b8601d89dc14.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Johnny Callez", photoURL: "http://images.castcall.blue-compass.com.s3.amazonaws.com/portfolioraw/747/747106.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jamar Callum", photoURL: "http://images.castcall.blue-compass.com.s3.amazonaws.com/portfolioraw/788/788386.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Dude Campa", photoURL: "https://40.media.tumblr.com/59581b4791b9d1230bd83f20d3861e85/tumblr_n3w0n8Bx581sp55uyo1_500.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Steven Candill", photoURL: "https://scontent.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/12747727_472984076221633_482391970_n.jpg?ig_cache_key=MTE4Mzg2NDQzODA2ODY5ODk4NQ%3D%3D.2.l", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "John Caney", photoURL: "http://img3.wikia.nocookie.net/__cb20130405201950/vikingstv/images/0/04/Gustaf_Skarsgard.png", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jim Cantey", photoURL: "http://www.frontlineactors.com/wp-content/uploads/2015/04/Tom-Moran-Headshot-1-2016-400x595.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jane Caplin", photoURL: "https://s-media-cache-ak0.pinimg.com/564x/cf/88/27/cf88277f4f06ac30905f79c6e47423c4.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Avery Fabel", photoURL: "http://ia.media-imdb.com/images/M/MV5BMTM2NjQ0NTU3Ml5BMl5BanBnXkFtZTcwNTExMDIyOQ@@._V1._SX454_SY591_.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jamar Fabry", photoURL: "http://cdn5.thr.com/sites/default/files/imagecache/portrait_300x450/2014/05/steven_yeun_headshot_a_p.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Dude Fagen", photoURL: "https://40.media.tumblr.com/59581b4791b9d1230bd83f20d3861e85/tumblr_n3w0n8Bx581sp55uyo1_500.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Steven Fain", photoURL: "http://static.celebuzz.com/uploads/2012/09/30/65902.jpg", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "John Fair", photoURL: "http://www2.pictures.zimbio.com/gi/Clive+Standen+Vikings+Press+Line+Comic+Con+MXIgk-ddMM5l.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jim Faley", photoURL: "http://www.frontlineactors.com/wp-content/uploads/2015/04/Tom-Moran-Headshot-1-2016-400x595.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jane Falls", photoURL: "https://s-media-cache-ak0.pinimg.com/564x/cf/88/27/cf88277f4f06ac30905f79c6e47423c4.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Avery Farag", photoURL: "http://ia.media-imdb.com/images/M/MV5BMTM2NjQ0NTU3Ml5BMl5BanBnXkFtZTcwNTExMDIyOQ@@._V1._SX454_SY591_.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jamar Farrier", photoURL: "http://cdn5.thr.com/sites/default/files/imagecache/portrait_300x450/2014/05/steven_yeun_headshot_a_p.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Dude Fata", photoURL: "https://40.media.tumblr.com/59581b4791b9d1230bd83f20d3861e85/tumblr_n3w0n8Bx581sp55uyo1_500.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Steven Faul", photoURL: "http://static.celebuzz.com/uploads/2012/09/30/65902.jpg", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "John Fausett", photoURL: "http://www2.pictures.zimbio.com/gi/Clive+Standen+Vikings+Press+Line+Comic+Con+MXIgk-ddMM5l.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jim Fay", photoURL: "http://www.frontlineactors.com/wp-content/uploads/2015/04/Tom-Moran-Headshot-1-2016-400x595.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jane Finell", photoURL: "https://s-media-cache-ak0.pinimg.com/564x/cf/88/27/cf88277f4f06ac30905f79c6e47423c4.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Avery Flom", photoURL: "http://ia.media-imdb.com/images/M/MV5BMTM2NjQ0NTU3Ml5BMl5BanBnXkFtZTcwNTExMDIyOQ@@._V1._SX454_SY591_.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jamar Form", photoURL: "http://cdn5.thr.com/sites/default/files/imagecache/portrait_300x450/2014/05/steven_yeun_headshot_a_p.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Dude Fox", photoURL: "https://40.media.tumblr.com/59581b4791b9d1230bd83f20d3861e85/tumblr_n3w0n8Bx581sp55uyo1_500.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Steven Frees", photoURL: "http://static.celebuzz.com/uploads/2012/09/30/65902.jpg", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "John Jack", photoURL: "http://www2.pictures.zimbio.com/gi/Clive+Standen+Vikings+Press+Line+Comic+Con+MXIgk-ddMM5l.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jim Jain", photoURL: "http://www.frontlineactors.com/wp-content/uploads/2015/04/Tom-Moran-Headshot-1-2016-400x595.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jane Janey", photoURL: "https://s-media-cache-ak0.pinimg.com/564x/cf/88/27/cf88277f4f06ac30905f79c6e47423c4.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Avery Kadi", photoURL: "http://ia.media-imdb.com/images/M/MV5BMTM2NjQ0NTU3Ml5BMl5BanBnXkFtZTcwNTExMDIyOQ@@._V1._SX454_SY591_.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jamar Kaeo", photoURL: "http://cdn5.thr.com/sites/default/files/imagecache/portrait_300x450/2014/05/steven_yeun_headshot_a_p.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Dude Kahn", photoURL: "https://40.media.tumblr.com/59581b4791b9d1230bd83f20d3861e85/tumblr_n3w0n8Bx581sp55uyo1_500.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Steven Kain", photoURL: "http://static.celebuzz.com/uploads/2012/09/30/65902.jpg", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "John Kelter", photoURL: "http://www2.pictures.zimbio.com/gi/Clive+Standen+Vikings+Press+Line+Comic+Con+MXIgk-ddMM5l.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jim Ker", photoURL: "http://www.frontlineactors.com/wp-content/uploads/2015/04/Tom-Moran-Headshot-1-2016-400x595.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jane Kester", photoURL: "https://s-media-cache-ak0.pinimg.com/564x/cf/88/27/cf88277f4f06ac30905f79c6e47423c4.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Avery Kher", photoURL: "http://ia.media-imdb.com/images/M/MV5BMTM2NjQ0NTU3Ml5BMl5BanBnXkFtZTcwNTExMDIyOQ@@._V1._SX454_SY591_.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jamar Mace", photoURL: "http://cdn5.thr.com/sites/default/files/imagecache/portrait_300x450/2014/05/steven_yeun_headshot_a_p.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Dude Maga", photoURL: "https://40.media.tumblr.com/59581b4791b9d1230bd83f20d3861e85/tumblr_n3w0n8Bx581sp55uyo1_500.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Steven Majmundar", photoURL: "http://static.celebuzz.com/uploads/2012/09/30/65902.jpg", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "John Maliska", photoURL: "http://www2.pictures.zimbio.com/gi/Clive+Standen+Vikings+Press+Line+Comic+Con+MXIgk-ddMM5l.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jim Manin", photoURL: "http://www.frontlineactors.com/wp-content/uploads/2015/04/Tom-Moran-Headshot-1-2016-400x595.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jane Manis", photoURL: "https://s-media-cache-ak0.pinimg.com/564x/cf/88/27/cf88277f4f06ac30905f79c6e47423c4.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Avery Mano", photoURL: "http://ia.media-imdb.com/images/M/MV5BMTM2NjQ0NTU3Ml5BMl5BanBnXkFtZTcwNTExMDIyOQ@@._V1._SX454_SY591_.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jamar McDay", photoURL: "http://cdn5.thr.com/sites/default/files/imagecache/portrait_300x450/2014/05/steven_yeun_headshot_a_p.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Dude McGathy", photoURL: "https://40.media.tumblr.com/59581b4791b9d1230bd83f20d3861e85/tumblr_n3w0n8Bx581sp55uyo1_500.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Steven Meiser", photoURL: "http://static.celebuzz.com/uploads/2012/09/30/65902.jpg", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "John Meitz", photoURL: "http://www2.pictures.zimbio.com/gi/Clive+Standen+Vikings+Press+Line+Comic+Con+MXIgk-ddMM5l.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jim Meja", photoURL: "http://www.frontlineactors.com/wp-content/uploads/2015/04/Tom-Moran-Headshot-1-2016-400x595.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jane Mekee", photoURL: "https://s-media-cache-ak0.pinimg.com/564x/cf/88/27/cf88277f4f06ac30905f79c6e47423c4.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Avery Mena", photoURL: "http://ia.media-imdb.com/images/M/MV5BMTM2NjQ0NTU3Ml5BMl5BanBnXkFtZTcwNTExMDIyOQ@@._V1._SX454_SY591_.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jamar Menor", photoURL: "http://cdn5.thr.com/sites/default/files/imagecache/portrait_300x450/2014/05/steven_yeun_headshot_a_p.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Dude Meysembourg", photoURL: "https://40.media.tumblr.com/59581b4791b9d1230bd83f20d3861e85/tumblr_n3w0n8Bx581sp55uyo1_500.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Steven Mier", photoURL: "http://static.celebuzz.com/uploads/2012/09/30/65902.jpg", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "John Paik", photoURL: "http://www2.pictures.zimbio.com/gi/Clive+Standen+Vikings+Press+Line+Comic+Con+MXIgk-ddMM5l.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jim Painter", photoURL: "http://www.frontlineactors.com/wp-content/uploads/2015/04/Tom-Moran-Headshot-1-2016-400x595.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jane Palitti", photoURL: "https://s-media-cache-ak0.pinimg.com/564x/cf/88/27/cf88277f4f06ac30905f79c6e47423c4.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Avery Pannenbacker", photoURL: "http://ia.media-imdb.com/images/M/MV5BMTM2NjQ0NTU3Ml5BMl5BanBnXkFtZTcwNTExMDIyOQ@@._V1._SX454_SY591_.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jamar Paramore", photoURL: "http://cdn5.thr.com/sites/default/files/imagecache/portrait_300x450/2014/05/steven_yeun_headshot_a_p.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Dude Parkhill", photoURL: "https://40.media.tumblr.com/59581b4791b9d1230bd83f20d3861e85/tumblr_n3w0n8Bx581sp55uyo1_500.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Steven Parson", photoURL: "http://static.celebuzz.com/uploads/2012/09/30/65902.jpg", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "John Penegar", photoURL: "http://www2.pictures.zimbio.com/gi/Clive+Standen+Vikings+Press+Line+Comic+Con+MXIgk-ddMM5l.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jim Penaha", photoURL: "http://www.frontlineactors.com/wp-content/uploads/2015/04/Tom-Moran-Headshot-1-2016-400x595.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jane Penick", photoURL: "https://s-media-cache-ak0.pinimg.com/564x/cf/88/27/cf88277f4f06ac30905f79c6e47423c4.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Avery Peralez", photoURL: "http://ia.media-imdb.com/images/M/MV5BMTM2NjQ0NTU3Ml5BMl5BanBnXkFtZTcwNTExMDIyOQ@@._V1._SX454_SY591_.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jamar Pernice", photoURL: "http://cdn5.thr.com/sites/default/files/imagecache/portrait_300x450/2014/05/steven_yeun_headshot_a_p.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Dude Radder", photoURL: "https://40.media.tumblr.com/59581b4791b9d1230bd83f20d3861e85/tumblr_n3w0n8Bx581sp55uyo1_500.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Steven Radeke", photoURL: "http://static.celebuzz.com/uploads/2012/09/30/65902.jpg", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "John Raden", photoURL: "http://www2.pictures.zimbio.com/gi/Clive+Standen+Vikings+Press+Line+Comic+Con+MXIgk-ddMM5l.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jim Ragas", photoURL: "http://www.frontlineactors.com/wp-content/uploads/2015/04/Tom-Moran-Headshot-1-2016-400x595.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jane Rake", photoURL: "https://s-media-cache-ak0.pinimg.com/564x/cf/88/27/cf88277f4f06ac30905f79c6e47423c4.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Avery Rams", photoURL: "http://ia.media-imdb.com/images/M/MV5BMTM2NjQ0NTU3Ml5BMl5BanBnXkFtZTcwNTExMDIyOQ@@._V1._SX454_SY591_.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jamar Ranweiler", photoURL: "http://cdn5.thr.com/sites/default/files/imagecache/portrait_300x450/2014/05/steven_yeun_headshot_a_p.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Dude Rappenecker", photoURL: "https://40.media.tumblr.com/59581b4791b9d1230bd83f20d3861e85/tumblr_n3w0n8Bx581sp55uyo1_500.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Steven Rathbone", photoURL: "http://static.celebuzz.com/uploads/2012/09/30/65902.jpg", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "John Raven", photoURL: "http://www2.pictures.zimbio.com/gi/Clive+Standen+Vikings+Press+Line+Comic+Con+MXIgk-ddMM5l.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jim Reagle", photoURL: "http://www.frontlineactors.com/wp-content/uploads/2015/04/Tom-Moran-Headshot-1-2016-400x595.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jane Redditt", photoURL: "https://s-media-cache-ak0.pinimg.com/564x/cf/88/27/cf88277f4f06ac30905f79c6e47423c4.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Avery Rehder", photoURL: "http://ia.media-imdb.com/images/M/MV5BMTM2NjQ0NTU3Ml5BMl5BanBnXkFtZTcwNTExMDIyOQ@@._V1._SX454_SY591_.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jamar Reist", photoURL: "http://cdn5.thr.com/sites/default/files/imagecache/portrait_300x450/2014/05/steven_yeun_headshot_a_p.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Dude Riley", photoURL: "https://40.media.tumblr.com/59581b4791b9d1230bd83f20d3861e85/tumblr_n3w0n8Bx581sp55uyo1_500.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Steven Sachs", photoURL: "http://static.celebuzz.com/uploads/2012/09/30/65902.jpg", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "John Sake", photoURL: "http://www2.pictures.zimbio.com/gi/Clive+Standen+Vikings+Press+Line+Comic+Con+MXIgk-ddMM5l.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jim Salisbury", photoURL: "http://www.frontlineactors.com/wp-content/uploads/2015/04/Tom-Moran-Headshot-1-2016-400x595.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jane Salvia", photoURL: "https://s-media-cache-ak0.pinimg.com/564x/cf/88/27/cf88277f4f06ac30905f79c6e47423c4.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Avery Samway", photoURL: "http://ia.media-imdb.com/images/M/MV5BMTM2NjQ0NTU3Ml5BMl5BanBnXkFtZTcwNTExMDIyOQ@@._V1._SX454_SY591_.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jamar Sands", photoURL: "http://cdn5.thr.com/sites/default/files/imagecache/portrait_300x450/2014/05/steven_yeun_headshot_a_p.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Dude Santander", photoURL: "https://40.media.tumblr.com/59581b4791b9d1230bd83f20d3861e85/tumblr_n3w0n8Bx581sp55uyo1_500.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Steven Schink", photoURL: "http://static.celebuzz.com/uploads/2012/09/30/65902.jpg", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "John Schum", photoURL: "http://www2.pictures.zimbio.com/gi/Clive+Standen+Vikings+Press+Line+Comic+Con+MXIgk-ddMM5l.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jim Tango", photoURL: "http://www.frontlineactors.com/wp-content/uploads/2015/04/Tom-Moran-Headshot-1-2016-400x595.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jane Tatge", photoURL: "https://s-media-cache-ak0.pinimg.com/564x/cf/88/27/cf88277f4f06ac30905f79c6e47423c4.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Avery Teran", photoURL: "http://ia.media-imdb.com/images/M/MV5BMTM2NjQ0NTU3Ml5BMl5BanBnXkFtZTcwNTExMDIyOQ@@._V1._SX454_SY591_.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jamar Valerie", photoURL: "http://cdn5.thr.com/sites/default/files/imagecache/portrait_300x450/2014/05/steven_yeun_headshot_a_p.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Dude Vero", photoURL: "https://40.media.tumblr.com/59581b4791b9d1230bd83f20d3861e85/tumblr_n3w0n8Bx581sp55uyo1_500.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Steven Vicini", photoURL: "http://static.celebuzz.com/uploads/2012/09/30/65902.jpg", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "John Wary", photoURL: "http://www2.pictures.zimbio.com/gi/Clive+Standen+Vikings+Press+Line+Comic+Con+MXIgk-ddMM5l.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jim Washabaugh", photoURL: "http://www.frontlineactors.com/wp-content/uploads/2015/04/Tom-Moran-Headshot-1-2016-400x595.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jane Westen", photoURL: "https://s-media-cache-ak0.pinimg.com/564x/cf/88/27/cf88277f4f06ac30905f79c6e47423c4.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Avery Widney", photoURL: "http://ia.media-imdb.com/images/M/MV5BMTM2NjQ0NTU3Ml5BMl5BanBnXkFtZTcwNTExMDIyOQ@@._V1._SX454_SY591_.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Jamar Younger", photoURL: "http://cdn5.thr.com/sites/default/files/imagecache/portrait_300x450/2014/05/steven_yeun_headshot_a_p.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Dude Zahner", photoURL: "https://40.media.tumblr.com/59581b4791b9d1230bd83f20d3861e85/tumblr_n3w0n8Bx581sp55uyo1_500.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
            User(name: "Steven Zeilder", photoURL: "http://static.celebuzz.com/uploads/2012/09/30/65902.jpg", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345)
        ]
    }
}


//----------------


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
        return nil
    }
    
    var titleText: String {
        return name
    }
    
    var dialLabel: String {
        guard let lastString = titleText.components(separatedBy: " ").last else { return "" }
        return String(lastString[lastString.startIndex])
    }
    
    var detailTextLineOne: String {
        return address
    }
    
    var detailTextLineTwo: String {
        return "\(city), \(state) \(zip)"
    }
    
    var actionOne: CardAction? {
        return CardAction(title: "View")
    }
    
    var actionTwo: CardAction? {
        return CardAction(title: "Dont")
    }
    
}

