import {getParameterById} from '../js/dom_utils.js';
import {getBackendUrl} from '../js/configuration.js';

window.addEventListener('load', () => {
    const form = document.getElementById('sendForm');

    form.addEventListener('submit', event => update_footballer(event));

    get_and_show_footballer();
});


function get_and_show_footballer()
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
    xhttp.open("GET", getBackendUrl() + '/api/footballers/' + getParameterById('footballer'), true);
    xhttp.send();
}

function update_footballer(event) 
{
    event.preventDefault();
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () 
    {
        if (this.readyState === 4 && this.status === 200) {
            get_and_show_footballer();
        }
    };
    
       const request = 
             {
        'name': document.getElementById('name').value,
        'surname': document.getElementById('surname').value,
        'position':document.getElementById('position').value
      
    };    
   
    xhttp.open("PUT", getBackendUrl() + '/api/footballers/' + getParameterById('footballer'), true);
    xhttp.setRequestHeader('Content-Type', 'application/json');
    xhttp.send(JSON.stringify(request));
    alert("Success!");
}
