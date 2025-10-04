// 1. QUAL A DIFERENÇA ENTRE VAR, LET E CONST?

const PI = 3.14;
console.log("Value of PI:", PI);

let radius = 5;
let area = PI * radius * radius;
console.log("Area of circle with radius", radius, "is:", area);

let nome = "Mathues"


console.log("............");

console.log(typeof(PI));
console.log(typeof(radius));
console.log(typeof(area));
console.log(typeof(nome));

// 2. SERÁ QUE PODEMOS MUDAR O TIPO DE UMA VARIÁVEL?
let entrada = "42";
console.log("Tipo do dado de entrada",typeof(entrada));
let numero = Number(entrada);
console.log("Número:", numero);
console.log("Tipo do dado de saida",typeof(numero));



const { Console } = require('console');
// 3. COMO PODEMOS REALIZAR A ENTRADA DE DADOS?

const readline = require('readline');
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question("Digite seu nome: ", function(nome) {
  console.log("Olá, " + nome + "!");
  rl.close();
});
