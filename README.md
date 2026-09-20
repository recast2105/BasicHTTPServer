<h1> Undestand the request of http requirements </h1>
    
## What is TCP/IP Protocol ?

<p style="font-size: 15px; font-weight: bold;">TCP - Transmission Control Protocol </p>

<p style="font-size: 15px; font-weight: bold;">IP - Internet Protocol </p>

**Security**: Highly Reliable, Slow

- Common Message Format
- Message Length, Actual Data, Sender Address, Receiver Address.
    - Break message into small data units **Segments** handle all to **IP**

## TCP/IP - Network Model

<p style="font-size: 15px; font-weight: bold;">Is design to suport network communication.</p>

- Consists of numerous protocols with different layers.
    - **Application**: HTTP | FTP | DNS | POP - **Application Message**
    - **Transport**: TCP | UDP - **TCP Segment/UDP DataGram**
    - **Network**: IP | ICMP | ARP - **IP Packet**
    - **Data Link**: Ethernet - **Ethernet Frame** 
    - **Physical**: Ethernet - **Ethernet Frame**
 

## What is a Socket ?

 <p style="font-size: 15px; font-weight: bold;"> Is a abstraction provide by operating systems to enable communication between different processes, either on the same machine or over the network</p>

### How it works ?

- Two points/Two way communication channel that need to talk to each other over the internet or a local network.
    - Each side of the communication will create a **Socket**
- Socket: **IP Address & Port Number**
    - **Socket Address** is the combination of both


## Resource research

- Youtube:
    - TechTerms - [Video](https://www.youtube.com/watch?v=2QGgEk20RXM)
    - The Coding Gopher - [Video](https://www.youtube.com/watch?v=D26sUZ6DHNQ)

### Obs: 

<p> Study project the fundamental of networking.
