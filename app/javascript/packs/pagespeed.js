let $ = require('jquery');

let scoringLoader = document.querySelector('.scoring-loader');

$('form[action="\/scoring\/search"]').submit(function(ev) {
    scoringLoader.innerHTML = `<span class="loader"></span> <span class="loader-message">Selon certains sites, ça peut être long !</span> `;
});