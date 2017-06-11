var mysql = require('mysql'),
    async = require('async');

var config = require("./config/config")

var state = {
    pool: null,
}

exports.connect = function(done) {
    state.pool = mysql.createPool({
        host: config.db.host,
        user: config.db.user,
        password: config.db.password,
        database: config.db.database,
        port: config.db.port
    });

    done();
}

exports.get = function() {
    return state.pool;
}