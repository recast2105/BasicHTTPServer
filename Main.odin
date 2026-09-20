package main

import Format "core:fmt"
import Net "core:net"

import Server "src/server"
import Client "src/client"

ServerPoint := Net.Endpoint {
    address = Net.IP4_Loopback,
    port = 5353,
}

Message := "Hellope"

main :: proc() {

    // SERVER
    serverSocket, listenError := Server.Listen(ServerPoint)

    Format.println("Listen Error: ", listenError)

    if listenError != nil {
        return
    }

    // CLIENT
    clientSocket, connectError := Client.Connect(ServerPoint)

    Format.println("Connect Error: ", connectError)

    if connectError != nil {
        return
    }

    // SERVER ACCEPT
    acceptedSocket, clientEndpoint, acceptError := Server.Accept(serverSocket)

    Format.println("Client Endpoint: ", clientEndpoint)
    Format.println("Accept Error: ", acceptError)

    if acceptError != nil {
        return
    }

    // SERVER SEND
    messageToBytes := transmute([]byte)Message

    bytesSent, sendError := Server.Send(acceptedSocket, messageToBytes)

    Format.println("Bytes enviados: ", bytesSent)
    Format.println("Send Error: ", sendError)

    // CLIENT RECEIVE
    buffer: [1024]byte

    bytesReceived, receiveError := Client.Receive(clientSocket, buffer[:])

    Format.println("Bytes recebidos: ", bytesReceived)
    Format.println("Receive Error: ", receiveError)

    if bytesReceived > 0 {
        Format.println("Mensagem recebida: ", string(buffer[:bytesReceived]))
    }
}