package main

import "fmt"
import "log"
import "net/http"
import "net/http/httputil"

func hander(w http.ResponseWriter, r *http.Request) {
	dump, err := httputil.DumpRequest(r, true)
	if err != nil {
		http.Error(w, fmt.Sprint(err), http.StatusInternalServerError)
		return
	}

	fmt.Println(string(dump))
	fmt.Fprintf(w, "<html><body>hello</body></html>")
}

func main() {
	var httpServer http.Server
	http.HandleFunc("/", hander)
	log.Println("start http listeing :18888")
	httpServer.Addr = ":18888"
	log.Println(httpServer.ListenAndServe())
}
