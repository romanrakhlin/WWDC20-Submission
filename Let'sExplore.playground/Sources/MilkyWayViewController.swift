import UIKit
import SceneKit

class MilkyWayViewController: UIViewController {
    
    var sceneView: SCNView!
    var scene: SCNScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sceneView = SCNView(frame: view.frame)
        scene = SCNScene(named: "MilkyWay.scn")
        sceneView.backgroundColor = .black
        sceneView.scene = scene
        self.view.addSubview(sceneView)
        
        sceneView.allowsCameraControl = true
    }
}
