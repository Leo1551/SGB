function confirmarBloqueio() {
  const ele = document.createElement("div");
  ele.innerText = "Você tem certeza que quer bloquear o cartão?";
  ele.classList.add("popUp");
  document.body.appendChild(ele);
}
