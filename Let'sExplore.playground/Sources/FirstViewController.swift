import PlaygroundSupport
import UIKit

class FirstViewController: UIViewController {
    
    // MARK: - Title
    let titleLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.textAlignment = .center
        label.text = "Galaxy origins"
        label.textColor = UIColor.white
        return label
    }()
    
    // MARK: - Info Text View
    let infoTextView: UITextView = {
        let textView = UITextView()
        textView.alpha = 0
        textView.isEditable = false
        textView.isSelectable = false
        textView.font = UIFont(name: "Futura", size: 20)
        textView.text = "The first galaxy formed about 14 billion years ago, after the Big Bang. It was a slowly rotating gas cloud consisting of 75% hydrogen and 25% helium."
        textView.textColor = UIColor.white
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    // MARK: - The First Galaxy Image
    let theFirstGalaxyImage: UIImageView = {
        let imageView = UIImageView()
        imageView.alpha = 0
        imageView.image = UIImage(named: "TheFirstGalaxy")
        return imageView
    }()
    
    // MARK: - Next Button
    let nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Next!", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    // MARK: - Setup UI
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // settip up hte backgroun color
        self.view.backgroundColor = .black
        
        // adding elements on the UI
        self.view.addSubview(titleLabel)
        self.view.addSubview(infoTextView)
        self.view.addSubview(theFirstGalaxyImage)
        self.view.addSubview(nextButton)
        
        // setting up the layout
        setupLayout()
    }
    
    // MARK: - Setup Layout
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        titleLabel.layer.add(FadeInAdnimation(), forKey: "fadeIn")
        infoTextView.layer.add(FadeInAdnimation(), forKey: "fadeIn")
        theFirstGalaxyImage.layer.add(FadeInAdnimation(), forKey: "fadeIn")
    }
    
    // MARK: - Open New View Controller
    @objc func buttonAction() {
        let secondVC = SecondViewController()
        PlaygroundPage.current.liveView = secondVC
        PlaygroundPage.current.needsIndefiniteExecution = true
    }
    
    // MARK: - Setup Layout
    private func setupLayout() {
        
        // Layout for Title Label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // Layout for Text View
        infoTextView.translatesAutoresizingMaskIntoConstraints = false
        infoTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        infoTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        infoTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        infoTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        infoTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        infoTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // Layout for Image View
        theFirstGalaxyImage.translatesAutoresizingMaskIntoConstraints = false
        theFirstGalaxyImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        theFirstGalaxyImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        theFirstGalaxyImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        theFirstGalaxyImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        // Layout for Next Button
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
