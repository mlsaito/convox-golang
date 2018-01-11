package main

import (
    "log"
    "net/http"
    "fmt"
    "github.com/gorilla/mux"
)

// our main function
func main() {
    router := mux.NewRouter()
    router.HandleFunc("/", GetHome).Methods("GET")
    log.Fatal(http.ListenAndServe(":8080", router))
}

func GetHome(w http.ResponseWriter, r *http.Request) {
    fmt.Fprint(w, "Hello! Welcome Home!\n")
}
