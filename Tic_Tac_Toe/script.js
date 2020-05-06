const Gameboard = ()=> {
    let state = new Array(3);
    for(let i =0;i< state.length;i++) {state[i] = new Array(3);}
    return {state}
};

const playerFactory = ()=> {
    let score= 0;
    const getScore = ()=>score;
    const win = () => {score++};
    return {getScore,win}
};


const game = (playerOne, playerTwo) => {
    let board;
    const start = () => {
        board = Gameboard();
        play(0)
    }

    const play = (turn) => {
        const SYMBOLS = ['X','O'];
        let HTMLtable = document.getElementById("board");
        if(HTMLtable != null) {
            for(let i=0;i<HTMLtable.rows.length;i++) {
                for(let j =0; j<HTMLtable.rows[i].cells.length;j++) {
                    HTMLtable.rows[i].cells[j].onclick = function() {
                        this.innerHTML= SYMBOLS[turn];
                        board.state[i][j] = turn;
                        turn ^= 1;
                        isGameOver();
                    }
                }
            }
        }
    }

    const win = (player) {

    }

    const rowEqual = () => {
        for(let row =0; row< state.length;row++){
            state[row].every(v=> v===arr[0])
        }
    }

    const colEqual = () => {

    }
    
    const diagEqual = () => {

    }

    const isGameOver = () => {
        
        if(win(0)) {playerOne.win;}
        else if(win(1)) {playerTwo.win;}
        else {//Tie 
        }
        //New Game
    }

    return {start}
}


let x = playerFactory('X');
let o = playerFactory('O');
game(x,o).start();
