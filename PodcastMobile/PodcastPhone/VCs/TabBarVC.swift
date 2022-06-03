import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureViewControllers()
    }

    func configureViewControllers() {
        viewControllers = [
            generateNavigationController(
                with: FavoritesVC(),
                title: "Favorites",
                image: UIImage(systemName: "hand.thumbsup.fill")
            ),
            generateNavigationController(
                with: SearchVC(),
                title: "Search",
                image: UIImage(systemName: "arrow.down.circle")
            ),
            generateNavigationController(
                with: DownloadsVC(),
                title: "Downloads",
                image: UIImage(systemName: "arrow.down.circle")
            ) 
        ]
    }

    private func generateNavigationController(
        with rootViewController: UIViewController,
        title: String,
        image: UIImage?
    ) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = title
        navigationController.tabBarItem.title = title
        if let image = image {
            navigationController.tabBarItem.image = image
        }
        return navigationController
    }

}
