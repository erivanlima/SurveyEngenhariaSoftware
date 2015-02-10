var id = 0;
function perguntasubjetiva() {
    //copy the table row and clear the value of the input, then append the row to the end of the table'
    var newItem = $("<div class='editor-field'> Digite sua pergunta: <input class='pergunta' type='text' id='questoes_" + id + "__Pergunta'name='questoes[" + id + "].Pergunta' />  <input type='hidden' class='pergunta' value='SUBJETIVA' id='questoes_" + id + "__Pergunta'name='questoes[" + id + "].Tipo' /> <br><p> <input value='Remover' class='remover' type='button'/> </div>");
    $(".divperguntasubjetiva").append(newItem);       
    id++;

    $('.remover').click(function () {

        $(this).closest('div').hide();
        $(this).closest('div').find("input[type = text]").val("");

    });


}

    
