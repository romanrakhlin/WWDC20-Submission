import PlaygroundSupport
import UIKit

class FifthViewController: UIViewController {
    
    // MARK: - Title
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Galactic clusters and mergers"
        label.textColor = UIColor.white
        return label
    }()
    
    // MARK: - Center Text View
    let centerTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = false
        textView.font = UIFont(name: "Futura", size: 20)
        textView.text = "Often galaxies collide. \nFor instance, our galaxy \nshould collide with \nthe Andromeda galaxy \nin about 4.5 billion years."
        textView.textColor = UIColor.white
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    // MARK: - Types of Galaxies Image
    let colideImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "colide.jpg")
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
        self.view.addSubview(colideImage)
        self.view.addSubview(nextButton)
        
        // setting up the layout
        setupLayout()
    }
    
    // MARK: - Show Fade In Animation
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        titleLabel.layer.add(FadeInAdnimation(), forKey: "fadeIn")
        centerTextView.layer.add(FadeInAdnimation(), forKey: "fadeIn")
        colideImage.layer.add(FadeInAdnimation(), forKey: "fadeIn")
    }
    
    // MARK: - Open The End View Controller
    @objc func buttonAction() {
        let theEndVC = TheEndViewController()
        PlaygroundPage.current.liveView = theEndVC
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
        colideImage.translatesAutoresizingMaskIntoConstraints = false
        colideImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        colideImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        colideImage.widthAnchor.constraint(equalToConstant: 300).isActive = true
        colideImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // Layout for Next Button
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
