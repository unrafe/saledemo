import UIKit

protocol HomeRoutingInput: AnyObject {
    func routeToGoal()
}

final class HomeRouter {
    weak var source: UIViewController?
    var dataStore: HomeDataStore?
}

extension HomeRouter: HomeRoutingInput {
    
    func routeToGoal() {
        guard let viewController = GoalConfigurator().configured(nil) else { return }
        source?.navigationController?.pushViewController(viewController, animated: true)
    }
}
