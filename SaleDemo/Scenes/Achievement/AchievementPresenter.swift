import Foundation

protocol AchievementPresenterInput: AnyObject {
}

final class AchievementPresenter {
    weak var viewController: AchievementViewControllerInput?  
}

extension AchievementPresenter: AchievementPresenterInput {
}