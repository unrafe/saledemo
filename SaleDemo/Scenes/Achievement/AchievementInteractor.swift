import Foundation

protocol AchievementInteractorInput: AnyObject {
}

protocol AchievementDataStore {
}

final class AchievementInteractor: AchievementDataStore {
    var presenter: AchievementPresenterInput?
    var worker: AchievementWorkerInput?

    init(
        presenter: AchievementPresenterInput? = nil, 
        worker: AchievementWorkerInput? = nil
    ) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension AchievementInteractor: AchievementInteractorInput {
}