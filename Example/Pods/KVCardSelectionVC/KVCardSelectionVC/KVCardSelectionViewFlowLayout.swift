/*
 * KVCardSelectionViewFlowLayout
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

class KVCardSelectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        scrollDirection = .horizontal
        minimumLineSpacing = -10
        let w = UIScreen.main.bounds.width / 4
        let h = UIScreen.main.bounds.height / 6
        itemSize = CGSize(width: w, height: h)
        minimumInteritemSpacing = 1000
        let midX = UIScreen.main.bounds.midX
        let halfItemWidth = itemSize.width / 2
        let left = midX - halfItemWidth
        let right = left
        sectionInset = UIEdgeInsets(top: 0, left: left, bottom: 0, right: right)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
