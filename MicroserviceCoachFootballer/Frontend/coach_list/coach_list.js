import {clearElementChildren, createLinkCell, createButtonCell, createTextCell} from '../js/dom_utils.js';
import {getBackendUrl} from '../js/configuration.js';

window.addEventListener('load', () => {
    get_and_show_coaches();
});


function get_and_show_coaches() { 
    const xhttp = new XMLHttpRequest();
    
    xhttp.onreadystatechange = function () 
    {
        if (this.readyState === 4 && this.status === 200) 
        {
            show_coaches(JSON.parse(this.responseText));
        }
    };
    xhttp.open("GET", getBackendUrl() + '/api/coaches', true);
    xhttp.send();
}


function show_coaches(coaches) {
    coaches = coaches.coaches;   
    
    let sendForm = document.getElementById('sendForm');
    clearElementChildren(sendForm); 
    
    coaches.forEach(coach => {
        sendForm.appendChild(create_table_row(coach));       
    })
}


function create_table_row(coach) {
    let tableRow = document.createElement('tr');
    tableRow.appendChild(createTextCell(coach.name));
    tableRow.appendChild(createLinkCell('view', '../coach_view/coach_view.html?coach=' + coach.id));
    tableRow.appendChild(createLinkCell('edit', '../coach_edit/coach_edit.html?coach=' + coach.id));
    tableRow.appendChild(createButtonCell('delete', () => delete_coach(coach)));
    return tableRow;
}


function delete_coach(coach) 
{
   const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 202) 
        {
            get_and_show_coaches()
        }
    };
    xhttp.open("DELETE", getBackendUrl() + '/api/coaches/' + coach.id, true);
    xhttp.send();
    
}
