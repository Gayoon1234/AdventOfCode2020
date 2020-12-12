//const { Console } = require('console');

var lines = require('fs').readFileSync("day1.txt", 'utf-8') .split('\n') .filter(Boolean);
for (let number of lines) 
    if(lines.includes((2020-number).toString())){
    console.log(`Part 1: ${number*(2020-number)}`)
    break
    }
  


/*
lines.forEach(printLine)

function printLine(number){
    if(lines.includes((2020-number).toString()))
    console.log(number*(2020-number))
}
*/