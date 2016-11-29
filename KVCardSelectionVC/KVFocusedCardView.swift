/*
 * KVFocusedCardView
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

protocol KVFocusedCardViewDelegate {
    func focusedCardViewDidSelectDetailAction(_ focusedCardView: KVFocusedCardView) -> Void
    func focusedCardViewDidSelectActionItemOne(_ focusedCardView: KVFocusedCardView) -> Void
    func focusedCardViewDidSelectActionItemTwo(_ focusedCardView: KVFocusedCardView) -> Void
}

class KVFocusedCardView: UIView {

    var card: CardPresentable!
    var delegate: KVFocusedCardViewDelegate?
    fileprivate var recognizer: UITapGestureRecognizer!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabelOne: UILabel!
    @IBOutlet var subTitleLabelTwo: UILabel!
    @IBOutlet weak var actionOneButton: UIButton!
    @IBOutlet weak var actionTwoButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 2
        imageView.layer.borderColor = UIColor.white.withAlphaComponent(0.4).cgColor
        imageView.layer.borderWidth = 0.5
        actionOneButton.isHidden = true
        actionOneButton.layer.cornerRadius = 2
        actionOneButton.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        actionOneButton.layer.borderWidth = 0.5
        actionTwoButton.isHidden = true
        actionTwoButton.layer.cornerRadius = 2
        actionTwoButton.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        actionTwoButton.layer.borderWidth = 0.5
        recognizer = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        imageView.addGestureRecognizer(recognizer)
        imageView.isUserInteractionEnabled = true
    }
    
    func configureForCard(_ card: CardPresentable?) {
        guard let _card = card else {
            self.card = nil
            self.imageView.image = nil
            self.titleLabel.text = nil
            self.subTitleLabelOne.text = nil
            self.subTitleLabelTwo.text = nil
            return
        }
        
        self.card = _card
        
        if let _actionOne = self.card.actionOne {
            let title = NSAttributedString(string: _actionOne.title, attributes: ShadowAttributes.forLabelMedium)
            actionOneButton.setAttributedTitle(title, for: UIControlState())
            actionOneButton.isHidden = false
        }
        
        if let _actionTwo = self.card.actionTwo {
            let title = NSAttributedString(string: _actionTwo.title, attributes: ShadowAttributes.forLabelMedium)
            actionTwoButton.setAttributedTitle(title, for: UIControlState())
            actionTwoButton.isHidden = false
        }
        

        imageView.loadImageAtURL(self.card.imageURLString, withDefaultImage: self.card.placeholderImage)
        
        titleLabel.attributedText = NSAttributedString(string: self.card.titleText, attributes: ShadowAttributes.forLabelSoft)
        subTitleLabelOne.attributedText = NSAttributedString(string: self.card.detailTextLineOne, attributes: ShadowAttributes.forLabelSoft)
        subTitleLabelTwo.attributedText = NSAttributedString(string: self.card.detailTextLineTwo, attributes: ShadowAttributes.forLabelSoft)
    }

    @IBAction func actionOneButtonAction(_ sender: AnyObject) {
        delegate?.focusedCardViewDidSelectActionItemOne(self)
    }
    
    @IBAction func actionTwoButtonAction(_ sender: AnyObject) {
        delegate?.focusedCardViewDidSelectActionItemTwo(self)
    }
    
    func tapAction() {
        delegate?.focusedCardViewDidSelectDetailAction(self)
    }
}


