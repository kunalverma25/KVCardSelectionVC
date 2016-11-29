/*
 * KVCardSelectionCell
 *
 * Created by Kunal Verma on 29/11/16.
 * Copyright (c) 2016 Kunal Verma. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

import UIKit
import Kingfisher
import Try

class KVCardSelectionCell: UICollectionViewCell {
    
    static let reuseIdentifier = "KVCardSelectionCell"
    var obs = false
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    fileprivate weak var scrollView: UIScrollView!
    var card: CardPresentable?
    fileprivate var rotation: CGFloat {
        guard let _scrollView = scrollView else { return 0 }
        guard let _superView = _scrollView.superview else { return 0 }
        let position = _superView.convert(self.center, from: scrollView)
        let superViewCenterX = _superView.frame.midX
        return ((position.x - superViewCenterX) / superViewCenterX) / 1.3
    }
    fileprivate var centerY: CGFloat {
        let height = scrollView.frame.height
        var y = rotation
        if rotation < 0.0 {
            y *= -1
            y *= (rotation * -1)
        } else {
            y *= rotation
        }
        return ((y * height) / 1.8) + (height / 2.5)
    }
    
    deinit {
        if obs {
        do {
            try trap {
                self.scrollView.removeObserver(self, forKeyPath: "contentOffset")
                self.obs = false
            }
        } catch let error as NSError {
            print("EX caught")
        }
    }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        if obs {
        do {
            try trap {
                self.scrollView.removeObserver(self, forKeyPath: "contentOffset")
                self.obs = false
            }
        } catch let error as NSError {
            print("EX caught")
        }
        }
        if let _imageURLString = card?.imageURLString {
            imageView.cancelImageLoadForImageURL(_imageURLString)
        }
        imageView.image = nil
        label.text = nil
    }
    
    func configureForCard(_ card: CardPresentable, inScrollView scrollView: UIScrollView) {
        
        self.card = card
        self.scrollView = scrollView
        self.scrollView.addObserver(self, forKeyPath: "contentOffset", options: .new, context: nil)
        obs = true
        
        imageView.loadImageAtURL(card.imageURLString, withDefaultImage: card.placeholderImage)
        
        self.transform = CGAffineTransform(rotationAngle: rotation)
        center.y = centerY
        
        label.attributedText = NSAttributedString(string: card.titleText, attributes: ShadowAttributes.forLabelSoft)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        //        if (card?.titleText ?? "") == "Avery Smith" {
        self.transform = CGAffineTransform(rotationAngle: rotation)
        center.y = centerY
        //        }
    }
    
}

public extension UIImageView {
    
    public func loadImageAtURL(_ imageURL: String, withDefaultImage defaultImage: UIImage?) {
        loadImageAtURL(imageURL, withDefaultImage: defaultImage, completion: nil)
    }
    
    public func loadImageAtURL(_ imageURL: String, withDefaultImage defaultImage: UIImage?, completion: (() -> Void)?) {
        print("LICalled")
        
        ImageCache.default.maxDiskCacheSize = 50 * 1024 * 1024
        
        guard let url = URL(string: imageURL) else {
            return
        }
        
        self.kf.indicatorType = .activity
        if defaultImage != nil {
        self.kf.setImage(with: url, placeholder: defaultImage)
        }
        else {
            self.kf.setImage(with: url)
        }
    }
    
    public func cancelImageLoadForImageURL(_ imageURL: String) {
        self.kf.cancelDownloadTask()
    }
    
}


