package Main

import Format "core:fmt"
import Net "core:net"

SERVER_ADDRESS :: Net.IP4_Loopback

Server := Net.Host {
    hostname = "Server - Default Test",
    port = 80,
}

ServerPoint := Net.Endpoint {
    address = Net.IP4_Loopback,
    port = 5353,
}

Point2 := Net.Endpoint {
    address = Net.IP4_Loopback,
    port = 5354,
}

Message := "Hellope"

main :: proc() {

    serverSocket, errSocket := Net.create_socket(.IP4, .TCP)

    Format.println("Error Status: ", errSocket)

    switch serverSocket {
    case serverSocket.(Net.TCP_Socket):
        // Server
        serverBind := Net.bind(serverSocket, ServerPoint)
        serverListen, _ := Net.listen_tcp(ServerPoint, 10)

        // Client
        clientSocket, _, _ := Net.accept_tcp(serverListen)

        socketAddress, socketAddressErr := Net.bound_endpoint(serverSocket)

        // Share the same memory, not a copy
        messageToBytes := transmute([]byte)Message

        seedMessage, errSend := Net.send_tcp(clientSocket, messageToBytes)
        Format.println("Bytes enviados: ", seedMessage)
        Format.println("Error send message: ", errSend)
    }
}