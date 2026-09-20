package Client

import Net "core:net"

Connect :: proc(endpoint: Net.Endpoint) -> (Net.TCP_Socket, Net.Network_Error) {
    return Net.dial_tcp(endpoint)
}

Receive :: proc(socket: Net.TCP_Socket, buffer: []byte) -> (int, Net.Network_Error) {
    return Net.recv_tcp(socket, buffer)
}