<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Cálculo Amostral
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
    <h3> Cálculo Amostral </h3>
    </center>

    <script>
        erro = 0;
        conLev = 1;
        zVal = 1.96;
        ss = 0;
        pop = 0;
        max = 0;

        function ConLevButF1(obj) { zVal = 1.6449 }
        function ConLevButF2(obj) { zVal = 1.96 }
        function ConLevButF3(obj) { zVal = 2.5758 }

        function to(obj) {
            if (obj.errobox.value == "") { erro = 0 }
            else { erro = eval(obj.errobox.value) / 100 }
            if (obj.popbox.value == "") { pop = -999980 }
            else { pop = eval(obj.popbox.value) }
            if (obj.maxbox.value == "") { max = -999980 }
            else { max = eval(obj.maxbox.value) / 100 }
            if (obj.minbox.value == "") { min = -999980 }
            else { min = eval(obj.minbox.value) / 100 }
            if (erro == 0) { alert("Defina um erro amostral maior que 0%") }
            else {
                if (erro > 1) { alert("Defina um erro amostral menor que 100%") }
                else {
                    if (pop == -999980)
                        if (max == -999980)
                            if (min == -999980) { ss = ((zVal * zVal) * 0.25) / (erro * erro) }
                            else {
                                if (min > 0.5) { ss = ((zVal * zVal) * min * (1 - min)) / (erro * erro) }
                                else { alert("O percentual mínimo deve ser superior a 50%"); ss = 0 }
                            }
                        else {
                            if (max < 0.5)
                                if (min == -999980) { ss = ((zVal * zVal) * max * (1 - max)) / (erro * erro) }
                                else { alert("Quando preencher o percentual máximo, não preencha a probabilidade mínima"); ss = 0 }
                            else { alert("O percentual máximo deve ser inferior a 50%"); ss = 0 }
                        }
                    else {
                        if (max == -999980)
                            if (min == -999980) { ss = ((zVal * zVal) * 0.25) / (erro * erro); ss = ss / (1 + (ss - 1) / pop) }
                            else { ss = ((zVal * zVal) * min * (1 - min)) / (erro * erro); ss = ss / (1 + (ss - 1) / pop) }
                        else {
                            if (min == -999980) { ss = ((zVal * zVal) * max * (1 - max)) / (erro * erro); ss = ss / (1 + (ss - 1) / pop) }
                            else { alert("Quando preencher o percentual máximo, não preencha a probabilidade mínima"); ss = 0 }
                        }
                    }
                }
            }
            obj.ssbox.value = parseInt(ss + .999)

        }
