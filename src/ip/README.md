# IP

## IPv4
Uses 32 binary bits (4 bytes) to create a single unique address on the network.

### Reserved Private Addresses
* 0.0.0.0  the default network;
* 255.255.255.255  reserved for network broadcasts;
* 127.0.0.1  the loopback address;
* 169.254.0.1 to 169.254.255.254  the automatic assigned when unsuccessful
getting an address from DHCP server.


## IPv6
Uses 128 binary bits (16 bytes) to create a single unique address on the network.


## How DHCP Assigns Addresses
* Discover: The device sends out a broadcast message on the network, hoping to 
discover a DHCP service provider.
* Offer: Each DHCP provider hears the message, recognizes the unique hardward address
of the device, and sends a message back offering its services to that device.
* Request: The device selects a DHCP provider from its offering and then sends a 
request to that provider asking for an IP address assignment.
* Acknowledge: The targeted DHCP provider acknowledges the request and issues an IP
address to the device that doesn't match any other IP addresses currently active on 
the network.


## Subnet
IP addresses on a subnet have two parts: network and node. The network part 
identifies the subnet itself. The node, also called the host, is an individual piece 
of computer equipment connected to the network and requiring a unique address.
A subnet is actually just a filter used to determine which part of an IP address 
designates the network and node.
