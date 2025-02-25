package main

import (
	"context"
	"fmt"

	Manticoresearch "github.com/manticoresoftware/manticoresearch-go"
)

func main() {

	// Create an instance of API client
	configuration := Manticoresearch.NewConfiguration()
	configuration.Servers[0].URL = "http://localhost:9308"
	apiClient := Manticoresearch.NewAPIClient(configuration)

	// Perform insert and search operations
	tableName := "products"
	indexDoc := map[string]interface{}{"title": "Crossbody Bag with Tassel"}
	indexReq := Manticoresearch.NewInsertDocumentRequest(tableName, indexDoc)
	indexReq.SetId(1)

	apiClient.IndexAPI.Insert(context.Background()).InsertDocumentRequest(*indexReq).Execute()

	searchRequest := Manticoresearch.NewSearchRequest(tableName)
	searchQuery := Manticoresearch.NewSearchQuery()
	searchQuery.QueryString = "@title Bag"
	searchRequest.Query = searchQuery
	queryHighlight := Manticoresearch.NewHighlight()
	queryHighlight.Fields = map[string]interface{}{"title": map[string]interface{}{}}
	searchRequest.Highlight = queryHighlight

	_, httpRes, _ := apiClient.SearchAPI.Search(context.Background()).SearchRequest(*searchRequest).Execute()
	fmt.Printf("%+v\n\n", httpRes)
}
