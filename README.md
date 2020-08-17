With regards to testing, unit testing and integration tests for web apps are straight forward. When you want to do integration testing, just use http/grpc/generic-protocol to the services. However, how do you test that the server's internals are working correctly?

This repo is an attempt at running integration tests on a server.

So far, my main idea is to take a binary, scp it onto a server, and execute the binary with ssh. The binary will output to stdout, which can be returned back to the local machine.

```
~/src/github.com/trungng92/ssh-binary-test (master ✘)✭ ᐅ ./run-binary-remotely.sh $IDENTITY_FILE $SSH_USER $SERVER
Compiling the binary
scping the binary to the server
test-bin                                                                                                   100% 1955KB 325.2KB/s   00:06
executing remote binary with ssh
Hello, world.
```
