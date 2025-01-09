window.onload = function () {
    const months = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];
    const currentMonthIndex = new Date().getMonth();
    const container = document.getElementById("months-container");
    const historicoContainer = document.getElementById("historico");
    const avisosContainer = document.getElementById("avisos");

    const transacoes = {
        "Dezembro": [
            {
                "tipo": "recarga",
                "data": "2024-12-20",
                "hora": "10:30",
                "funcionario": "Carlos Silva",
                "valor": 50.0,
                "saldoAtual": 150.0
            },
            {
                "tipo": "compra",
                "data": "2024-12-15",
                "hora": "14:00",
                "funcionario": null,
                "valor": 3.2,
                "saldoAtual": 100.0
            }
        ],
        "Novembro": [
            {
                "tipo": "compra",
                "data": "2024-11-10",
                "hora": "09:15",
                "funcionario": null,
                "valor": 3.2,
                "saldoAtual": 85.0
            }
        ]
    };

    let lastSelectedMonth = null;

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
        historicoContainer.innerHTML = `<h3>Histórico de Transações - ${mes}</h3>`;

        const transacoesMes = pegarHistorico(mes);
        if (transacoesMes && transacoesMes.length > 0) {
            transacoesMes.forEach(transacao => {
                const divTransacao = document.createElement("div");
                divTransacao.classList.add("transacaodiaria");

                const tipoDiv = document.createElement("div");
                tipoDiv.classList.add("atributo");
                tipoDiv.innerHTML = `<span>Tipo de Transação:</span> ${transacao.tipo === "recarga" ? "Recarga" : "Compra"}`;
                divTransacao.appendChild(tipoDiv);

                const dataDiv = document.createElement("div");
                dataDiv.classList.add("atributo");
                dataDiv.innerHTML = `<span>Data:</span> ${transacao.data}`;
                divTransacao.appendChild(dataDiv);

                const horaDiv = document.createElement("div");
                horaDiv.classList.add("atributo");
                horaDiv.innerHTML = `<span>Hora:</span> ${transacao.hora}`;
                divTransacao.appendChild(horaDiv);

                if (transacao.tipo === "recarga") {
                    const funcionarioDiv = document.createElement("div");
                    funcionarioDiv.classList.add("atributo");
                    funcionarioDiv.innerHTML = `<span>Funcionário:</span> ${transacao.funcionario}`;
                    divTransacao.appendChild(funcionarioDiv);
                }

                const valorDiv = document.createElement("div");
                valorDiv.classList.add("atributo");
                valorDiv.innerHTML = `<span>Valor:</span> R$ ${transacao.valor.toFixed(2)}`;
                divTransacao.appendChild(valorDiv);

                const saldoDiv = document.createElement("div");
                saldoDiv.classList.add("atributo");
                saldoDiv.innerHTML = `<span>Saldo:</span> R$ ${transacao.saldoAtual.toFixed(2)}`;
                divTransacao.appendChild(saldoDiv);

                historicoContainer.appendChild(divTransacao);
            });
        } else {
            historicoContainer.textContent = "Nenhuma transação encontrada para este mês.";
        }
    }
    function pegarHistorico(mes){
        return transacoes[mes];
    }
};
