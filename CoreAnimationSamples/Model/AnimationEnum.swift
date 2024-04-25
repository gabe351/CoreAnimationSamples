import Foundation

enum AnimationEnum: CaseIterable {
    case moveUp
    case moveDown
    case scale
    case rotate
    case shake

    var title: String {

        switch self {
        case .moveUp:
            return "Move Up"
        case .moveDown:
            return "Move down"
        case .scale:
            return "Scale"
        case .rotate:
            return "Rotate"
        case .shake:
            return "Shake"
        }
    }
}
