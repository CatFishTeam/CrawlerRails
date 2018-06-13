import Chart from 'chart.js';
window.Chart = Chart

var ctx = document.getElementById("myChart");
/*
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
*/

// And for a doughnut chart
if (typeof chartPercent !== 'undefined') {

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
//TODO CHANGE COLOR IN FUNCTION OF RES
}