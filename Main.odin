package Main

import Format "core:fmt"
import Net "core:net"

ServerPoint := Net.Endpoint {
    address = Net.IP4_Loopback,
    port = 5353,
}

Message := "Hellope"

main :: proc() {

    // SERVER

    serverSocket, listenError := Net.listen_tcp(ServerPoint, 10)

    Format.println("Listen Error: ", listenError)

    if listenError != nil {
        return
    }

    Format.println("Server listening on: ", ServerPoint)

    // CLIENT

    clientSocket, connectError := Net.dial_tcp(ServerPoint)

    Format.println("Connect Error: ", connectError)

    if connectError != nil {
        return
    }

    // SERVER ACCEPT

    acceptedSocket, clientEndpoint, acceptError := Net.accept_tcp(serverSocket)

    Format.println("Client Endpoint: ", clientEndpoint)
    Format.println("Accept Error: ", acceptError)

    if acceptError != nil {
        return
    }

    // SERVER SEND

    messageToBytes := transmute([]byte)Message

    bytesSent, sendError := Net.send_tcp(
        acceptedSocket,
        messageToBytes,
    )

    Format.println("Bytes enviados: ", bytesSent)
    Format.println("Send Error: ", sendError)


    // CLIENT RECEIVE

    buffer: [1024]byte

    bytesReceived, receiveError := Net.recv_tcp(
        clientSocket,
        buffer[:],
    )

    Format.println("Bytes recebidos: ", bytesReceived)
    Format.println("Receive Error: ", receiveError)

    if bytesReceived > 0 {
        Format.println("Mensagem recebida: ", string(buffer[:bytesReceived]))
    }
}