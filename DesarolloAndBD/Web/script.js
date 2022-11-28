const formELement = document.getElementById("saveTransaction");

formELement.addEventListener("submit",(event) => {
    event.preventDefault();
    let transactionDescription = document.getElementById("transactionDescription").value;
    let transactionPrice = document.getElementById("transactionPrice").value;
    let transaction ={transactionDescription: transactionDescription, transactionPrice: transactionPrice};
    let transactionJson = JSON.stringify(transaction);
    console.log(transactionJson);
    fetch('http://localhost:3000/transaction', {
        method: 'Post',
        body : transactionJson
    })
});
fetch ('http://localhost:3000/transaction').then(x => x.json()).then(console.log)