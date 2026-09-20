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

    Format.println("=== START SERVER ===")

    serverSocket, errSocket := Net.create_socket(.IP4, .TCP)

    Format.println("Create Socket Error: ", errSocket)

    switch serverSocket {
    case serverSocket.(Net.TCP_Socket):

        Format.println("Socket Type: TCP")

        // Server
        serverBind := Net.bind(serverSocket, ServerPoint)
        Format.println("Bind Error: ", serverBind)

        serverListen, listenError := Net.listen_tcp(ServerPoint, 10)

        Format.println("Listen Error: ", listenError)
        Format.println("Listening Endpoint: ", ServerPoint)

        // Client
        Format.println("Waiting for client connection...")

        clientSocket, clientEndpoint, acceptError := Net.accept_tcp(serverListen)

        Format.println("Client Endpoint: ", clientEndpoint)
        Format.println("Accept Error: ", acceptError)

        socketAddress, socketAddressErr := Net.bound_endpoint(serverSocket)

        Format.println("Server Bound Endpoint: ", socketAddress)
        Format.println("Bound Endpoint Error: ", socketAddressErr)

        // Share the same memory, not a copy
        messageToBytes := transmute([]byte)Message

        Format.println("Message: ", Message)
        Format.println("Message Bytes: ", messageToBytes)
        Format.println("Message Length: ", len(messageToBytes))

        seedMessage, errSend := Net.send_tcp(clientSocket, messageToBytes)

        Format.println("Bytes enviados: ", seedMessage)
        Format.println("Error send message: ", errSend)

        Format.println("=== END SERVER ===")
    }
}