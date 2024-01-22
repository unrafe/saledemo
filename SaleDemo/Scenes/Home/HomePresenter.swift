import Foundation

protocol HomePresenterInput: AnyObject {
}

final class HomePresenter {
    weak var viewController: HomeViewControllerInput?  
}

extension HomePresenter: HomePresenterInput {
}