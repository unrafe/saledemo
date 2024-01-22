import Foundation

protocol HomeInteractorInput: AnyObject {
}

protocol HomeDataStore {
}

final class HomeInteractor: HomeDataStore {
    var presenter: HomePresenterInput?
    var worker: HomeWorkerInput?

    init(
        presenter: HomePresenterInput? = nil, 
        worker: HomeWorkerInput? = nil
    ) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension HomeInteractor: HomeInteractorInput {
}