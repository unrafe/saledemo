import UIKit

protocol HomeViewControllerInput: AnyObject {
}

final class HomeViewController: UIViewController {
    var interactor: HomeInteractorInput?
    var router: HomeRoutingInput?
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var collectionView3: UICollectionView!
    @IBOutlet weak var collectionView4: UICollectionView!

    var itemSize: CGSize {
        let size = (view.bounds.height * 0.3) - 70
        return CGSize(width: size - 20, height: size - 20)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let cellNib = UINib(nibName: "ProductCollectionViewCell", bundle: Bundle(for: ProductCollectionViewCell.self))
        collectionView.register(cellNib, forCellWithReuseIdentifier: "ProductCollectionViewCell")
        
        //Can Use 'Carousel'
        let cellNib2 = UINib(nibName: "BannerCollectionViewCell", bundle: Bundle(for: BannerCollectionViewCell.self))
        collectionView1.register(cellNib2, forCellWithReuseIdentifier: "BannerCollectionViewCell")
        collectionView2.register(cellNib2, forCellWithReuseIdentifier: "BannerCollectionViewCell")
        collectionView3.register(cellNib2, forCellWithReuseIdentifier: "BannerCollectionViewCell")
        collectionView4.register(cellNib2, forCellWithReuseIdentifier: "BannerCollectionViewCell")
    }
    
    @IBAction func routeToGoal(_ sender: UIButton) {
        let data = ["badges": 4]
        SocketIOManager.shared.emit(message: data)
        router?.routeToGoal()
    }
}

extension HomeViewController: HomeViewControllerInput {
}

// MARK: - Collection View

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView {
            return itemSize
        }
        return CGSize(width: (160/3) * 5, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
        let random = Int.random(in: 1...4)
        cell.imageView.image = UIImage(named: "banner\(random)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
