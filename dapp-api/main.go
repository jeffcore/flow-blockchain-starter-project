package main

import (
	"context"
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/onflow/flow-go-sdk"
	"github.com/onflow/flow-go-sdk/client"
	"github.com/onflow/flow-go-sdk/crypto"
	"google.golang.org/grpc"
)

func main() {
	ctx := context.Background()

	r := gin.Default()

	// sample route
	r.GET("/hello", func(c *gin.Context) {

		// generate a new private key for the account
		// note: this is only an example, please use a secure random generator for the key seed
		seed := []byte("elephant ears space cowboy octopus rodeo potato cannon pineapple")
		privateKey, _ := crypto.GeneratePrivateKey(crypto.ECDSA_P256, seed)

		// get the public key
		publicKey := privateKey.PublicKey()

		c.JSON(http.StatusOK, gin.H{
			"private_key": privateKey.String(),
			"public_key":  publicKey.String(),
		})
	})

	// another sample route
	r.GET("/account", func(c *gin.Context) {
		// connect to an emulator running locally
		flowClient, err := client.New("flow-emulator:3569", grpc.WithInsecure())
		if err != nil {
			panic("failed to connect to emulator")
		}

		// enter your service address from flow.json
		address := flow.HexToAddress("f8d6e0586b0a20c7")
		fmt.Printf("%q\n", address)

		account, err := flowClient.GetAccount(ctx, address)
		if err != nil {
			fmt.Print(err)
			panic("failed to fetch account")
		}

		c.JSON(http.StatusOK, gin.H{
			"account": account.Address.String(),
		})

	})

	r.Run()
}
