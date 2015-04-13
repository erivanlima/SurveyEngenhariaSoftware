var id = 0;
function addimg() {
    //copy the table row and clear the value of the input, then append the row to the end of the table
    var newItem = $("<div class='editor-field'><p> Adicione uma imagem: <input type='file' id='questoes_" + id + "__Img' name=\"images\" data-id=" + id + " />"
    + " <p> <input value='Adicionar item' class='adicionar' type='button'/></div>");
    $(".divimagem").append(newItem);

    $("#questoes_" + id + "__Img").change(function () {
        console.log("Blz" + $(this).attr("data-id"));
        readURL(this);
    });
    
    
    $('.adicionar').click(function () {

        var newItem = $("<div class='editor-field'> Nome do item: <input  type='text' id='itens_" + id + "__Item'name='itens[" + id + "].Item' /> <input value='Remover' class='removeritens' type='button'/></div>");
        $(".item").append(newItem);

        $('.removeritens').click(function () {

            $(this).closest('div').hide();
            $(this).closest('div').find("input[type = text]").val("");

        });

        id++;

    });

}

