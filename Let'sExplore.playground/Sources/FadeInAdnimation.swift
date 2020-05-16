import UIKit

// Module for Fade In Animation
class FadeInAdnimation: CABasicAnimation {
    override init() {
        super.init()
        keyPath = "opacity"
        duration = 2.0
        fromValue = 0
        toValue = 1
        fillMode = CAMediaTimingFillMode.forwards
        isRemovedOnCompletion = false
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
