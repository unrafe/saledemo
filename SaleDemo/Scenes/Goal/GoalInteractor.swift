import Foundation

protocol GoalInteractorInput: AnyObject {
}

protocol GoalDataStore {
}

final class GoalInteractor: GoalDataStore {
    var presenter: GoalPresenterInput?
    var worker: GoalWorkerInput?

    init(
        presenter: GoalPresenterInput? = nil, 
        worker: GoalWorkerInput? = nil
    ) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension GoalInteractor: GoalInteractorInput {
}