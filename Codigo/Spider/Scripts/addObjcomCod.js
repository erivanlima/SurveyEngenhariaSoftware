var id = 0;
function perguntaobjcomcod() {
    //copy the table row and clear the value of the input, then append the row to the end of the table
    var newItem = $("<div>Digite sua pergunta:  <input type='text' id='questoes_" + id + "__Pergunta'name='questoes[" + id + "].Pergunta' /> <input type='hidden' class='pergunta' value='OBJETIVA' id='questoes_" + id + "__Pergunta'name='questoes[" + id + "].Tipo' /><br>Digite seu código:<br> <p> <TEXTAREA rows='7' cols='50' id='questoes_" + id + "__Linguagem'name='questoes[" + id + "].Linguagem'></TEXTAREA> <br><p> item a:<input type='text' id='questoes_" + id + "__itens__ItemA'name='questoes[" + id + "].itens.ItemA'/><br><p>item b:<input type='text' id='questoes_" + id + "__itens__ItemB'name='questoes[" + id + "].itens.ItemB'/><br><p>item c: <input type='text' id='questoes_" + id + "__itens__ItemC'name='questoes[" + id + "].itens.ItemC'/> <br><p>item d: <input type='text' id='questoes_" + id + "__itens__ItemD'name='questoes[" + id + "].itens.ItemD'/> <br><p>item e: <input type='text' id='questoes_" + id + "__itens__ItemE'name='questoes[" + id + "].itens.ItemE'/> <br> <p><input value='Remover' class='remover' type='button'/></div>");
    $(".divperguntaobjetivacomcodigo").append(newItem);
    //$(".divperguntaobjetivacomcodigo").find('file').fileinput();
    //reloadStylesheets();
    id++;
    $('.remover').click(function () {

        $(this).closest('div').hide();
        $(this).closest('div').find("input[type = text]").val("");

    });
}

function reloadStylesheets() {
    var queryString = '?reload=' + new Date().getTime();
    $('link[rel="stylesheet"]').each(function () {
        this.href = this.href.replace(/\?.*|$/, queryString);
    });
}