import UIKit
import Mustache

class ViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonString = """
{
    "storyId": 1234,
    "title": "This is the story of your life"
}
"""
        let jsonDecoder = JSONDecoder()
        let mockStory = try! jsonDecoder.decode(Story.self, from: jsonString.data(using: .utf8)!)
        let template = try! Template(named: "story")
        let mockStoryRendering = try! template.render(mockStory)
        textView.text = mockStoryRendering
    }


}

