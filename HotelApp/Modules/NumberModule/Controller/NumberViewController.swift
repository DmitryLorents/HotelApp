

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
    
    
    
    private func setViews() {
        view = numberView
        numberView.transferDelegates(delegate: self, dataSource: self)
    }

    @objc func cellButtonAction() {
        navigationController?.pushViewController(BookingViewController(), animated: true)
    }
}

extension NumberViewController: UITableViewDelegate {
    
}

extension NumberViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NumberTableViewCell.reuseID , for: indexPath) as? NumberTableViewCell else {return .init()}
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cellButtonAction))
        cell.setupView(model: nil, buttonAction: tapGestureRecognizer)
        return cell
    }
    
    
}
