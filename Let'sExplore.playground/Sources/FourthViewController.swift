import PlaygroundSupport
import UIKit

class FourthViewController: UIViewController {
    
    // MARK: - Title
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Types of galaxies"
        label.textColor = UIColor.white
        return label
    }()
    
    // MARK: - Center Text View
    let centerTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = false
        textView.font = UIFont(name: "Futura", size: 20)
        textView.text = "These are the types of galaxies. \nOur galaxy (Milky Way) belongs to spiral galaxies."
        textView.textColor = UIColor.white
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    // MARK: - Types of Galaxies Image
    let typesImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "types")
        imageView.layer.borderWidth = 4
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
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
        self.view.addSubview(centerTextView)
        self.view.addSubview(typesImage)
        self.view.addSubview(nextButton)
        
        // setting up the layout
        setupLayout()
    }
    
    // MARK: - Setup Layout
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        titleLabel.layer.add(FadeInAdnimation(), forKey: "fadeIn")
        centerTextView.layer.add(FadeInAdnimation(), forKey: "fadeIn")
        typesImage.layer.add(FadeInAdnimation(), forKey: "fadeIn")
    }
    
    // MARK: - Open Fifth View Controller
    @objc func buttonAction() {
        let fifthVC = FifthViewController()
        PlaygroundPage.current.liveView = fifthVC
        PlaygroundPage.current.needsIndefiniteExecution = true
    }
    
    // MARK: - Setup Layout
    private func setupLayout() {
        
        // Layout for Title Label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        
        // Layout for Center Text View
        centerTextView.translatesAutoresizingMaskIntoConstraints = false
        centerTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        centerTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        centerTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        centerTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        centerTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        centerTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // Layout for Image
        typesImage.translatesAutoresizingMaskIntoConstraints = false
        typesImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        typesImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        typesImage.widthAnchor.constraint(equalToConstant: 300).isActive = true
        typesImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // Layout for Next Button
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
