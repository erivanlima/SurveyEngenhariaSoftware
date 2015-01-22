var id = 0;
function perguntaobjcomcod() {
    //copy the table row and clear the value of the input, then append the row to the end of the table
    var newItem = $("<div class='editor-field'>Digite sua pergunta:  <input type='text' id='questoes_" + id + "__Pergunta'name='questoes[" + id + "].Pergunta' /><br> <p> Digite um código:<input type='text' id='questoes_" + id + "__Linguagem'name='questoes[" + id + "].Linguagem' /> <br><p> item a:<input type='text' id='questoes_" + id + "__itens__ItemA'name='questoes[" + id + "].itens.ItemA'/><br><p>item b:<input type='text' id='questoes_" + id + "__itens__ItemB'name='questoes[" + id + "].itens.ItemB'/><br><p>item c: <input type='text' id='questoes_" + id + "__itens__ItemC'name='questoes[" + id + "].itens.ItemC'/> <br><p>item d: <input type='text' id='questoes_" + id + "__itens__ItemD'name='questoes[" + id + "].itens.ItemD'/> <br><p>item e: <input type='text' id='questoes_" + id + "__itens__ItemE'name='questoes[" + id + "].itens.ItemE'/> <br> <p><input value='Remover' class='remover' type='button'/></div>");
    $(".divperguntaobjetivacomcodigo").append(newItem);
    id++;
    $('.remover').click(function () {

        $(this).closest('div').hide();
        $(this).closest('div').find("input[type = text]").val("");

    });
}