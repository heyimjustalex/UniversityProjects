import {getParameterById} from '../js/dom_utils.js';
import {getBackendUrl} from '../js/configuration.js';


window.addEventListener('load', (event) => {
  var form = document.getElementById('sendForm');
    form.addEventListener('submit', event => create_footballer(event));

    
});




function create_footballer(event) {
    event.preventDefault();

    const xhttp = new XMLHttpRequest();
    xhttp.open("POST", getBackendUrl() + '/api/footballers', false);
    
    if (document.getElementById('name').value == "" || document.getElementById('surname').value ==  "" || document.getElementById('position') == "" || document.getElementById('coach_id')=="") 
    {
        alert("Insert valid values");
        
    } 
    else 
    {
        var request = {
            'name': document.getElementById('name').value,
            'surname': document.getElementById('surname').value,
            'position': document.getElementById('position').value,
            'coach': document.getElementById('coach_id').value,
        };
        
        xhttp.setRequestHeader('Content-Type', 'application/json');
        //console.log(JSON.stringify(request))
      
        xhttp.onreadystatechange=function(){
            
                    if (this.status == 500)
                        {
                            alert("bad coach id");
                        }
                   if(this.status==201){
                        alert("success footballer added")
                    }
                    else
                        {
                            alert("Other error")
                        }
                
        } 
        xhttp.send(JSON.stringify(request));
      
    
        
   
        
    }
    

}