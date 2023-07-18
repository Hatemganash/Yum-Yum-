
import UIKit


extension UIView {
   @IBInspectable var cornerRadius : CGFloat {
        get {return cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
