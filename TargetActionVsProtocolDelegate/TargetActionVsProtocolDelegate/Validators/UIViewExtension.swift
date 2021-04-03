import UIKit

extension UIView {
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}

extension UIView {
    func findAncestorView() -> UIView? {
        if self.superview == nil {
            return self
        } else if let parentView = self.superview {
            return parentView.findAncestorView()
        } else {
            return nil
        }
    }
}

