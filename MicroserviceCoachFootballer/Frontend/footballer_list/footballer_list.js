import {clearElementChildren, createLinkCell, createButtonCell, createTextCell} from '../js/dom_utils.js';
import {getBackendUrl} from '../js/configuration.js';

window.addEventListener('load', () => {
    get_and_show_footballers();
});


function get_and_show_footballers() { 
    const xhttp = new XMLHttpRequest();
    
    xhttp.onreadystatechange = function () 
    {
        if (this.readyState === 4 && this.status === 200) 
        {
            show_footballers(JSON.parse(this.responseText));
        }
    };
    xhttp.open("GET", getBackendUrl() + '/api/footballers', true);
    xhttp.send();
}


function show_footballers(footballers) {
    footballers = footballers.footballers;   
    console.log(JSON.stringify(footballers))
    let sendForm = document.getElementById('sendForm');
    clearElementChildren(sendForm); 
    
    footballers.forEach(footballer => {
        sendForm.appendChild(create_table_row(footballer));       
    })
}


function create_table_row(footballer) {
    let tableRow = document.createElement('tr');
    console.log(footballer.surname)
    tableRow.appendChild(createTextCell(footballer.name));

    tableRow.appendChild(createTextCell(footballer.position));
    tableRow.appendChild(createLinkCell('view', '../footballer_view/footballer_view.html?footballer=' + footballer.id));
    tableRow.appendChild(createLinkCell('edit', '../footballer_edit/footballer_edit.html?footballer=' + footballer.id));
    tableRow.appendChild(createButtonCell('delete', () => delete_footballer(footballer)));
    return tableRow;
}


function delete_footballer(footballer) 
{
   const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 202) 
        {
            get_and_show_footballers()
        }
    };
    xhttp.open("DELETE", getBackendUrl() + '/api/footballers/' + footballer.id, true);
    xhttp.send();
    
}
