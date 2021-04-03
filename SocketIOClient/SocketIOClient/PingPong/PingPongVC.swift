import UIKit
import SocketIO

class PingPongVC: UIViewController
{
    
    let manager = SocketManager(socketURL: URL(string: "http://0.0.0.0:8000")!,config: [.log(false), .compress, .forceWebsockets(true), .forceNew(true)])
    
    var socket:SocketIOClient!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        socket = manager.defaultSocket;
        setSocketEvents();
        socket.connect();
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        socket.disconnect()
    }
    private func setSocketEvents()
    {
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected");
            let msg: [String: String]  = ["text": "Ping from Client",
                                          "demo": "10"]
            self.socket.emit("ping_from_client", with: [msg])
        };
        
        socket.on("pong_from_server") {data, ack in
            print(data)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                let msg: [String: String]  = ["text": "Thùy, Mão, Mai, Cương, Thanh",
                                              "demo": "10",
                                              "fun": "Hello"]
                //self.socket.emit("ping_from_client", with: [msg])
            }
            
        };
    };
    
    
};
