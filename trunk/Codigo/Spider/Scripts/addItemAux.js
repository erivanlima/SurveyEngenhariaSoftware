var id = 0;
function addItemAux() {
    //copy the table row and clear the value of the input, then append the row to the end of the table
    var newItem = $("<div class='editor-field'> Nome do item: <input  type='text' value='' id='itensAux_" + id + "__Item'name='itensAux[" + id + "].Item' /> <input value='Remover' class='removeritem' type='button'/></div>");
    $(".AdditemAux").append(newItem);

    id++;
    $('.removeritem').click(function () {

        $(this).closest('div').hide();
        $(this).closest('div').find("input[type = text]").val("");

    });

}