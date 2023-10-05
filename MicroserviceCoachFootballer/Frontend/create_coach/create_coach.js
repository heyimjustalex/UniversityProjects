import {getParameterById} from '../js/dom_utils.js';
import {getBackendUrl} from '../js/configuration.js';


window.addEventListener('load', (event) => 
{
   var form = document.getElementById('sendForm');
   form.addEventListener('submit', event => create_coach(event));

    
});


function create_coach(event) 
{
    event.preventDefault();

    const xhttp = new XMLHttpRequest();
    xhttp.open("POST", getBackendUrl() + '/api/coaches', false);
    
    if (document.getElementById('name').value == "" || document.getElementById('surname').value ==  "") 
    {
        alert("Insert valid values");
        
    } 
    else 
    {
        var request = {
            'name': document.getElementById('name').value,
            'surname': document.getElementById('surname').value
        };
        xhttp.setRequestHeader('Content-Type', 'application/json');
        xhttp.send(JSON.stringify(request)); 
        console.log("success")
        
    }
    

}