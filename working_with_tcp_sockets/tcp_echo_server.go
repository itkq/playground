package main

import (
	"net"
)

func main() {
	sockaddr, err := net.ResolveTCPAddr("tcp", ":8080")
	checkError(err)

	listener, err := net.ListenTCP("tcp", sockaddr)
	checkError(err)

	for {
		conn, err := listener.Accept()
		if err != nil {
			panic(err)
		}

		go hander(conn)
	}
}

func hander(conn net.Conn) {
	defer conn.Close()

	buf := make([]byte, 64)
	_, err := conn.Read(buf)
	checkError(err)
	_, err = conn.Write(buf)
	checkError(err)
}

func checkError(err error) {
	if err != nil {
		panic(err)
	}
}
