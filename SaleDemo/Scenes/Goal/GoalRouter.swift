import UIKit

protocol GoalRoutingInput: AnyObject {
}

final class GoalRouter {
    weak var source: UIViewController?
    var dataStore: GoalDataStore?
}

extension GoalRouter: GoalRoutingInput {
}