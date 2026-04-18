import UIKit

class CreateWishlistViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!

    var onCreate: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func createButtonTapped(_ sender: UIButton) {
        let newName = nameTextField.text ?? ""
        onCreate?(newName)
        dismiss(animated: true, completion: nil)
    }
}
