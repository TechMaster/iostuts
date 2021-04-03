import UIKit
import SocketIO
class LatencyVC: UIViewController {

    let manager = SocketManager(socketURL: URL(string: "http://127.0.0.1:8000")!,config: [.log(false), .compress, .forceWebsockets(true), .forceNew(true)])
    
    var socket:SocketIOClient!
    var start: Double = 0

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
            self.start = CFAbsoluteTimeGetCurrent()
            self.socket.emit("ping_from_client", with: ["Ping from Client"])
        };
        
        socket.on("pong_from_server") {data, ack in
            let diff = CFAbsoluteTimeGetCurrent() - self.start
            print(diff)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.start = CFAbsoluteTimeGetCurrent()
                self.socket.emit("ping_from_client", with: ["Ping from Client"])
            }
            
        };
    };
    
}
