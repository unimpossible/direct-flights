const csv = require('csvtojson')
const fs = require("fs")
const request = require("request")

airport_headers = ["airport_id", "name", "city", "country", "iata", "icao", "lat", "lng", "altitude", "tz", "dst", "tz_db", "type", "source"];
routes_headers = ["airline", "airline_id", "airport_src", "airport_src_id", "airport_dst", "airport_dst_id", "codeshare", "stops", "equipment"];
airlines_headers = ["airline_id", "name", "alias", "iata", "icaoo", "callsign", "country", "active"];

SORT_AIRPORT = "iata"
SORT_ROUTES = "airline"
SORT_AIRLINES = "name"

function sortByKey(array, key) {
    return array.sort(function(a, b) {
        var x = a[key]; var y = b[key];
        return ((x < y) ? -1 : ((x > y) ? 1 : 0));
    });
}

function get_data(url, filename, headers, sortKey) {
    csv({headers:headers})
    //.fromFile(url)
    .fromStream(request.get(url))
    .on("end_parsed",function(arr){
        arr_sorted = sortByKey(arr, sortKey);
        fs.writeFile(filename + ".json", JSON.stringify(arr_sorted), function(error) {
            if (error) {
                    console.error("file write error: " + error.message);
            } else {
                console.log("done: " + filename);
            }
        });
    })
}

get_data("https://raw.githubusercontent.com/jpatokal/openflights/master/data/airports.dat", "airports", airport_headers, SORT_AIRPORT);
get_data("https://raw.githubusercontent.com/jpatokal/openflights/master/data/routes.dat", "routes", routes_headers, SORT_ROUTES);
get_data("https://raw.githubusercontent.com/jpatokal/openflights/master/data/airlines.dat", "airlines", airlines_headers, SORT_AIRLINES);