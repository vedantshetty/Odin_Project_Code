function computerPlay(){
    let choices =['Rock','Paper','Scissor'];
    let seed = Math.floor(Math.random()*3);
    return choices[seed];
}


function playRound(playerSelection,computerSelection){
    let winner = ['RockScissor','ScissorPaper','PaperRock'];
    let choices = playerSelection+computerSelection;
    if (choices ==winner[0]||choices == winner[1]|| choices ==winner[2])
        return [`Congrats! You win,${playerSelection} beats ${computerSelection}`,1];

    else if(playerSelection ==computerSelection)
    {
        return [`${playerSelection}, ${computerSelection} It\'s a draw`,0];
    }
    else 
        return [`You Lose! ${computerSelection} beats ${playerSelection}`,-1];
}

function game(e){
    let playerChoice = e.target.className;
    let [resultMessage, roundScore] =playRound(playerChoice,computerPlay());
    roundsPlayed++;
    alert(resultMessage);
    if (roundScore == 0) roundsPlayed--;
    else if (roundScore == 1) UserScore++;
    displayScore(`${UserScore}-${roundsPlayed-UserScore}`);
    if(UserScore == 5 || roundsPlayed-UserScore == 5) endGame();
}

function endGame(){

    let buttons = document.querySelectorAll('button');
    buttons.forEach((choice) => {
        choice.removeEventListener('click', game)
    })

    let choice_section = document.querySelector('.choiceSection');
    if(UserScore==5) choice_section.textContent = 'Congrats!! You Win.';
    else choice_section.textContent = 'Try again Next time.';
    styleClosingText(choice_section);
}

function styleClosingText(choice_section){
    choice_section.style.color = 'green';
    choice_section.style.fontSize = '32px';
    choice_section.style.textAlign ='center';
    choice_section.style.fontWeight = '800';
}

function displayScore(score){
    let scoreboard = document.querySelector('.scoreboard');
    scoreboard.textContent = score;
}

let UserScore = 0, roundsPlayed =0;

let buttons = document.querySelectorAll('button');
buttons.forEach((choice) => {
    choice.addEventListener('click', game);
});