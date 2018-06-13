let $ = require('jquery');

let url = findGetParameter('url');

console.log('scoring');

let urlForm = document.querySelector('#urlForm');
let resultArea = document.querySelector('.result');

if (url) {
    urlForm.value = url;
    resultArea.innerHTML = `<div class="loader"></div>`;
    fetch("https://www.googleapis.com/pagespeedonline/v4/runPagespeed?url="+ url +"&key=AIzaSyCJtYr2YA84j56a81uk_WQSuIfR1z0ebvA")
        .then(response => response.json())
        .then(data => {
            console.log(data);
            if (data.error) {
                resultArea.innerHTML = data.error.message;
            } else if (data.responseCode && data.responseCode === 200) {
                resultArea.innerHTML = `Score : ${data.ruleGroups.SPEED.score} / 100`;
            }
            $.ajax({
                url : "/",
                type : "get",
                data : { data: JSON.stringify(data) }
            });
        });
}

function findGetParameter(parameterName) {
    let result = null,
        tmp = [];
    location.search
        .substr(1)
        .split("&")
        .forEach(function (item) {
            tmp = item.split("=");
            if (tmp[0] === parameterName) result = decodeURIComponent(tmp[1]);
        });
    return result;
}