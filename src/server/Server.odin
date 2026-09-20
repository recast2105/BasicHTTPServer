package Server

import Net "core:net"

Listen :: proc(endpoint: Net.Endpoint) -> (Net.TCP_Socket, Net.Network_Error) {
    return Net.listen_tcp(endpoint, 10)
}

Accept :: proc(socket: Net.TCP_Socket) -> (Net.TCP_Socket, Net.Endpoint, Net.Accept_Error) {
    return Net.accept_tcp(socket)
}

Send :: proc(socket: Net.TCP_Socket, message: []byte) -> (int, Net.Network_Error) {
    return Net.send_tcp(socket, message)
}