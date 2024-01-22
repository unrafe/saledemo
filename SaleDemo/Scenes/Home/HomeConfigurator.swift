import UIKit

protocol HomeConfiguratorProtocol: AnyObject {
    associatedtype InputParameter
    func configured(_ parameter: InputParameter?) -> UIViewController?
}

final class HomeConfigurator: HomeConfiguratorProtocol {
    typealias InputParameter = Any

    func configured(_ parameter: Any?) -> UIViewController? {
        
        let viewController = HomeViewController(nibName: "HomeViewController", bundle: .main)
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        let worker = HomeWorker()

        router.source = viewController
        router.dataStore = interactor
        presenter.viewController = viewController
        interactor.presenter = presenter
        interactor.worker = worker
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
