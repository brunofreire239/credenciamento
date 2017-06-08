	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html lang="pt-br">
<link rel="stylesheet" href="<s:url value="/assets/styles/main.css"/>" />
<link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,600,700,700italic,900,600italic,400italic,300italic,200italic' rel='stylesheet' type='text/css'>
<body>

	<section id="conteinerTopo">
		
		<div class="content-topo">
		     
		     <div id="logo">
				<a href="credencial/"><img src="<s:url value="/assets/images/logo.svg"/>" /></a>
				
			 </div>

			 <nav>
			 	<ul>
			 		<li><a href = "/credencial/usuario/indexUsuario">USUÁRIOS</a></li>
			 		<li><a href = "/credencial/usuario/formEvent">OPERADORA</a></li>
			 		<li><a href = "/credencial/usuario/formZebra">FICHA</a></li>
			 	
			 	</ul>
			 </nav>

		</div>
 		
	</section>

	<section id="call">
		
		
		<div class="content cad-usuario">

			<h1 class="titulo-principal"><!--TELA DE GERAÇÃO DE ETIQUETA:--> GERAÇÃO DE FICHA</h1>


			<s:form id="formZebra" action="zebra" namespace="usuario" method="POST" cssClass="formulario_zebra cad-usuario" data-parsley-validate="true" data-parsley-validation="true" theme="simple">
				
				<section id="sucess">
					 <div class="sucesso">
						Ficha gerada com sucesso.
					</div>
               	</section>

				<div id="errorEmpNull" class="cad-error">
					Existe problema com a conexão com a impressora.
				</div>

               <section id="conteiner-msg">
             	  <div  class="cpf-invalido-inexistente"> Este Doador não existe. </div>
               </section>

				<div class="form-group">
					<div class="col-md-8">
						<label for="name"> ID - Doador </label>
						<input type="text" id="id" name="id" required="true" class="text_input form-control"   data-parsley-trigger="change" data-parsley-minlength="1" data-parsley-maxlength="50" />
					</div>
					<div class="col-md-8">
						<label for="name"> Valor  </label></br>
						<input type="text" id="valor" name="valor" class="text_input form-control"   data-parsley-trigger="change"  data-parsley-maxlength="50" style="width:150px;font-size: 17px" />
					</div>
					<s:submit id="cadastrar_1" value="Gerar Ficha" cssClass="submit_input" />
				</div>
			</s:form>

		</div>
		
		
		<!-- end div.content -->
	</section>
	<!-- end section#call -->

	<footer>
		<div class="content">

		   <div class="logo-rodape"> 
		       <img src="<s:url value="/assets/images/logo.svg"/>" /><br /> 
		   </div>

		   <address>© Copyright 2016 | QSM - Marketing</address>

		</div>

	</footer>


	<!-- Javascript -->
	<script type ="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.2/angular.min.js"></script>
	<script type ="text/javascript" src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.2/angular.min.js"></script>
	<script type="text/javascript" src="<s:url value="/assets/scripts/jquery.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/assets/scripts/parallax.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/assets/scripts/main.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/assets/scripts/parsley.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/assets/scripts/jquery.mask.min.js"/>"></script>

</body>
<script type="text/javascript">
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
} else if (message == 2) {
	$("#sucess").hide();
    $("#conteiner-msg").fadeIn(300);
	$(".cpf-invalido-inexistente").fadeOut(9000);
	$("#errorEmpNull").hide();
} else if (message == 8){
	$("#sucess").hide();
    $("#error-etiqueta").fadeOut(9000);
	$("#conteiner-msg").hide();
	$("#errorEmpNull").hide();
} else if (message == 3){
	$("#conteiner-msg , #sucess").hide();
	$("#errorEmpNull").show();
} else{
	$("#sucess").hide();
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

<script>
var mask = {
 money: function() {
 	var el = this
 	,exec = function(v) {
 	v = v.replace(/\D/g,"");
 	v = new String(Number(v));
 	var len = v.length;
 	if (1== len)
 	v = v.replace(/(\d)/,"0,0$1");
 	else if (2 == len)
 	v = v.replace(/(\d)/,"0,$1");
 	else if (len > 2) {
 	v = v.replace(/(\d{2})$/,',$1');
 	}
 	return v;
 	};

 	setTimeout(function(){
 	el.value = exec(el.value);
 	},1);
 }

}

$(function(){
 $('#valor').bind('keypress',mask.money)
});

$("#id").mask("9999999999999");
</script>
</html>
