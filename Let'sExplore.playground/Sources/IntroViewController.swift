import PlaygroundSupport
import SceneKit
import SpriteKit

class IntroViewController: UIViewController {
        
    var sceneView: SCNView!
    var scene: SCNScene!
    var cameraNode: SCNNode!
    var field: SCNPhysicsField!
    var fieldNode: SCNNode!
    var textNode: SCNNode!
    var introSKScene: IntroSKScene!
        
    override func viewDidLoad() {
        super.viewDidLoad()
            
        sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(sceneView)
            
        scene = SCNScene()
        sceneView.scene = scene
        sceneView.backgroundColor = .black
            
        cameraNode = SCNNode()
        cameraNode.physicsBody = SCNPhysicsBody.dynamic()
        cameraNode.camera = SCNCamera()
        cameraNode.camera?.zFar = 10000
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 450)
        scene.rootNode.addChildNode(cameraNode)
            
        var shape = SCNSphere(radius: 420)
            
        func configure(system: SCNParticleSystem, colors: [UIColor]) {
            for color in colors {
                system.loops = true
                system.birthRate = 600
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
            
        configure(system: SCNParticleSystem(), colors: [UIColor.yellow])
            
        field = SCNPhysicsField.vortex()
        field.strength = -0.5
        fieldNode = SCNNode()
        fieldNode.physicsField = field
            
        showFirstScene()
    }
        
    // MARK: - Preparing Scenes
        
    func showFirstScene() {
        let text = SCNText(string: "There are about 51 galaxies \nin the Local Group, \non the order of 100,000 \nin our Local Supercluster, \nand an estimated one to \ntwo trillion \nin all of the \nobservable universe.", extrusionDepth: 0)
        let font = UIFont(name: "Futura", size: 10)
        text.font = font
        text.alignmentMode = CATextLayerAlignmentMode.center.rawValue
        text.firstMaterial?.emission.contents = UIColor.white
            
        let (minBound, maxBound) = text.boundingBox
        textNode = SCNNode(geometry: text)
        textNode.opacity = 0.0
        textNode.pivot = SCNMatrix4MakeTranslation( (maxBound.x - minBound.x)/2, minBound.y, 0.02/2)
        textNode.scale = SCNVector3Make(1, 1, 1)
        textNode.position = SCNVector3(0, -40, 200)
            
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (_) in
            self.textNode.runAction(SCNAction.sequence([SCNAction.wait(duration: 2), SCNAction.fadeIn(duration: 4)]))
        }
            
        introSKScene = IntroSKScene(intro: self)
        sceneView.overlaySKScene = introSKScene
            
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { (_) in
            self.introSKScene.startLabel.run(SKAction.fadeIn(withDuration: 0.5))
            self.introSKScene.startBackground.run(SKAction.fadeIn(withDuration: 0.5))
            self.introSKScene.firstAnimationIsWatched = true
        }
        
        scene.rootNode.addChildNode(textNode)
    }
        
    func showSecondScene() {
        let text = SCNText(string: "We are going to \nfigure out what \nare galaxies and what \nis interesting in them.", extrusionDepth: 0)
        let font = UIFont(name: "Futura", size: 10)
        text.font = font
        text.alignmentMode = CATextLayerAlignmentMode.center.rawValue
        text.firstMaterial?.emission.contents = UIColor.white
            
        let (minBound, maxBound) = text.boundingBox
        textNode = SCNNode(geometry: text)
        textNode.opacity = 0.0
        textNode.pivot = SCNMatrix4MakeTranslation( (maxBound.x - minBound.x)/2, minBound.y, 0.02/2)
        textNode.scale = SCNVector3Make(1, 1, 1)
        textNode.position = SCNVector3(0, -20, 0)
            
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (_) in
            self.textNode.runAction(SCNAction.sequence([SCNAction.wait(duration: 2), SCNAction.fadeIn(duration: 4)]))
        }
            
        introSKScene = IntroSKScene(intro: self)
        sceneView.overlaySKScene = introSKScene
            
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { (_) in
            self.introSKScene.startLabel.run(SKAction.fadeIn(withDuration: 0.5))
            self.introSKScene.startBackground.run(SKAction.fadeIn(withDuration: 0.5))
            self.introSKScene.secondAnimationIsWatched = true
        }
        
        scene.rootNode.addChildNode(textNode)
    }
        
    func showThirdScene() {
        let text = SCNText(string: "Let's Explore", extrusionDepth: 0)
        let font = UIFont(name: "Futura", size: 20)
        text.font = font
        text.alignmentMode = CATextLayerAlignmentMode.center.rawValue
        text.firstMaterial?.emission.contents = UIColor.white
            
        let (minBound, maxBound) = text.boundingBox
        textNode = SCNNode(geometry: text)
        textNode.opacity = 0.0
        textNode.pivot = SCNMatrix4MakeTranslation( (maxBound.x - minBound.x)/2, minBound.y, 0.02/2)
        textNode.scale = SCNVector3Make(1, 1, 1)
        textNode.position = SCNVector3(0, -10, -200)
            
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (_) in
            self.textNode.runAction(SCNAction.sequence([SCNAction.wait(duration: 2), SCNAction.fadeIn(duration: 4)]))
        }
            
        introSKScene = IntroSKScene(intro: self)
        sceneView.overlaySKScene = introSKScene
            
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { (_) in
            self.introSKScene.startLabel.run(SKAction.fadeIn(withDuration: 0.5))
            self.introSKScene.startBackground.run(SKAction.fadeIn(withDuration: 0.5))
            self.introSKScene.thirdAnimationIsWatched = true
        }
        
        scene.rootNode.addChildNode(textNode)
    }
        
    // MARK: - For Moving Camera
        
    func moveCameraFirstTime() {
        self.field = SCNPhysicsField.vortex()
        self.field.strength = 300
        self.fieldNode.physicsField = self.field
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (_) in
            let camMove = SCNAction.move(to: SCNVector3Make(0, 0, 200), duration: 2)
            camMove.timingMode = .easeIn
            self.cameraNode.runAction(SCNAction.sequence([SCNAction.wait(duration: 0), camMove]))
            self.showSecondScene()
        }
    }
        
    func moveCameraSecondTime() {
        self.field = SCNPhysicsField.vortex()
        self.field.strength = 300
        self.fieldNode.physicsField = self.field
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (_) in
            let camMove = SCNAction.move(to: SCNVector3Make(0, 0, 0), duration: 2)
            camMove.timingMode = .easeIn
            self.cameraNode.runAction(SCNAction.sequence([SCNAction.wait(duration: 0), camMove]))
            self.showThirdScene()
        }
    }
        
    func moveCameraThirdTime() {
        self.field = SCNPhysicsField.vortex()
        self.field.strength = 300
        self.fieldNode.physicsField = self.field
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (_) in
            let camMove = SCNAction.move(to: SCNVector3Make(0, 0, -200), duration: 2)
            camMove.timingMode = .easeIn
            self.cameraNode.runAction(SCNAction.sequence([SCNAction.wait(duration: 0), camMove]))
            self.introSKScene.blackFadeOut()
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (_) in
                self.loadFirstVC()
            })
        }
    }
    
    // MARK: - Load First View Controller
        
    func loadFirstVC() {
        let firstVC = FirstViewController()
        PlaygroundPage.current.liveView = firstVC
        PlaygroundPage.current.needsIndefiniteExecution = true
    }
}
