function renderWeightPlot() {
    Highcharts.stockChart('weight-plot', {
        chart: {
            zoomType: 'xy'
        },
        title: {
            text: null
        },
        xAxis: {
            type: 'datetime'
        },
        yAxis: {
            title: {
                enabled: false
            }
        },
        legend: {
            enabled: false
        },
        navigator: {
            enabled: true
        },
        rangeSelector: {
            inputEnabled: false
        },
        plotOptions: {
            scatter: {
                marker: {
                    radius: 5,
                    states: {
                        hover: {
                            enabled: true,
                            lineColor: 'rgb(100,100,100)'
                        }
                    }
                },
                states: {
                    hover: {
                        marker: {
                            enabled: false
                        }
                    }
                },
                tooltip: {
                    headerFormat: '<b>{series.name}</b><br>',
                    pointFormat: '{point.x:%m/%d/%y}, {point.y} lb'
                }
            }
        },
        series: [{
            name: 'Weight',
            type: 'scatter',
            color: 'rgba(2, 117, 216, 0.2)',
            data: gon.weight_reports_pounds,
        }, {
            name: 'EMA',
            type: 'line',
            color: 'rgba(2, 117, 216, 0.5)',
            data: gon.weight_exp_avg,
        }]
    });
}
