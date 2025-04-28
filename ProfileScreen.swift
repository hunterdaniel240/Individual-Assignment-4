import UIKit

class ProfileScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

    func setupUI() {
        navigationItem.title = "My Profile"

        // Create profile picture
        let profileImageView = UIImageView(image: UIImage(named: "profile_picture"))
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)

        // User Name
        let nameLabel = UILabel()
        nameLabel.text = "John Doe"
        nameLabel.font = UIFont.systemFont(ofSize: 24)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)

        // User Role
        let roleLabel = UILabel()
        roleLabel.text = "Software Engineer"
        roleLabel.font = UIFont.systemFont(ofSize: 20)
        roleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(roleLabel)

        // Back to Home Button
        let backButton = UIButton(type: .system)
        backButton.setTitle("Back to Home", for: .normal)
        backButton.addTarget(self, action: #selector(backToHomeTapped), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)

        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),

            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),

            roleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            roleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),

            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.topAnchor.constraint(equalTo: roleLabel.bottomAnchor, constant: 20),
        ])
    }

    @objc func backToHomeTapped() {
        navigationController?.popViewController(animated: true)
    }
}
