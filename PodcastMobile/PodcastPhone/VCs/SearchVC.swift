import UIKit
import PodcastData
import ExtenSwift
import PodcastNetwork

class SearchVC: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    private lazy var searchController: UISearchController = {
        let viewController = UISearchController(searchResultsController: nil)
        viewController.searchBar.delegate = self
        return viewController
    }()

    private var dummyPodcasts: [PodcastJSON] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        registerTableViewCell()
        configureViews()
        configureSearchController()
    }

    private func registerTableViewCell() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ha")
    }

    private func configureViews() {
        view.addSubview(tableView)
        tableView.pinToSuperviewSafeArea()
    }

    private func configureSearchController() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
    }

}

extension SearchVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dummyPodcasts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ha", for: indexPath)
        let podcast = self.dummyPodcasts[indexPath.row]
        cell.textLabel?.numberOfLines = 2
        cell.textLabel?.text = "\(podcast.artistName ?? "")\n\(podcast.trackName ?? "")"
        return cell
    }
}

extension SearchVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        let endpoint = try? APIService.itunesEndpoint(searchTerm: searchText)

        APIService.shared.fetchPodcasts(from: endpoint) { [weak self] podcasts in
            guard let podcasts = podcasts else {
                return
            }

            self?.dummyPodcasts = podcasts

            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}
