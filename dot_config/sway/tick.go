package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"os"
	"strconv"
	"time"
)

const cachePath = "/tmp/gmetick"

type Tick struct {
	YesterdayPrice float64 `json:"regularMarketPreviousClose"`
	Time           int64   `json:"regularMarketTime"`
	Price          float64 `json:"regularMarketPrice"`
}

func (t Tick) Outdated() bool {
	diff := time.Now().Unix() - t.Time
	maxDiff := int64((5 * time.Minute).Seconds())

	return diff > maxDiff
}

func (t Tick) Positive() bool {
	return t.Price > t.YesterdayPrice
}

func (t Tick) String() string {
	return fmt.Sprintf("%s", strconv.FormatFloat(t.Price, 'f', -1, 64))
}

func (t Tick) Print() {
	var sign string
	
	if t.Positive() {
		sign = "🚀"
	} else {
		sign = "💤"
	}
	
	fmt.Fprintf(os.Stdout, "%s%s", sign, t)
}

func FetchCache() (cache Tick) {
	f, err := os.Open(cachePath)
	if err != nil {
		return Tick{}
	}

	result, _ := ioutil.ReadAll(f)

	err = json.Unmarshal(result, &cache)
	if err != nil {
		return Tick{}
	}

	return cache
}

func SaveCache(tick Tick) {
	f, _ := os.Create(cachePath)
	defer func() {
		_ = f.Close()
	}()

	data, _ := json.Marshal(tick)

	_, _ = f.Write(data)
}

type Response struct {
	QuoteResponse struct{ Result []Tick `json:"result"` } `json:"quoteResponse"`
}

func FetchTick() (Tick, error) {
	url := "https://query1.finance.yahoo.com/v7/finance/quote?lang=en-US&region=US&corsDomain=finance.yahoo.com&symbols=GME"

	res, err := http.Get(url)
	if err != nil {
		return Tick{}, err
	}

	data, err := ioutil.ReadAll(res.Body)
	if err != nil {
		return Tick{}, err
	}
	
	var response Response

	err = json.Unmarshal(data, &response)
	if err != nil {
		return Tick{}, err
	}

	return response.QuoteResponse.Result[0], nil
}

func main() {
	cache := FetchCache()

	if !cache.Outdated() {
		cache.Print()

		os.Exit(0)
	}

	tick, err := FetchTick()
	if err != nil {
		log.Fatal(err)
	}

	SaveCache(tick)

	tick.Print()
}
