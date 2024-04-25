import UIKit

final class ActionCell: UICollectionViewCell {

    let titleLabel = PaddingLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(animation: AnimationEnum) {
        self.titleLabel.text = animation.title
    }
}

private extension ActionCell {

    func addViews() {
        self.layer.cornerRadius = 8.0
        self.backgroundColor = .lightGray
            .withAlphaComponent(0.4)
        titleLabel.textAlignment = .center
        self.addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
