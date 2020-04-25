let myLibrary = [];
function Book(title, author,read) {
  this.title = title;
  this.read = read;
  this.author = author;
  this.info = function() {
    if(read)
    {
      readString = "read.";
    }
    else {
      readString = "not read yet";
    }
    return title+" by "+author+", "+ readString;
  }
}

function addBooksToLibrary() {
  let title = prompt("Enter The Book Title","Meditations");
  let author = prompt("Who wrote it?","Marcus Aurelius");
  let read = confirm("Have You Read It?", false);
  
  let book = new Book(title, author, read);
  myLibrary.push(book);
  render();
}

function changeReadStatus(index){
  myLibrary[index].read = !myLibrary[index].read
  render()
}

function removeBook(index){
  myLibrary.pop(index);
  render();
}
function render(){
  //clear table
  let table = document.getElementById('table-body');
  table.innerHTML = "";
  for(let i=0; myLibrary.length;i++){
    let row = table.insertRow();
    let title = row.insertCell(0);
    let author = row.insertCell(1);
    let read = row.insertCell(2);
    let delButton = row.insertCell(3);
    let readButton = row.insertCell(4);

    title.innerHTML = myLibrary[i].title;
    author.innerHTML= myLibrary[i].author;
    read.innerHTML= myLibrary[i].read;
    delButton.innerHTML = "<button onclick ='removeBook("+i+")' class='delete'>Delete</button>"
    readButton.innerHTML = "<button onclick='changeReadStatus("+i+")'>Read</button>"
  }
}

book = new Book("The Hobbit","J.R.R Tolkien", false);
myLibrary.push(book);
render(book)