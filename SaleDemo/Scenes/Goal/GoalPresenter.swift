import Foundation

protocol GoalPresenterInput: AnyObject {
}

final class GoalPresenter {
    weak var viewController: GoalViewControllerInput?  
}

extension GoalPresenter: GoalPresenterInput {
}