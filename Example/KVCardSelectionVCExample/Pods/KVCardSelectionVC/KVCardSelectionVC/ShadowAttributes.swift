/*
 * PointerLayer
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

struct ShadowAttributes {
    
    static var forLabelSoft: [String: AnyObject] {
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 0, height: 0)
        shadow.shadowBlurRadius = 1
        shadow.shadowColor = UIColor.black.withAlphaComponent(0.5)
        return [
            NSForegroundColorAttributeName: UIColor.white,
            NSShadowAttributeName: shadow
        ]
    }
    
    static var forLabelMedium: [String: AnyObject] {
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 0, height: 0)
        shadow.shadowBlurRadius = 0.5
        shadow.shadowColor = UIColor.black.withAlphaComponent(0.7)
        return [
            NSForegroundColorAttributeName: UIColor.white,
            NSShadowAttributeName: shadow
        ]
    }
    
    static var forLabelHard: [String: AnyObject] {
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 0, height: 0)
        shadow.shadowBlurRadius = 1
        shadow.shadowColor = UIColor.black.withAlphaComponent(1)
        return [
            NSForegroundColorAttributeName: UIColor.white,
            NSShadowAttributeName: shadow
        ]
    }
    
}
