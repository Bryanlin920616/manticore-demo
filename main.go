package main

import (
	"context"
	"encoding/json"
	"fmt"
	"os"

	Manticoresearch "github.com/manticoresoftware/manticoresearch-go"
)

func main() {
	searchWenyan()
	println("searchWenyan called")
}

func searchWenyan() {
	// Create an instance of API client
	configuration := Manticoresearch.NewConfiguration()
	configuration.Servers[0].URL = "http://localhost:9308"
	apiClient := Manticoresearch.NewAPIClient(configuration)

	tableName := "wenyan"
	searchRequest := Manticoresearch.NewSearchRequest(tableName)
	searchQuery := Manticoresearch.NewSearchQuery()

	// url查不到，可能是因為indexing segmentation的方式？
	// encodedURL := url.QueryEscape("https://zh.wikisource.org/wiki?curid=276713")
	// searchQuery.QueryString = "@url " + encodedURL

	// encodedURL := url.QueryEscape("羣書考索)") // 似乎是encoding的問題，這段也查不到，應該要查得到的
	// searchQuery.QueryString = "@text 屈原 @title " + encodedURL
	searchQuery.QueryString = "@text 屈原 @title 羣書考索"

	searchRequest.Query = searchQuery

	// Execute search
	resp, _, err := apiClient.SearchAPI.Search(context.Background()).SearchRequest(*searchRequest).Execute()
	if err != nil {
		fmt.Printf("Error executing search: %v\n", err)
		return
	}

	/* Save result to a json file*/
	// Create or open the output JSON file
	file, err := os.Create("search_result.json")
	if err != nil {
		fmt.Printf("Error creating file: %v\n", err)
		return
	}
	defer file.Close()

	// Encode the response to the JSON file
	encoder := json.NewEncoder(file)
	encoder.SetIndent("", "  ") // Pretty-print the JSON with indentation
	if err := encoder.Encode(resp); err != nil {
		fmt.Printf("Error encoding to JSON: %v\n", err)
		return
	}

	fmt.Println("Search results have been saved to search_result.json")
}
