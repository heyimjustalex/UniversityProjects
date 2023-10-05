import {getParameterById} from '../js/dom_utils.js';
import {getBackendUrl} from '../js/configuration.js';

window.addEventListener('load', () => {
    const form = document.getElementById('sendForm');

    form.addEventListener('submit', event => update_coach(event));

    get_and_show_coach();
});


function get_and_show_coach()
{
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200)
        {
            let response = JSON.parse(this.responseText);
            for (const [key, value] of Object.entries(response)) 
            {
                let inp = document.getElementById(key);
                if (inp) 
                {
                    inp.value = value;
                }
            }
        }
    };
    xhttp.open("GET", getBackendUrl() + '/api/coaches/' + getParameterById('coach'), true);
    xhttp.send();
}

function update_coach(event) 
{
    event.preventDefault();
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () 
    {
        if (this.readyState === 4 && this.status === 200) {
            get_and_show_coach();
        }
    };
    
       const request = 
             {
        'name': document.getElementById('name').value,
        'surname': document.getElementById('surname').value,
      
    };    
   
    xhttp.open("PUT", getBackendUrl() + '/api/coaches/' + getParameterById('coach'), true);
    xhttp.setRequestHeader('Content-Type', 'application/json');
    xhttp.send(JSON.stringify(request));
    alert("Success!");
}
