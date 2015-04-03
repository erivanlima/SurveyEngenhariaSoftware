var id = 0;
function addItem() {
    //copy the table row and clear the value of the input, then append the row to the end of the table
    var newItem = $("<div class='editor-field'> Nome do item: <input  type='text' id='questoes_" + id + "__itens__Item'name='questoes[" + id + "].itens.Item' /> <input value='Remover' class='remover' type='button'/></div>");
    $(".item").append(newItem);
    id++;
    $('.remover').click(function () {

        $(this).closest('div').hide();
        $(this).closest('div').find("input[type = text]").val("");

    });


}