import UIKit

protocol AchievementConfiguratorProtocol: AnyObject {
    associatedtype InputParameter
    func configured(_ parameter: InputParameter?) -> UIViewController?
}

final class AchievementConfigurator: AchievementConfiguratorProtocol {
    typealias InputParameter = Any

    func configured(_ parameter: Any?) -> UIViewController? {
        
        let viewController = AchievementViewController(nibName: "AchievementViewController", bundle: .main)
        let interactor = AchievementInteractor()
        let presenter = AchievementPresenter()
        let router = AchievementRouter()
        let worker = AchievementWorker()

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
