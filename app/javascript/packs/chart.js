import Chart from 'chart.js';
window.Chart = Chart

var ctx = document.getElementById("myChart");
var chartSpiderCtx = document.getElementById("chartSpider");

// And for a doughnut chart
if (typeof chartPercent !== undefined) {
    var myChart = new Chart(ctx, {
        type:"doughnut",
        data: {
            datasets:[{
                data:[chartPercent,  100 - chartPercent],
                backgroundColor:["rgb(0, 102, 204)"]
            }]
        },
        options:{
            tooltips: {
                callbacks: {
                    label: function(tooltipItem, data) {
                        var label = ' ' + data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index] + '%';
                        return label;
                    }
                }
            },
            animation: {
                //easing: 'easeInElastic',
            },
        }
    });
}

var chartSpider = new Chart(chartSpiderCtx, {
    type:"doughnut",
    data: {
        datasets:[{
            data: data,
            backgroundColor:["rgb(0, 102, 204)"]
        }],

        labels: labels
    }
});