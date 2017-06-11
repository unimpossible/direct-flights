var db = require("./db.js");

exports.getRoutesFromAirport = function(airport, done) {
    db.get().query("SELECT * FROM direct_flights WHERE airport_src = ?", airport, function(err, rows) {
        if (err) return done(err)
        done(null, rows);
    });
}

exports.getAirports = function(done) {
    db.get().query("SELECT name, iata, city FROM airports where iata is not null order by iata", function(err, rows) {
        if (err) return done(err)
        done(null, rows);
    });
}
