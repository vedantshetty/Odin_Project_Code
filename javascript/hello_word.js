const Gigasecond = function (timestamp) {
    this.timestamp = timestamp
  };
  
  Gigasecond.prototype.date = function () {
    let timeInSeconds = this.timestamp.getTime() / 1000
  
    let gigasecondDate = timeInSeconds + Math.pow(10, 9)
  
    return new Date(gigasecondDate * 1000)
  }

console.log(Gigasecond(new Date))