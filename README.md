Clone the fetch-block repo to
```
$ $GOPATH/src/github.com/hyperledger/
```
using
```
git clone https://github.com/cendhu/fetch-block
```

To compile the fetch-block tool, run the following command
_NOTE:_ this requires `govendor` to be in the `$PATH`

```
$ cd fetch-block
```

```
make
```


After successful compilation, we can run the tool using ```$ ./fetch-block``` 

Default configurations are given in `config.yaml`.

A sample `config.yaml` looks like,
```
peer:
    id: peer0
    event-address: 127.0.0.1:7053
msp:
    path: /full/path/to/crypto-config/peerOrganizations/org0.example.com/users/Admin@org0.example.com/msp
    localMspId: Org0MSP
tls:
    enabled: true
    cert:
        file: /full/path/to/crypto-config/peerOrganizations/org0.example.com/users/Admin@org0.example.com/tls/server.crt
    key:
        file: /full/path/to/crypto-config/peerOrganizations/org0.example.com/users/Admin@org0.example.com/tls/server.key
    rootcert:
        file: /full/path/to/crypto-config/peerOrganizations/org0.example.com/users/Admin@org0.example.com/tls/ca.crt
    serverhostoverride: peer0
```

Update config file as required. Make sure that the peer and fetch-block use the same MSP configuration.

When we start executing transaction on blockchain, each block is stroed in a file (with name ChannelId_blk#.json) as JSON format.

In order to collect read/write set for each transaction, please replace `fabric/events/producer/eventhelper.go` with `fetch-block/events/producer/eventhelper.go` and recompile peer.

Refer to https://blockchain-fabric.blogspot.in/ for understanding the block structure.
