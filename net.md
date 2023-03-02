# Network

****
## Basics
**Main**
- Source
- Message
- Destination

**Complementary**
- Transmitter
- Channel
- Signal
- Receiver
- Noise

`Source` =Message=> `Transmitter` =Signal(Noise)=> `Receiver` =Message=> `Destination`

****
## Legend
`Unicast` (One to one)
`Broadcast` (One to all)
`Multicast` (One to any that expects a message)
`Anycast` (One to the most suitable)

`Hypertext transfer protocol` (HTTP)
`Transport Layer Security` (TLS) - Encrypts data.
`Domain name system protocol` (DNS) - Find the IP adress of the domain name

`Transmission control protocol` (TCP)
Establishes a reliable connection and if anything is lost both parts will get notified.
Commonly used for websites.
`User datagram protocol` (UDP)
Tries to reach its destination but does not maintain a connection and does not notify if anything is lost.
Commonly used for games.

`Internet protocol` (IPv4 or IPv6)
`Adress resolution protocol` (ARP)
`CSMA` (Carrier Sence Multiple Access)
`Ethernet`

`SMTP` (Simple Mail Transfer)
`POP` (Post Office)
`IMAP` (Internet Message Access)

****
## OSI - The Open Systems Interconnection Basic Reference Model
7 Layer model
4-7: Kommunicerar direkt mellan varandra.
1-3: Kommunicerar inte nödvändigtvis mellan varandra utan kan finnas flera datorer emellan.

**Layers**
1. Physical
2. Data Link (Local)
    - `CSMA/CD` Before casting a message it checks if any of the computers are already talking.
    - `CSMA/CA` Asks the access point before casting a message to avoidance collision.
    - `MAC Adress` Local communication
    - `Ethernet frame` Local communication
3. Network
    - Routing protocol
    - End-to-end encryption
    - IP adress
4. Transport
    - Connections (TCP or UDP(Connectionless))
    - Message segmentation
    - Error & flow handling
5. Session
    - Establish
    - Manage
    - Terminate
    - `Duplex` Both can communicate at the same time.
    - `Simplex` Only one computer can send a message.
    - `Half Duplex` Both can send a message but only one computer at a time.
6. Presentation
    - Encoding
7. Application
    - Communicates with the application through a protocol.

****
## HTTP
`Text-based`

`Client` requests
`Server` responds

`Stateless` or `no session` and no built-in `security`.

Can be `stateful` with use of cookies.

### Headers
**User-Agent**
Identifying the client (do not trust, can easily be changed).

**Server**
Identifying the server (do not trust, can easily be changed and should be to throw of any script attacks).

### Status Codes
`100` - `199` Informational responses
`200` - `299` Successful responses
`300` - `399` Redirection messages
`400` - `499` Client error responses
`500` - `599` Server error responses

Read more @ [MDN/HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP)

****
## TCP/IP
### Application Layer
**HTTP**
The application starts here and creates a `request` to get the page `hello.html` using HTTP.

```http
GET /hello.html HTTP/1.1
User-Agent: Mozilla/5.0         (product/product-version)
Accept: application/json,*/*    (json or any.)
Accept-Encoding: identity       (no modifications or encoding.)
Host: developer.mozilla.org     (host:port/dns)
Connection: Keep-Alive
```

### Transport Layer
**TCP**
After the `request` is created a `connection` is established that is used to send the HTTP `request`.

```js
Src Port: 44712     Seq: 1      Len: 175
Dst Port: 80        Ack: 1      Flags: ACK
```

### Network (Internet) Layer
**IP**
Here the data is sent over the `Internet Protocol (IP)` to get the data from one network to the other.

```js
Version: 4
Time to live: 64    // each router will lower this by one.
Protocol: TCP (6)
Src: 192.168.1.2    // transmitter.
Dst: 192.158.30.16  // reciever.
```

### Data-Link Layer
**Ethernet**
Handles transfering data between nodes on the same network segment using MAC-adresses. (Most often same physical network.)

```js
Src: 60:6c:66:1e:cf:d5
Dst: e8:08:8b:5a:df:82
Type: IP (0x0800)
```

`The physical layer is not always present and may sometimes be baked in to the data link layer.`

****
## 3- Way Handshake
**My Application**
```js
Src Port: 44712     Seq: 0    Len: 0
Dst Port: 80                  Flags: SYN
```

**Server**
```js
Src Port: 80        Seq: 0    Len: 0
Dst Port: 44712     Ack: 1    Flags: SYN, ACK
```

**My application**:
```js
Src Port: 44712     Seq: 1    Len: 0
Dst Port: 80        Ack: 1    Flags: ACK
```

****
## Networks and hosts
If you know 3 of these you can make out the last one.
```js
Address: 11000000 10101000 00000001 00000010 (192.168.1.2)
Netmask: 11111111 11111111 11111111 00000000 (255.255.255.0)
Network: 11000000 10101000 00000001 00000000 (192.168.1.0)
Host:    00000000 00000000 00000000 00000010 (0.0.0.2)
```
