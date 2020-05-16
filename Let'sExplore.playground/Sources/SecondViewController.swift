import PlaygroundSupport
import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Title
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Galaxies, explained"
        label.textColor = UIColor.white
        return label
    }()
    
    // MARK: - The First Galaxy Image
    let horizontalGalaxy: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "horizontalGalaxy")
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Info Text View
    let infoTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = false
        textView.font = UIFont(name: "Futura", size: 20)
        textView.text = "A galaxy is an object, \nit consists of this: \n- dust \n- gas \n- dark matter \n- from million to a trillion stars \nAll this is held together by gravity."
        textView.textColor = UIColor.white
        textView.backgroundColor = UIColor.clear
        return textView
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
        self.view.addSubview(horizontalGalaxy)
        self.view.addSubview(infoTextView)
        self.view.addSubview(nextButton)
        
        // setting up the layout
        setupLayout()
    }
    
    // MARK: - Show Fade In Animation
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        titleLabel.layer.add(FadeInAdnimation(), forKey: "fadeIn")
        horizontalGalaxy.layer.add(FadeInAdnimation(), forKey: "fadeIn")
        infoTextView.layer.add(FadeInAdnimation(), forKey: "fadeIn")
    }
    
    // MARK: - Open Third View Controller
    @objc func buttonAction() {
        let thirdVC = ThirdViewController()
        PlaygroundPage.current.liveView = thirdVC
        PlaygroundPage.current.needsIndefiniteExecution = true
    }
    
    // MARK: - Setup Layout
    private func setupLayout() {
        
        // Layout for Title Label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        
        // Layout for Image View
        horizontalGalaxy.translatesAutoresizingMaskIntoConstraints = false
        horizontalGalaxy.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        horizontalGalaxy.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
        horizontalGalaxy.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        horizontalGalaxy.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        horizontalGalaxy.widthAnchor.constraint(equalToConstant: 200).isActive = true
        horizontalGalaxy.heightAnchor.constraint(equalToConstant: 100).isActive = true

        // Layout for Text View
        infoTextView.translatesAutoresizingMaskIntoConstraints = false
        infoTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 260).isActive = true
        infoTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        infoTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        infoTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        
        // Layout for Next Button
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
