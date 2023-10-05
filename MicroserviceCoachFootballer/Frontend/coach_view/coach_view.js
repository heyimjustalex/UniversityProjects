import {
    getParameterById,
    clearElementChildren,
    createLinkCell,
    createButtonCell,
    createTextCell,
    createImageCell,
    setTextNode
} from '../js/dom_utils.js';
import {getBackendUrl} from '../js/configuration.js';

window.addEventListener('load', () => {
    create_footballer_link();
    get_and_show_footballers();
    get_and_show_coach();
});

function create_footballer_link() 
{
    const lnk = document.getElementById('footballer_link');
    lnk.appendChild(createLinkCell('create', '../create_coach/create_coach.html?coach=' + getParameterById('coach')));
    
}


function get_and_show_footballers() {
       
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            show_footballers(JSON.parse(this.responseText))
        }
    };

    xhttp.open("GET", getBackendUrl() + '/api/coaches/' + getParameterById('coach') + '/footballers', true);
    xhttp.send();
}


function show_footballers(footballers) 
{
    footballers = footballers.footballers;
    let sendForm = document.getElementById('sendForm');
    clearElementChildren(sendForm);
    footballers.forEach(footballer => {
        sendForm.appendChild(create_table_row(footballer));
    })
}


function create_table_row(footballer) {
    let tr = document.createElement('tr');
    tr.appendChild(createTextCell(footballer.name));
       tr.appendChild(createTextCell(footballer.position));
    tr.appendChild(createLinkCell('edit', '../footballer_edit/footballer_edit.html?coach=' + getParameterById('coach') + '&footballer=' + footballer.id));
    tr.appendChild(createButtonCell('delete', () => delete_footballer(footballer.id)));
    return tr;
}


function delete_footballer(id) {
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 202) {
            get_and_show_footballers()();
        }
    };
    xhttp.open("DELETE", getBackendUrl() + '/api/footballers/' + id, true);
    xhttp.send();
}


function get_and_show_coach() {    
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            show_coach(JSON.parse(this.responseText))
        }
    };
    xhttp.open("GET", getBackendUrl() + '/api/coaches/' + getParameterById('coach'), true);
    xhttp.send();
}


function show_coach(coach) {
    setTextNode('name', coach.name);
    setTextNode('surname', coach.surname);
}
