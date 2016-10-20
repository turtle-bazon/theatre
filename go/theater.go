package main

import (
	"math/rand"
	"fmt"
)

const countPlaces = 1000
const countIterations = 100


func iter() bool {
	var result = false
	var places [countPlaces]bool

	var number = rand.Intn(countPlaces)
	places[number] = true;

	for i := 1; i < countPlaces; i++ {
		if places[i] == false {
			if i == countPlaces - 1 {
				result = true
			}
			places[i] = true
		} else {
			for {
				var lnumber = rand.Intn(countPlaces)
				if places[lnumber] == false {
					places[lnumber] = true
					break
				}
			}
		}
	}

	return result
}


func main() {
	var successfulCases = 0;
	for i := 1; i < countIterations; i++ {
		var result = iter()
		if result {
			successfulCases ++;
		}
	}
	fmt.Println(float64(successfulCases) / countIterations)
}
