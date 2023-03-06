package main

import (
	"fmt"
	"os"

	"github.com/cbot918/y/src/core"
)

const (
	PRINTLN = "println"
	
)



func main(){

	args := os.Args
	if len(args) == 1 { fmt.Println("usage: ./y filename.y"); return  }
	content, err := os.ReadFile(args[1]); if err != nil { panic(err) }

	tokens := core.Scanner(string(content))

	output := core.Gen(tokens)

	build(output)
	
	fmt.Println("tokens: ",tokens)
	fmt.Println("output: ",output)
}

func build(input string){
	err :=os.WriteFile("main.asm",[]byte(input),0666)
	if err != nil { panic(err) }
}