var airData;
var airportNames = {};

renderAirportData = function(data, $select)
{
    $("#airportTable > tbody > tr").remove();

    var options = [];
    $(data).each(function(index, element)
    {
        options.push({
            id: element.iata,
            title: airportNames[element.iata]
        });
    });

    // get the selectize control
    var control = $select[0].selectize;
    control.addOption(options);
    control.refreshOptions();

/* just another way to do this instead of data-target 
    $("#airportTable > tbody > tr").on("click", function(){
        alert($(this).text());
    });
*/
};
var airportsDataCallback = function(data, status, $select)
{
    _.each(data, function(elem) {
        elem.nameUpper = elem.iata.toUpperCase() +"--"+ elem.name.toUpperCase();
        airportNames[elem.iata] = elem.city + ": " + elem.name + " (" + elem.iata + ")";
    });

    renderAirportData(data, $select);
    airData = data;
};

loadFlightsData = function(data, status)
{
    $("#flightTable > tbody > tr").remove();
    data = _.sortBy(data, function(data) { return airportNames[data.airport_dst]; });

    var appendText = [];
    var i = 0;
    $(data).each(function(index, element) {
        appendText[i++] = '<tr><td>';
        appendText[i++] = airportNames[element.airport_dst];
        appendText[i++] = '</td><td>';
        appendText[i++] = element.airline;
        appendText[i++] = "</td></tr>";
    });

    $("#flightTable").append(appendText.join(''));
};

$(function() {
    var $select = $("#airportSearchbox").selectize({
        create: false,
        valueField: 'id',
        labelField: 'title',
        searchField: 'title'
    });

    $.get("airports", function(data, status){
        airportsDataCallback(data, status, $select);
    });

    $select[0].selectize.on("change", function(airportId){
        if(!airportId)
        {
           return; 
        }
        $.get("flights/" + airportId, loadFlightsData);
    });
});
