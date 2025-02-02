
    const months = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];
    const currentMonthIndex = new Date().getMonth();
    const container = document.getElementById("months-container");
    const historicoContainer = document.getElementById("historico");
    const avisosContainer = document.getElementById("avisos");
    const transacoes = converteTransacoes(transacoesBrutas);
    console.log(transacoes);
    const divMesAtual = null;


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
        if ((trsBrutas.forEach)) {
            trsBrutas.forEach((tr) => {
                let mes = months[tr.data.split("-")[0] - 1];
                if (tr !== null)
                    objDeRetorno[mes].push(tr);
            });
        }
        return objDeRetorno;
    }

    months.reverse();
    for (let i = 0; i < 12; i++) {
        const monthIndex = (currentMonthIndex - i + 12) % 12;
        const div = document.createElement("div");
        const a = document.createElement("a");
        a.href = window.location.href.split('?')[0];
        a.style = "text-decoration:none;"
        div.classList.add("month");
        div.textContent = months[monthIndex] + "---" + (12 - monthIndex);

        if (12 - monthIndex === mesParam) {
            selecionarMes(div, months[monthIndex]);
        }
        a.appendChild(div);
        container.appendChild(a);
    }

    function selecionarMes(div, mes) {
        div.classList.add("selecionado");
        exibirHistorico(mes);
    }

    function exibirHistorico(mes) {
        console.log("exibindo "+mes);
        historicoContainer.innerHTML = "<h3>Historico de Transacoes - " + mes + "</h3>";

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
                dataDiv.innerHTML = "<span>Data:</span> " + (transacao.data.split("-")[1] + "/" + transacao.data.split("-")[0] + "/" + transacao.data.split("-")[2]);
                divTransacao.appendChild(dataDiv);

                const horaDiv = document.createElement("div");
                horaDiv.classList.add("atributo");
                horaDiv.innerHTML = "<span>Hora:</span> " + transacao.hora;
                divTransacao.appendChild(horaDiv);

                if (transacao.tipo === "recarga") {
                    const funcionarioDiv = document.createElement("div");
                    funcionarioDiv.classList.add("atributo");
                    funcionarioDiv.innerHTML = "<span>Funcionario:</span> " + transacao.funcionario;
                    divTransacao.appendChild(funcionarioDiv);
                }

                const valorDiv = document.createElement("div");
                valorDiv.classList.add("atributo");
                valorDiv.innerHTML = "<span>Valor:</span> R$" + ((Math.abs(parseInt(transacao.valor) / 100)).toFixed(2)).toString().replace(".", ",");
                divTransacao.appendChild(valorDiv);

                const saldoDiv = document.createElement("div");
                saldoDiv.classList.add("atributo");
                saldoDiv.innerHTML = "<span>Saldo:</span> R$" + ((parseInt(transacao.saldoAtual) / 100).toFixed(2)).toString().replace(".", ",");
                divTransacao.appendChild(saldoDiv);

                historicoContainer.appendChild(divTransacao);
            });
        } else {
            historicoContainer.textContent = "Nenhuma transacao encontrada para este mes.";
        }
    }
