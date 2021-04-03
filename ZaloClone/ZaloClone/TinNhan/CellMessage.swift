import UIKit
import Stevia
class CellMessage: UITableViewCell {
    let avatar = UIImageView()
    let rightView = UIView()
    
    let name = UILabel()
    let short_msg = UILabel()
    let time_before = UILabel()
    let badget = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        sv(
            avatar,
            rightView.sv(
                name,
                short_msg,
                time_before,
                badget)
        )
        self.height(90)
        
        
        //Tạo ra một ảnh hình tròn
        avatar.size(80).centerVertically()
        //align(horizontally: |-20-avatar-name-20-|)
        avatar.layer.cornerRadius = 40
        avatar.clipsToBounds = true
        
        layout(
            |-12-avatar-6-rightView-12-|
        )
        
        rightView.layout(
            |-name-(>=10)-time_before-| ~ 30,
            5,
            |-short_msg-(>=10)-badget.height(15)-| ~ 30
        )
        
        badget.textColor = UIColor.white
        badget.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        badget.textAlignment = .center
        badget.backgroundColor = UIColor.red
        badget.layer.cornerRadius = 6.0
        badget.clipsToBounds = true
    }
    
    func setMessage(message: Message) {
        avatar.image = message.avatar
        name.text = message.name
        short_msg.text = message.short_msg
        time_before.text = message.time_before
        badget.text = message.badget
        
        if message.badget.count > 0 {
            name.style(boldStyle)
            short_msg.style(boldStyle)
            time_before.style(boldStyle)
            badget.width(15)
        } else {
            name.style(normalStyle)
            short_msg.style(normalStyle)
            time_before.style(normalStyle)
            badget.width(0)
        }
    }
    
    func boldStyle(label: UILabel) {
        label.font = UIFont.systemFont(ofSize: label.font.pointSize, weight: .bold)
    }
    
    func normalStyle(label: UILabel) {
        label.font = UIFont.systemFont(ofSize: label.font.pointSize, weight: .regular)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
