
    let para = document.createElement('p');
    para.style.color = 'red';
    para.textContent = "Hey I'm red!";

    document.querySelector("#container").appendChild(para);


    let blueHeading = document.createElement('h3');
    blueHeading.style.cssText = 'color:blue';
    blueHeading.innerHTML = "I'm a blue H3!";
    document.querySelector('#container').appendChild(blueHeading);


    let newDiv = document.createElement('div');
    newDiv.style.cssText = 'background-color:pink; border: black 2px solid';
    newDiv.classList.add('pinkDiv');

    let divHeading = document.createElement('h1');
    divHeading.textContent = "I'm in a div";

    let divcontent = document.createElement('p');
    divcontent.textContent = "ME TOO!";

    newDiv.appendChild(divHeading);
    newDiv.appendChild(divcontent);

    document.querySelector('body').appendChild(newDiv);

    let button = document.getElementById('btn');
    button.onclick = function(e){
        e.target.style.background = 'blue'; 
    }