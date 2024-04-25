import UIKit

final class ActionsCollectionView: UICollectionView {
    private let cellId = "actionCell"

    weak var viewToMove: UIView?

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        super.init(
            frame: .zero,
            collectionViewLayout: layout
        )

        self.dataSource = self
        self.delegate = self
        self.register(ActionCell.self, forCellWithReuseIdentifier: cellId)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ActionsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AnimationEnum.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellId,
            for: indexPath) as! ActionCell
        cell.setupCell(animation: AnimationEnum.allCases[indexPath.row])

        return cell
    }
}

extension ActionsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        AnimationService.shared.execute(
            animation: AnimationEnum.allCases[indexPath.row],
            to: viewToMove
        )
    }
}
