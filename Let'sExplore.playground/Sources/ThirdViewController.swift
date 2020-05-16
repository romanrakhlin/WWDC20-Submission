import PlaygroundSupport
import UIKit
import SceneKit

class ThirdViewController: UIViewController {
    
    var sceneView: SCNView!
    var scene: SCNScene!
    var cameraNode: SCNNode!
    var field: SCNPhysicsField!
    var fieldNode: SCNNode!
    var letsgoNode: SCNNode!
    var introSKScene: IntroSKScene!
    
    // MARK: - Title
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Galaxies, explained"
        label.textColor = UIColor.white
        return label
    }()
    
    // MARK: - Label
    let centerTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = false
        textView.font = UIFont(name: "Futura", size: 20)
        textView.text = "Nearly all large galaxies \ncontain supermassive \nblack holes at their centers."
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
        
        sceneView = SCNView()
        self.view.addSubview(sceneView)
            
        scene = SCNScene()
        sceneView.scene = scene
        sceneView.backgroundColor = .black
            
        cameraNode = SCNNode()
        cameraNode.physicsBody = SCNPhysicsBody.dynamic()
        cameraNode.camera = SCNCamera()
        cameraNode.camera?.zFar = 10000
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 200)
        scene.rootNode.addChildNode(cameraNode)
            
        var shape = SCNSphere(radius: 100)
            
        func configure(system: SCNParticleSystem, colors: [UIColor]) {
            for color in colors {
                system.loops = true
                system.birthRate = 1000
                system.emissionDuration = 5
                system.emitterShape = shape
                system.particleLifeSpan = 10
                system.particleSize = 0.4
                system.particleColor = color
                system.isAffectedByPhysicsFields = true
                system.isAffectedByGravity = false
                scene.addParticleSystem(system, transform: SCNMatrix4MakeRotation(0, 0, 0, 0))
            }
        }
            
        configure(system: SCNParticleSystem(), colors: [UIColor.red])
        configure(system: SCNParticleSystem(), colors: [UIColor.blue])
            
        field = SCNPhysicsField.vortex()
        field.strength = -0.5
        fieldNode = SCNNode()
        fieldNode.physicsField = field
        
        // adding elements on the UI
        self.view.addSubview(titleLabel)
        self.view.addSubview(centerTextView)
        self.view.addSubview(nextButton)
        
        // setting up the layout
        setupLayout()
    }
    
    // MARK: - Show Fade In Animation
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        titleLabel.layer.add(FadeInAdnimation(), forKey: "fadeIn")
        centerTextView.layer.add(FadeInAdnimation(), forKey: "fadeIn")
    }
    
    // MARK: - Open Black Hole View Controller
    @objc func buttonAction() {
        let fourthVC = FourthViewController()
        PlaygroundPage.current.liveView = fourthVC
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
        
        // Layout for Scene View
        sceneView.translatesAutoresizingMaskIntoConstraints = false
        sceneView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sceneView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        sceneView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        sceneView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // Layout for Next Button
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
