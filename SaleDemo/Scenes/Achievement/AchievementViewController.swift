import UIKit

protocol AchievementViewControllerInput: AnyObject {
}

final class AchievementViewController: UIViewController {
    var interactor: AchievementInteractorInput?
    var router: AchievementRoutingInput?

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let cellNib = UINib(nibName: "AchievementCollectionViewCell", bundle: Bundle(for: AchievementCollectionViewCell.self))
        collectionView.register(cellNib, forCellWithReuseIdentifier: "AchievementCollectionViewCell")
    }
}

extension AchievementViewController: AchievementViewControllerInput {
}

// MARK: - Collection View

extension AchievementViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.bounds.width - 60) / 3
        return CGSize(
            width: size,
            height: size
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AchievementCollectionViewCell", for: indexPath) as! AchievementCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
