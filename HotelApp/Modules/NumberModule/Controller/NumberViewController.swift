

import UIKit

class NumberViewController: UIViewController {
    //MARK: - Parameters
    let numberView = NumberView()

    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
}
    
    //MARK: - Methods
    
    fileprivate func setViews() {
        view = numberView
    }

   
    

}
