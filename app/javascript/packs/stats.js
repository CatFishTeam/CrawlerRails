import Chart from 'chart.js'

function randomScalingFactor(){
    return Math.floor(Math.random() * 51) + 50;
}

var config = {
    type: 'line',
    data: {
        labels: labels,
        datasets: [{
            label: 'Score',
            fill: false,
            backgroundColor: '#3498db',
            borderColor: '#3498db',
            data: scoresPerf,
        }, {
            label: 'Spider',
            fill: false,
            backgroundColor: '#27ae60',
            borderColor: '#27ae60',
            data: scoresSpider,
        }, {
            label: 'W3C',
            backgroundColor: '#e74c3c',
            borderColor: '#e74c3c',
            fill: false,
            data: scoresW3C,
        }]
    },
    options: {
        responsive: true,
        title: {
            display: true,
            text: 'Your stats over the time'
        },
        tooltips: {
            mode: 'index',
            intersect: false,
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'Days'
                }
            }],
            yAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'Value'
                }
            }]
        }
    }
};

window.onload = function() {
    var ctx = document.getElementById('stats')
    window.myLine = new Chart(ctx, config);
};
	