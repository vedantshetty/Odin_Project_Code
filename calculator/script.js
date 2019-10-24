"use strict"
let screen ='';
const add =(a,b)=>a+b;
const subtract=(a,b)=>a-b;
const multiply=(a,b)=>a*b;
const divide=(a,b)=>a/b;

const evaluator= val=>{
    screen+=val;
    console.log(screen);
}
function operate(operator,a,b){
    switch(operator){
        case '+':
            add(a,b);
            break;
        case '-':
            subtract(a,b);
            break;
        case '*':
            multiply(a,b);
            break;
        case '/':
            divide(a,b);
            break;
    }


}

/*
* Add an onclick listener on the equal button. Which evaluates everything on the screen
* Add list
*/