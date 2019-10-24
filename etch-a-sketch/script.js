
function buildGrid(squares) {
    let container = document.querySelector('.container');
    for (let x = 0; x < squares; x++) {
        for (let y = 0; y < squares; y++) {
            let cell = document.createElement('div');
            styleGrid(cell, x, y, squares);
            container.appendChild(cell);
        }
    }
}
function clearGrid() {
    let container = document.querySelector('.container');
    container.remove();
}

function createSketchPad(squares) {
    container = document.createElement('div');
    container.classList.add('container');
    container.style.display = 'grid';
    container.style.border = '5px solid black';
    container.style.width = `900px`;
    container.style.margin = 'auto';

    squareSide = parseInt(900/squares);
    container.style.gridTemplate = `repeat(${squares},${squareSide}px)/repeat(${squares},${squareSide}px)`
    document.querySelector('.wrapper').appendChild(container);

    buildGrid(squares);
}

function styleGrid(cell, x, y, squares) {
    cell.classList.add('cell')
    cell.addEventListener('mouseover', () => cell.style.backgroundColor = getRandomColor(x, y, squares));
}

function getRandomColor(x, y, squares) {
    let r = parseInt(256 / squares * x);
    let g = parseInt(256 / squares * y);
    let b = '77';
    return `rgb(${r},${g},${b})`;
}

let button = document.querySelector('.btn');
button.addEventListener('click', () => {
    let squares = parseInt(prompt('How many cells per row'));
    console.log(squares)
    squares = (isNaN(squares) || squares ==0)?16: squares;
    clearGrid();
    createSketchPad(squares);
});
createSketchPad(16);