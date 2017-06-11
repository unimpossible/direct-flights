var express = require('express');
var model = require("../model");
var _ = require("underscore");
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('index', { title: 'Direct Flights' });
});

direct_from = function(req, res, next) {
  console.log(req.params.iata);
  model.getRoutesFromAirport(req.params.iata, function(err, data) {
    res.send(data);
  });
};

get_airports = function(req, res, next) {
  model.getAirports(function(err, data) {
    //res.render('airport_list', {airports: data} );
    res.send(data);
  })
}

router.get('/flights/:iata', direct_from);
router.get('/airports', get_airports);

/* GET home page. */
router.get('/about', function(req, res, next) {
  res.render('about', { title: 'About' });
});

module.exports = router;
