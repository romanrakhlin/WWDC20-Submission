import PlaygroundSupport
import UIKit

class TheEndViewController: UIViewController {
    
    // MARK: - Title
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Want to take a look at our galaxy?"
        label.textColor = UIColor.white
        return label
    }()
    
    // MARK: - Label
    let centerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Futura", size: 20)
        label.text = "Well. Just tap on it!"
        label.textColor = UIColor.white
        return label
    }()
    
    // MARK: - MilkyWay button
    let milkyWayButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "MilkyWay.png")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Setup UI
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set background image
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "space.jpg")!)
        
        // add buttons on the main screen
        self.view.addSubview(titleLabel)
        self.view.addSubview(centerLabel)
        self.view.addSubview(milkyWayButton)
        
        // setting up the layout
        setupLayout()
    }
    
    // MARK: - Open AR
    @objc func buttonAction() {
        let spaceVC = MilkyWayViewController()
        PlaygroundPage.current.liveView = spaceVC
        PlaygroundPage.current.needsIndefiniteExecution = true
    }
    
    // MARK: - Setup Layout
    private func setupLayout() {
        
        // Layout for Title Label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        
        // Layout for Title Label
        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        centerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        centerLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        centerLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // Layout for Milky Way button
        milkyWayButton.translatesAutoresizingMaskIntoConstraints = false
        milkyWayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        milkyWayButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        milkyWayButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        milkyWayButton.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
}
