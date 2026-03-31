import UIKit

class ViewController: UIViewController {
    // Setup stuff
    struct CollectionItem {
        let id: UUID
        var name: String
        var value: Double
        var isCollected: Bool
        var isWishlist: Bool
    }
    //These are {pre-generated items} to show off the spotlight
    private var items: [CollectionItem] = [
        CollectionItem(id: UUID(), name: "Charizard EX Card", value: 50, isCollected: true, isWishlist: false),
        CollectionItem(id: UUID(), name: "1990s Batman Figure", value: 85, isCollected: false, isWishlist: true),
        CollectionItem(id: UUID(), name: "Signed Spider Man Comic", value: 200, isCollected: true, isWishlist: false)
    ]
    
    //Variables
    private var totalItems: Int {
        items.count
    }
    
    private var collectedCount: Int {
        items.filter { $0.isCollected }.count
    }
    
    private var wishlistCount: Int {
        items.filter { $0.isWishlist }.count
    }
    
    private var totalValue: Double {
        items.filter { $0.isCollected }
             .reduce(0) { $0 + $1.value }
    }
    
    private var spotlightItem: CollectionItem? {
        items.randomElement()
    }
    
    //Labels
    private let welcomeLabel = UILabel()
    private let statsStackView = UIStackView()
    private let spotlightView = UIView()
    
    //View loading and runs functions to set up screen
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        layoutUI()
        configure()
    }
    
    //This sets up the main view, showing the welcome message and "My collection title"
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "My Collection"
        
        welcomeLabel.font = .systemFont(ofSize: 28, weight: .bold)
        welcomeLabel.text = "Welcome back!"
        
        statsStackView.axis = .vertical
        statsStackView.spacing = 16
        
        spotlightView.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.2)
        spotlightView.layer.cornerRadius = 12
    }
    private func layoutUI() {
        [welcomeLabel, statsStackView, spotlightView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            statsStackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            statsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            statsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            spotlightView.topAnchor.constraint(equalTo: statsStackView.bottomAnchor, constant: 20),
            spotlightView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            spotlightView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            spotlightView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    //Start the config for setting up stats and spotlights
    private func configure() {
        setupStats()
        setupSpotlight()
    }
    //Setup for the stats
    private func setupStats() {
        let row1 = makeStatRow(
            ("Wishlist Items", wishlistCount),
            ("Collected Items", collectedCount)
        )
        
        let row2 = makeStatRow(
            ("Total Items", totalItems),
            ("Collection Value", Int(totalValue))
        )
        
        statsStackView.addArrangedSubview(row1)
        statsStackView.addArrangedSubview(row2)
    }
    
    //this turns stats into stack views so its clean and in squares
    private func makeStatRow(_ left: (String, Int), _ right: (String, Int)) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.distribution = .fillEqually
        
        stack.addArrangedSubview(makeStatCard(title: left.0, value: "\(left.1)"))
        stack.addArrangedSubview(makeStatCard(title: right.0, value: "\(right.1)"))
        stack.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        return stack
    }
    //This puts the stack view into a card to allow for the squares to sit pretty and together
    private func makeStatCard(title: String, value: String) -> UIView {
        let container = UIView()
        container.backgroundColor = .systemGray6
        container.layer.cornerRadius = 10
        
        let valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.font = .boldSystemFont(ofSize: 18)
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 12)
        titleLabel.textColor = .secondaryLabel
        
        let stack = UIStackView(arrangedSubviews: [valueLabel, titleLabel])
        stack.axis = .vertical
        stack.alignment = .center
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
        
        return container
    }
    //This sets up the item spotlight to show a random item
    private func setupSpotlight() {
        guard let item = spotlightItem else { return }
        
        let titleLabel = UILabel()
        titleLabel.text = "Spotlight Item"
        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        let nameLabel = UILabel()
        nameLabel.text = item.name
        nameLabel.font = .boldSystemFont(ofSize: 18)
        
        let valueLabel = UILabel()
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency

        valueLabel.text = formatter.string(from: NSNumber(value: item.value))
        valueLabel.textColor = .secondaryLabel
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, nameLabel, valueLabel])
        stack.axis = .vertical
        stack.spacing = 6
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        spotlightView.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: spotlightView.leadingAnchor, constant: 12),
            stack.trailingAnchor.constraint(equalTo: spotlightView.trailingAnchor, constant: -12),
            stack.centerYAnchor.constraint(equalTo: spotlightView.centerYAnchor)
        ])
    }}
