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

class PointerLayer: CALayer {
    
    override func draw(in ctx: CGContext) {
        
        contentsScale = UIScreen.main.scale
        let midX = frame.midX
        let midY = frame.midY
        
        ctx.move(to: CGPoint(x: midX, y: 16))
        ctx.addLine(to: CGPoint(x: midX + 4, y: 20))
        ctx.addLine(to: CGPoint(x: midX - 4, y: 20))
        ctx.addLine(to: CGPoint(x: midX, y: 16))
        ctx.setFillColor(UIColor.black.cgColor)
        ctx.setStrokeColor(UIColor.black.cgColor)
        ctx.setLineWidth(1)
        ctx.drawPath(using: .fill)
        
        ctx.move(to: CGPoint(x: midX, y: 20))
        ctx.addLine(to: CGPoint(x: midX, y: midY))
        ctx.addLine(to: CGPoint(x: midX - 1, y: midY))
        ctx.move(to: CGPoint(x: midX - 1, y: 20))
        ctx.setFillColor(UIColor.white.cgColor)
        ctx.setStrokeColor(UIColor.white.cgColor)
        ctx.setLineWidth(1)
        ctx.drawPath(using: .fillStroke)
    }
    
}
