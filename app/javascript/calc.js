const calc = () => {
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener('input', () => {
    const priceValue = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price")
    addTaxPrice.innerHTML = Math.floor(priceValue / 10)
    const profit = document.getElementById("profit")
    profit.innerHTML = Math.floor(priceValue * 0.9)
  })
}

window.addEventListener('load', calc);