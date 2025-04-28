import UIKit

class HomeScreen: UIViewController {

    var toggleTheme: (() -> Void)?

    init(toggleTheme: @escaping (() -> Void)) {
        self.toggleTheme = toggleTheme
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

    func setupUI() {
        navigationItem.title = "Welcome"

        // Create the toggle theme button
        let toggleButton = UIBarButtonItem(image: UIImage(systemName: "moon.fill"), style: .plain, target: self, action: #selector(toggleThemeTapped))
        navigationItem.rightBarButtonItem = toggleButton
        
        // Create the welcome message label
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome to the Profile App!"
        welcomeLabel.font = UIFont.systemFont(ofSize: 24)
        welcomeLabel.textAlignment = .center
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)

        // Create the profile navigation button
        let goToProfileButton = UIButton(type: .system)
        goToProfileButton.setTitle("Go to Profile", for: .normal)
        goToProfileButton.addTarget(self, action: #selector(goToProfileTapped), for: .touchUpInside)
        goToProfileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goToProfileButton)

        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            goToProfileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goToProfileButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
        ])
    }

    @objc func toggleThemeTapped() {
        toggleTheme?()
    }

    @objc func goToProfileTapped() {
        let profileScreen = ProfileScreen()
        navigationController?.pushViewController(profileScreen, animated: true)
    }
}
