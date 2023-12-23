
import UIKit

class NumberView: UIView {
    //MARK: - Parameters
    lazy var tableView: UITableView = {
       let table = UITableView()
        table.register(NumberTableViewCell.self, forCellReuseIdentifier: NumberTableViewCell.reuseID)
        return table
    }()
    
    
//MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setViews() {
        backgroundColor = .systemBackground
        tableView.backgroundColor = .gray
        addSubviews(tableView)
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
    
}
