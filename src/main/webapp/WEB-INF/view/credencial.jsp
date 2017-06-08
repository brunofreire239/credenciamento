
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!doctype html>
<html lang="">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <title>Credencial</title>

    <!-- Disable tap highlight on IE -->
    <meta name="msapplication-tap-highlight" content="no">

    <!-- Web Application Manifest -->
    <!-- <link rel="manifest" href="manifest.json"> -->

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="application-name" content="Credencial">
    <link rel="icon" sizes="192x192" href="images/icon/icon/apple-icon-57x57.png">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Web Starter Kit">
    <link rel="apple-touch-icon" href="images/touch/apple-touch-icon.png">

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#2F3BA2">

    <!-- Color the status bar on mobile devices -->
    <meta name="theme-color" content="#2F3BA2">

    <link rel="apple-touch-icon" sizes="57x57" href="images/icon/icon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="images/icon/icon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/icon/icon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="images/icon/icon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/icon/icon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="images/icon/icon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="images/icon/icon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="images/icon/icon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="images/icon/icon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="images/icon/icon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="images/icon/icon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="images/icon/icon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="images/icon/icon/favicon-16x16.png">
    <link rel="manifest" href="images/icon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="images/icon/icon/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

    <!-- Your styles -->
    <link rel="stylesheet" href="<s:url value="/assets/styles/main.css"/>" />



  </head>
  <body>

    <section class="container">
        <section id="topo">
            <div class="logo">
                <img src="<s:url value="/assets/images/logo.svg"/>" />
            </div>
        </section>

        <section id="teclado-virtual">

            <header>
                 <h1>DIGITE SEU CPF PARA RETIRA SUA CREDENCIAL.</h1>
            </header>

           <s:form id="formZebra" action="zebra" namespace="usuario"  theme="simple" >
			<s:hidden  name="conf" />
               <div class="digite-cpf">
                   <input readonly="true" type="text" class="email" placeholder="DIGITE SEU CPF" id="cpf"  name="user.cpf" maxlength="11">
                   <input type="button" id="delete"><br />
               </div>

              <section id="sucess">
				 <div class="sucesso">
					Usuário Credenciado com sucesso.
				</div>
               </section>

               <%-- <section id="conteiner-error-impressora"> --%>
				<div id="errorEmpNull" class="cad-error">
					Existe problema com a conexão com a impressora.
				</div>
               <%-- </section> --%>


               <section id="conteiner-msg">
             	  <div  class="cpf-invalido-inexistente"> CPF invalido ou não cadastrado. Tente novamente ou procure um dos coordenadores do evento. </div>
 				<!-- <div class="cpf-invalido">CPF inválido, digite novamente.</div> -->
               </section>

               <section id="errorGenerated">
             	 	<div id="error-etiqueta" class="cpf-invalido-inexistente"> Ja foi gerado etiqueta para este usuário. Qualquer duvida procure um dos coordenadores do evento.</div>
               </section>

                <input type="button" value="1" name="no">
                <input type="button" value="2" name="no">
                <input type="button" value="3" name="no">
                <input type="button" value="4" name="no">
                <input type="button" value="5" name="no">
                <input type="button" value="6" name="no">
                <input type="button" value="7" name="no">
                <input type="button" value="8" name="no">
                <input type="button" value="9" name="no">
                <input class="zero" type="button" value="0" name="no" >

                <br /><br />

                <div class="btn-enviar">

                    <s:submit  value="CONFIRMAR" cssClass="confirmar" />
					<input type="reset"   class="limpar"  value="LIMPAR">

                </div>
          </s:form>

        </section>

        <section class="conteiner-sucesso">
            <section id="sucesso">
                <p>RETIRE SUA CREDENCIAL AO LADO.</p>
                <div> <img src="<s:url value="/assets/images/credencial.png"/>" /> </div>
            </section>

            <section class="novo-cpf">
                <a href=""><div>NOVO CPF</div></a>
            </section>
        </section>

    </section>

    <%-- <script type ="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.2/angular.min.js"></script>
    <script type ="text/javascript" src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.2/angular.min.js"></script> --%>
    <script type="text/javascript" src="<s:url value="/assets/scripts/jquery.js"/>"></script>
    <script type="text/javascript" src="<s:url value="/assets/scripts/parallax.js"/>"></script>
    <script type="text/javascript" src="<s:url value="/assets/scripts/main.js"/>"></script>
    <script type="text/javascript" src="<s:url value="/assets/scripts/parsley.js"/>"></script>
    <script type="text/javascript" src="<s:url value="/assets/scripts/jquery.mask.min.js"/>"></script>
    <!-- endbuild -->

  </body>



<script>

var message = 0;
<s:if test="msg == 1 || msg == 2 || msg == 8 || msg == 3">
	message = <s:property value="msg" />;
</s:if>
if (message == 1) {
	 $("#sucess").fadeIn(300);
	 $("#sucess").fadeOut(9000);
     $("#conteiner-msg-sucesso ").fadeOut(9000);


	 $("#conteiner-msg").hide();
	 $("#errorEmpNull").hide();
	 $("#errorGenerated").hide();
	} else if (message == 2) {
	$("#sucess").hide();

    $("#conteiner-msg").fadeIn(300);
	$(".cpf-invalido-inexistente").fadeOut(9000);

	$("#errorEmpNull").hide();
	$("#errorGenerated").hide();
	} else if (message == 8){
		$("#sucess").hide();

		$("#errorGenerated").fadeIn(300);
        $("#error-etiqueta").fadeOut(9000);


		$("#conteiner-msg").hide();
		$("#errorEmpNull").hide();
	} else if (message == 3){
		$("#sucess").hide();
		$("#errorGenerated").hide();
		$("#conteiner-msg").hide();
		$("#errorEmpNull").show();
	} else{
		$("#sucess").hide();
		$("#errorGenerated").hide();
		$("#conteiner-msg").hide();
		$("#errorEmpNull").hide();
	}



	function bodyAppend(tagName, innerHTML) {
	    var elm;

	    elm = document.createElement(tagName);
	    elm.innerHTML = innerHTML;
	    document.body.appendChild(elm);
	}


</script>
</html>
