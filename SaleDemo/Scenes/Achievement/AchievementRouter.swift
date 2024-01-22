import UIKit

protocol AchievementRoutingInput: AnyObject {
}

final class AchievementRouter {
    weak var source: UIViewController?
    var dataStore: AchievementDataStore?
}

extension AchievementRouter: AchievementRoutingInput {
}