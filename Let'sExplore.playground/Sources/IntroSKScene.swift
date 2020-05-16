import PlaygroundSupport
import SpriteKit

class IntroSKScene: SKScene {
    
    let startLabel: SKLabelNode
    var startBackground: SKShapeNode!
    let intro: IntroViewController
        
    init(intro: IntroViewController) {
        self.intro = intro
        self.startLabel = SKLabelNode(text: "Next!")
        super.init(size: intro.sceneView.frame.size)
        let font = UIFont(name: "Futura", size: 14)!.fontName
        startLabel.verticalAlignmentMode = .center
        startLabel.horizontalAlignmentMode = .center
        scaleMode = .aspectFit
        self.startBackground = SKShapeNode(rect: CGRect(origin: CGPoint.zero, size: CGSize(width: 1000, height: startLabel.frame.height)), cornerRadius: 1.0)
        startBackground.strokeColor = UIColor(white: 1, alpha: 0.0)
        startBackground.alpha = 0.0
        addChild(startBackground)
        startLabel.fontSize = 20
        startLabel.alpha = 0
        startLabel.fontName = font
        addChild(startLabel)
        updatePositions()
    }
        
    func blackFadeOut() {
        let background = SKShapeNode(rectOf: CGSize(width: 5000, height: 5000))
        background.fillColor = UIColor.black
        background.strokeColor = UIColor.black
        background.alpha = 0.0
        background.zPosition = 5
        startBackground.run(SKAction.fadeOut(withDuration: 0.2))
        addChild(background)
        background.run(SKAction.fadeIn(withDuration: 2))
    }
    
    func updatePositions() {
        startLabel.position = CGPoint(x: frame.midX, y: frame.midY - 150 - startBackground.frame.height / 2)
        startBackground.position = CGPoint(x: frame.midX - startBackground.frame.width / 2, y: frame.midY - startBackground.frame.height / 2 - 40)
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    var isStarted = false
    var firstAnimationIsWatched = false
    var secondAnimationIsWatched = false
    var thirdAnimationIsWatched = false
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if firstAnimationIsWatched == false {
            if secondAnimationIsWatched == false {
                if thirdAnimationIsWatched == false {
                    return
                } else {
                    if let _ = touches.first, !isStarted {
                        startLabel.run(SKAction.fadeOut(withDuration: 0.5))
                        startBackground.run(SKAction.fadeOut(withDuration: 0.5))
                        self.intro.moveCameraThirdTime()
                        thirdAnimationIsWatched = false
                    }
                }
            } else {
                if let _ = touches.first, !isStarted {
                    startLabel.run(SKAction.fadeOut(withDuration: 0.5))
                    startBackground.run(SKAction.fadeOut(withDuration: 0.5))
                    self.intro.moveCameraSecondTime()
                }
            }
        } else {
            if let _ = touches.first, !isStarted {
                startLabel.run(SKAction.fadeOut(withDuration: 0.5))
                startBackground.run(SKAction.fadeOut(withDuration: 0.5))
                self.intro.moveCameraFirstTime()
            }
        }
    }
}
