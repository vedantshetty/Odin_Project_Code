const Gameboard = () => {
    let state = new Array(3);
    for (let i = 0; i < state.length; i++) { state[i] = new Array(3); };
    const reset = () => {
        let HTMLtable = document.getElementById("board");
        if (HTMLtable != null)
            for (let i = 0; i < HTMLtable.rows.length; i++)
                for (let j = 0; j < HTMLtable.rows[i].cells.length; j++)
                    HTMLtable.rows[i].cells[j].innerHTML = "";
    }
    reset();
    return { state }
};

const playerFactory = (name) => {
    let score = 0;
    let playerName = name;
    const win = () => {
        score++
        alert(`${playerName} wins`)
        // update score on HTML page; match class with playerName
    };
    return { win }
};


const game = (playerOne, playerTwo) => {
    let board;
    let turn;
    const start = () => {
        board = Gameboard();
        setTurnIndicator(playerOne);
        turn = 0;
        play();
    }


    const setTurnIndicator(player) => {

    }

    const play = () => {
        const SYMBOLS = ['X', 'O'];

        let HTMLtable = document.getElementById("board");
        if (HTMLtable != null)
            for (let i = 0; i < HTMLtable.rows.length; i++)
                for (let j = 0; j < HTMLtable.rows[i].cells.length; j++)
                    HTMLtable.rows[i].cells[j].onclick = function () {
                        this.innerHTML = SYMBOLS[turn];
                        board.state[i][j] = SYMBOLS[turn];
                        turn ^= 1;
                        if (isGameOver()) start();
                        // Turn Indicator Update
                    }
    }

    const win = () => {
        let temp;
        if (temp = rowEqual()) return temp;
        if (temp = colEqual()) return temp;
        return diagEqual();
    }

    const rowEqual = () => {
        for (let row = 0; row < board.state.length; row++)
            if (allEqual(board.state[row])) return board.state[row][0];
        return false;
    }
    const allEqual = arr => {
        let source = arr[0];
        if (source === undefined) return false;

        for (let i = 1; i < arr.length; i++) {
            if (source != arr[i]) return false;
        }
        return true;
    }

    const colEqual = () => {
        for (let col = 0; col < board.state.length; col++) {
            let column = []
            for (let i = 0; i < board.state.length; i++)
                column.push(board.state[i][col]);
            if (allEqual(column)) return column[0];
        }
        return false;
    }

    const diagEqual = () => {
        let leftDiag = [board.state[0][0], board.state[1][1], board.state[2][2]];
        if (allEqual(leftDiag)) return board.state[0][0];
        let rightDiag = [board.state[0][2], board.state[1][1], board.state[2][0]];
        if (allEqual(rightDiag)) return board.state[0][2];
        return false;
    }

    const isGameOver = () => {
        let result = win();
        if (result === false) return false;
        else if (result === 'X') playerOne.win();
        else if (result === 'O') playerTwo.win();
        else alert('tie');
        return true;
    }

    return { start }
}


let x = playerFactory('X');
let o = playerFactory('O');
game(x, o).start();
