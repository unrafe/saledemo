import UIKit

protocol GoalConfiguratorProtocol: AnyObject {
    associatedtype InputParameter
    func configured(_ parameter: InputParameter?) -> UIViewController?
}

final class GoalConfigurator: GoalConfiguratorProtocol {
    typealias InputParameter = Any

    func configured(_ parameter: Any?) -> UIViewController? {
        
        let viewController = GoalViewController(nibName: "GoalViewController", bundle: .main)
        let interactor = GoalInteractor()
        let presenter = GoalPresenter()
        let router = GoalRouter()
        let worker = GoalWorker()

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
