import PlaygroundSupport

public class letsgo {
    
    public init() {
        let introVC = IntroViewController()
        PlaygroundPage.current.liveView = introVC
        PlaygroundPage.current.needsIndefiniteExecution = true
    }
}

