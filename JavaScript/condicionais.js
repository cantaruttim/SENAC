

let idade = 18;

if (idade >= 18) {
  console.log("Você é maior de idade.");
} else {
  console.log("Você é menor de idade.");
}


let n1 = 1
let n2 = 2 
if (n1 == n2) {
    console.log(true)
} else {
    console.log(false)
}

const idadeLegal = 18;
const { Console } = require('console');
const readline = require('readline');
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question("Digite a sua Idade: ", function(idade) {

    if (idade >= idadeLegal) {
        console.log("Você é maior de idade.");
    } else {
        console.log("Você é menor de idade.");
    }

  rl.close();
});


