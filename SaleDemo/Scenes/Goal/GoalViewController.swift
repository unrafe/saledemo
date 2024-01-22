import UIKit

protocol GoalViewControllerInput: AnyObject {
}

final class GoalViewController: UIViewController {
    var interactor: GoalInteractorInput?
    var router: GoalRoutingInput?
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let cellNib = UINib(nibName: "GoalTypeCollectionViewCell", bundle: Bundle(for: GoalTypeCollectionViewCell.self))
        collectionView.register(cellNib, forCellWithReuseIdentifier: "GoalTypeCollectionViewCell")
    }
}

extension GoalViewController: GoalViewControllerInput {
}

// MARK: - Collection View

extension GoalViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: (collectionView.bounds.width - 80) / 3,
            height: (collectionView.bounds.height - 20) / 2
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoalTypeCollectionViewCell", for: indexPath) as! GoalTypeCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
