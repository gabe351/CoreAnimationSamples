import UIKit

struct AnimationService {

    static let shared = AnimationService()

    func execute(animation: AnimationEnum, to view: UIView?) {
        guard let view else { return }
        switch animation {
        case .moveUp:
            movingUp(view: view)
        case .moveDown:
            movingDown(view: view)
        case .scale:
            scaling(view: view)
        case .rotate:
            rotating(view: view)
        case .shake:
            shake(view: view)
        }
    }
}

private extension AnimationService {
    func movingUp(view: UIView) {
        let animation = CABasicAnimation()
        animation.keyPath = "position.y"
        animation.fromValue = view.frame.origin.y + view.frame.height/2
        animation.toValue = view.frame.origin.y - 100
        animation.duration = 1

        view.layer.add(animation, forKey: "movingUp")
        // Sets the final position
        view.layer.position = CGPoint(
            x: view.frame.origin.x + view.frame.width/2,
            y: view.frame.origin.y - 100
        )
    }

    func movingDown(view: UIView) {
        let animation = CABasicAnimation()
        animation.keyPath = "position.y"
        animation.fromValue = view.frame.origin.y + view.frame.height/2
        animation.toValue = view.frame.origin.y + 100
        animation.duration = 1

        view.layer.add(animation, forKey: "movingDown")
        // Sets the final position
        view.layer.position = CGPoint(
            x: view.frame.origin.x + view.frame.height/2,
            y: view.frame.origin.y + 100
        )
    }

    func scaling(view: UIView) {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.scale"
        animation.fromValue = 1
        animation.toValue = 2
        animation.duration = 0.4

        view.layer.add(animation, forKey: "scaling")
        view.layer.transform = CATransform3DMakeScale(2, 2, 1)
    }

    func rotating(view: UIView) {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation.z"
        animation.fromValue = 0
        animation.toValue = CGFloat.pi / 2
        animation.duration = 1

        view.layer.add(animation, forKey: "rotating")
        view.layer.transform = CATransform3DMakeRotation(CGFloat.pi/2, 0, 0, 1)
    }

    func shake(view: UIView) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.4
        animation.isAdditive = true

        view.layer.add(animation, forKey: "shake")
    }
}