</script>

    <div align="center">
        <table width="700" border="0">
            <tr>
                <td>
                    <form name="calc" id="calc">
                    <table width="328" align="center" cellpadding="5" bordercolor="#999999" bgcolor="#CCCCCC">
                        <tr>
                            <td width="180">
                                <div align="right">
                                    <span class="normal">Erro amostral:</span></div>
                            </td>
                            <td width="120">
                                <span class="normal">
                                    <input name="errobox" type="text" value="5" size="1" />
                                    %</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    <span class="normal">N&iacute;vel de confian&ccedil;a:</span></div>
                            </td>
                            <td>
                                <p class="normal">
                                    <input type="radio" name="ConLevBut" value="1" onclick="ConLevButF1(this.form)" />
                                    90%<br />
                                    <input type="radio" name="ConLevBut" value="2" onclick="ConLevButF2(this.form)" checked="checked" />
                                    95%<br />
                                    <input type="radio" name="ConLevBut" value="3" onclick="ConLevButF3(this.form)" />
                                    99%</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    <span class="normal">Popula&ccedil;&atilde;o: </span>
                                </div>
                            </td>
                            <td>
                                <span class="normal">
                                    <input type="text" name="popbox" size="10" />
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    <span class="normal">Percentual m&aacute;ximo:</span></div>
                            </td>
                            <td>
                                <span class="normal">
                                    <input type="text" name="maxbox" size="1" />%</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    <span class="normal">Percentual m&iacute;nimo:</span></div>
                            </td>
                            <td>
                                <span class="normal">
                                    <input type="text" name="minbox" size="1" /> %</span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <p class="normal">
                                    &nbsp;
                                </p>
                                <p align="center" class="normal">
                                    <input name="Calcular" type="button" class="normal" onclick="to(this.form)" value="Calcular" />
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    <span class="normal">Amostra necess&aacute;ria: </span>
                                </div>
                            </td>
                            <td>
                                <input type="text" name="ssbox" size="10" />
                            </td>
                        </tr>
                    </table>
                    </form>
                    <%--<p align="center">
                        &nbsp;</p>
                    <p align="center" class="Titulo">
                        <strong>Instru&ccedil;&otilde;es de uso</strong></p>
                    <p class="normal">
                        Utilize esta calculadora para saber qual a amostra necess&aacute;ria em uma pesquisa
                        com amostragem aleat&oacute;ria simples sobre vari&aacute;veis categ&oacute;ricas.</p>
                    <div align="left">
                        <blockquote>
                            &nbsp;
                        </blockquote>
                    </div>
                    <blockquote>
                        <p align="left" class="normal">
                            <em>Amostra aleat&oacute;ria simples &eacute; aquela na qual todos os elementos t&ecirc;m
                                a mesma probabilidade de serem selecionados. Uma amostra desse tipo pode ser obtida,
                                por exemplo, atrav&eacute;s do sorteio dos elementos.</em></p>
                        <p align="left" class="normal">
                            <em>Vari&aacute;veis categ&oacute;ricas s&atilde;o aquelas medidas em uma escala nominal.
                                Exemplos de vari&aacute;veis categ&oacute;ricas s&atilde;o sexo (masculino/feminino),
                                cidade (S&atilde;o Paulo, Rio de Janeiro, Salvador...), cor (azul, amarelo, vermelho...).
                                Vari&aacute;veis num&eacute;ricas, como idade ou renda, n&atilde;o s&atilde;o categ&oacute;ricas.</em></p>
                    </blockquote>
                    <p align="left" class="Titulo style1">
                        <strong>Como preencher</strong></p>
                    <p align="left" class="normal">
                        <strong>Erro amostral</strong>: &eacute; a diferen&ccedil;a entre o valor estimado
                        pela pesquisa e o verdadeiro valor. Digamos que em uma situa&ccedil;&atilde;o existem
                        efetivamente 10% de turistas franceses. Se a pesquisa estimar que existem 12% de
                        franceses o erro amostral &eacute; de 2% (12%-10%=2%). Na calculadora voc&ecirc;
                        deve indicar qual o erro amostral m&aacute;ximo admitido pela pesquisa. Em geral
                        esse valor &eacute; definido pelo pr&oacute;prio pesquisador. Freq&uuml;entemente
                        o valor definido &eacute; 5%.</p>
                    <p align="left" class="normal">
                        <strong>N&iacute;vel de confian&ccedil;a</strong>: &eacute; a probabilidade de que
                        o erro amostral efetivo seja menor do que o erro amostral admitido pela pesquisa.
                        Se voc&ecirc; definiu um erro amostral de 5%, o n&iacute;vel de confian&ccedil;a
                        indica a probabilidade de que o erro cometido pela pesquisa n&atilde;o exceda 5%.
                        Utilizando o exemplo anterior, o n&iacute;vel de confian&ccedil;a &eacute; a probabilidade
                        de que a pesquisa estime algo entre 5% e 15% de turistas franceses. Dado que na
                        verdade existem 10% de franceses, se a estimativa da pesquisa estiver entre esses
                        5% e 15%, o erro amostral cometido n&atilde;o ser&aacute; maior que 5%. Freq&uuml;entemente
                        o n&iacute;vel de confian&ccedil;a utilizado nas pesquisas &eacute; de 95%.</p>
                    <p align="left" class="normal">
                        <strong>Popula&ccedil;&atilde;o</strong>: &eacute; o n&uacute;mero de elementos
                        existentes no universo da pesquisa. Se a pesquisa &eacute; sobre todos os turistas
                        em S&atilde;o Paulo, a popula&ccedil;&atilde;o &eacute; o n&uacute;mero de turistas
                        que visitam a cidade. Se o pesquisador n&atilde;o conhece o n&uacute;mero exato
                        de elementos no universo, ele deve ser cauteloso e indicar um n&uacute;mero grande
                        o suficiente para que a popula&ccedil;&atilde;o efetiva n&atilde;o seja maior. Se
                        o n&uacute;mero de elementos do universo est&aacute; entre 1000 e 1500, o pesquisador
                        deve indicar 1500 para obter uma estimativa segura. Se o universo for muito grande
                        ou n&atilde;o houver nenhum informa&ccedil;&atilde;o sobre seu tamanho, o campo
                        popula&ccedil;&atilde;o na calculadora pode ser deixado em branco.</p>
                    <p align="left" class="normal">
                        <strong>Percentual m&aacute;ximo</strong>: como voc&ecirc; est&aacute; trabalhando
                        com vari&aacute;veis categ&oacute;ricas, provavelmente voc&ecirc; est&aacute; buscando
                        um resultado que indique qual &eacute; o percentual de elementos com uma dada caracter&iacute;stica.
                        Voc&ecirc; quer saber, por exemplo, qual &eacute; o percentual de franceses no total
                        de turistas que visitam S&atilde;o Paulo. Se voc&ecirc; tiver alguma informa&ccedil;&atilde;o
                        que indique que esse percentual certamente n&atilde;o passa de um determinado valor,
                        isso pode ajudar a reduzir o tamanho da amostra necess&aacute;ria para a pesquisa.
                        Se for seguro afirmar que, por exemplo, o percentual de franceses n&atilde;o &eacute;
                        maior que 20%, ent&atilde;o insira 20% no campo percentual m&aacute;ximo da calculadora.
                        Voc&ecirc; deve incluir o percentual m&aacute;ximo somente quando ele &eacute; inferior
                        a 50%.</p>
                    <p align="left" class="normal">
                        <strong>Percentual m&iacute;nimo</strong>: esse valor tem uma interpreta&ccedil;&atilde;o
                        parecida com a do percentual m&aacute;ximo. Se voc&ecirc; tem uma informa&ccedil;&atilde;o
                        que indica que o percentual de turistas norte americanos &eacute; certamente superior
                        a 70%, insira 70% no campo percentual m&iacute;nimo. Voc&ecirc; deve incluir o percentual
                        m&iacute;nimo somente quando ele &eacute; superior a 50%.</p>--%>
                    </br>
                    <p align="left" class="Titulo">
                        F&oacute;rmula de c&aacute;lculo</p>
                    <p align="left" class="normal">
                        Esta calculadora on-line utiliza a seguinte f&oacute;rmula:</p>
                    <p align="center" class="normal">
                    <img src="../../Content/imagem/calculoamostral.gif" width="329" height="80" />
                    <p align="left" class="normal">
                        Onde:<br />
                        n - amostra calculada<br />
                        N - popula&ccedil;&atilde;o<br />
                        Z - vari&aacute;vel normal padronizada associada ao n&iacute;vel de confian&ccedil;a<br />
                        p - verdadeira probabilidade do evento<br />
                        e - erro amostral</p>
                    <p align="left" class="normal">
                        &nbsp;</p>
                       
                </td>
            </tr>
        </table>
    </div>
    <p>
        &nbsp;</p>
    <p class="Titulo">
        &nbsp;</p>
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-7783701-10']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

    </script>


</asp:Content>
