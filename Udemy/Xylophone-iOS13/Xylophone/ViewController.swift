import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        makeOpacity(button: sender)
        let currentTitle = sender.currentTitle!
        playSound(title: currentTitle)
    }
    
    func makeOpacity(button: UIButton) {
        button.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            button.alpha = 1
        }

    }
    
    func playSound(title: String) {
        let url = Bundle.main.url(forResource: title, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
