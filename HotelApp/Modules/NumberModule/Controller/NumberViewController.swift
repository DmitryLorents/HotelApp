

import UIKit

class NumberViewController: UIViewController {
    //MARK: - Parameters
    let networkManager = NetworkManager.shared
    let numberView = NumberView()
    var roomsData: NumberParsingModel? {
        didSet {
            guard let roomsData else {return}
            numberView.setupView(model: roomsData)
            numberView.reloadTable()
        }
    }
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = NumberModel.title
        fetchData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
    }
    
    override func viewDidLayoutSubviews() {
        numberView.layoutSubviews()
    }
    
    //MARK: - Methods
    
    private func fetchData() {
        networkManager.getNumberData { result in
            switch result {
            case .failure(let error): print(error.localizedDescription)
            case .success(let data):
                DispatchQueue.main.async {
                    self.roomsData = data
                }
            }
        }
    }
    
    private func setViews() {
        view = numberView
        numberView.transferDelegates(delegate: self, dataSource: self)
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    @objc func cellButtonAction() {
        navigationController?.pushViewController(BookingViewController(), animated: true)
    }
}
//MARK: - UITableViewDelegate
extension NumberViewController: UITableViewDelegate {
    
}
//MARK: - UITableViewDataSource
extension NumberViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        roomsData?.rooms.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NumberTableViewCell.reuseID , for: indexPath) as? NumberTableViewCell else {return .init()}
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cellButtonAction))
        let room = roomsData?.rooms[indexPath.row]
        cell.setupView(model: room, buttonAction: tapGestureRecognizer)
        return cell
    }
    
    
}
