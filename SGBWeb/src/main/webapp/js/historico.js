window.onload = function () {
    const months = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];
    const currentMonthIndex = new Date().getMonth();
    const container = document.getElementById("months-container");
    const historicoContainer = document.getElementById("historico");
    const avisosContainer = document.getElementById("avisos");
    const transacoes = converteTransacoes(transacoesBrutas);

    let lastSelectedMonth = null;

    function converteTransacoes(trsBrutas) {
        let objDeRetorno = {
            "Janeiro": [],
            "Fevereiro": [],
            "Março": [],
            "Abril": [],
            "Maio": [],
            "Junho": [],
            "Julho": [],
            "Agosto": [],
            "Setembro": [],
            "Outubro": [],
            "Novembro": [],
            "Dezembro": []
        };
        trsBrutas.forEach((tr)=>{
            let mes= months[tr.data.split("-")[0]-1];
            if(tr!==null)objDeRetorno[mes].push(tr);
         });
         return objDeRetorno;
    }


    function calcularSaldoAtual() {
        const meses = months.reverse();
        let saldoAtual = 0;

        for (let i = 0; i < meses.length; i++) {
            const mes = meses[i];
            const transacoesMes = transacoes[mes];

            if (transacoesMes && transacoesMes.length > 0) {
                const transacaoMaisRecente = transacoesMes.reduce((maisRecente, transacao) => {
                    const dataTransacao = new Date(transacao.data);
                    const dataMaisRecente = new Date(maisRecente.data);

                    return dataTransacao > dataMaisRecente ? transacao : maisRecente;
                });

                saldoAtual = transacaoMaisRecente.saldoAtual;
                break;
            }
        }

        return saldoAtual;
    }

    const saldo = calcularSaldoAtual();
    document.getElementById("avisos").innerHTML = `<strong>Saldo Atual:</strong> &nbsp R$ ${saldo.toFixed(2)}`;

    months.reverse();
    for (let i = 0; i < 12; i++) {
        const monthIndex = (currentMonthIndex - i + 12) % 12;
        const div = document.createElement("div");
        div.classList.add("month");
        div.textContent = months[monthIndex];
        div.onclick = function () {
            selecionarMes(div, months[monthIndex]);
        };
        container.appendChild(div);
    }

    function selecionarMes(div, mes) {
        if (lastSelectedMonth) {
            lastSelectedMonth.classList.remove("selecionado");
        }

        div.classList.add("selecionado");
        lastSelectedMonth = div;
        exibirHistorico(mes);
    }

    function exibirHistorico(mes) {
        console.log(mes)
        historicoContainer.innerHTML = "<h3>Historico de Transacoes - "+mes+"</h3>";

        const transacoesMes = transacoes[mes];
        if (transacoesMes && transacoesMes.length > 0) {
            transacoesMes.forEach(transacao => {
                const divTransacao = document.createElement("div");
                divTransacao.classList.add("transacaodiaria");

                const tipoDiv = document.createElement("div");
                tipoDiv.classList.add("atributo");
                if (transacao.tipo === "recarga")
                    tipoDiv.innerHTML = `<span>Tipo de transacao:</span> Recarga`;
                else
                    tipoDiv.innerHTML = `<span>Tipo de transacao:</span> Compra`;
                divTransacao.appendChild(tipoDiv);

                const dataDiv = document.createElement("div");
                dataDiv.classList.add("atributo");
                dataDiv.innerHTML = "<span>Data:</span> "+ (transacao.data.split("-")[1]+"/"+transacao.data.split("-")[0]+"/"+transacao.data.split("-")[2]);
                divTransacao.appendChild(dataDiv);

                const horaDiv = document.createElement("div");
                horaDiv.classList.add("atributo");
                horaDiv.innerHTML = "<span>Hora:</span> " +transacao.hora;
                divTransacao.appendChild(horaDiv);

                if (transacao.tipo === "recarga") {
                    const funcionarioDiv = document.createElement("div");
                    funcionarioDiv.classList.add("atributo");
                    funcionarioDiv.innerHTML = "<span>Funcionario:</span> "+transacao.funcionario;
                    divTransacao.appendChild(funcionarioDiv);
                }

                const valorDiv = document.createElement("div");
                valorDiv.classList.add("atributo");
                valorDiv.innerHTML = "<span>Valor:</span> R$"+((Math.abs(parseInt(transacao.valor)/100)).toFixed(2)).toString().replace(".",",");
                divTransacao.appendChild(valorDiv);

                const saldoDiv = document.createElement("div");
                saldoDiv.classList.add("atributo");
                saldoDiv.innerHTML = "<span>Saldo:</span> R$"+((parseInt(transacao.saldoAtual)/100).toFixed(2)).toString().replace(".",",");
                divTransacao.appendChild(saldoDiv);

                historicoContainer.appendChild(divTransacao);
            });
        } else {
            historicoContainer.textContent = "Nenhuma transacao encontrada para este mes.";
        }
    }
                

};
