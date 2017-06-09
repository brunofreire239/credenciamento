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
				<a href="qsm/"><img src="<s:url value="/assets/images/logo.svg"/>" /></a>
				
			 </div>

			 <nav>
			 	<ul>
			 		<li><a href = "/qsm/usuario/indexUsuario">USUÁRIOS</a></li>
			 		<li><a href = "/qsm/event/indexEvent">OPERADORA</a></li>
			 		<li><a href = "/qsm/usuario/formZebra">FICHA</a></li>
			 	</ul>
			 </nav>

		</div>
 		
	</section>

	<section id="call">
		
		
		<div class="content cad-usuario">

			<h1 class="titulo-principal">OPERADORA</h1>


			<s:form id="cadastrarEvent" action="save" namespace="event" method="POST" cssClass="formulario_cadastrar_event cad-usuario" data-parsley-validate="true" data-parsley-validation="true" theme="simple" >
				<s:hidden key="event.id" value="%{event.id}" />
				<div class="form-group">
					<div class="col-md-8">
						<label for="name">NOME DA OPERADORA:*</label>
						<input type="text" id="event.name" required="true" value="<s:property value="event.name" />"  name="event.name" class="text_input form-control"   data-parsley-pattern="[^0-9]+" data-parsley-pattern-message = "Não utilize números nesse campo." data-parsley-trigger="change" data-parsley-minlength="2" data-parsley-maxlength="50" />
					</div>
					<s:submit id="cadastrar_1" value="Cadastrar Operadora" cssClass="submit_input" />
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

		   <address>© Copyright 2015 | CERS - Cursos Online</address>

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


$(document).ready(function(){
	 $("#studentCPF").mask("999.999.999-99");
	 $("#submit_register_student_address_state").mask("aa");
	 $("#date").mask("99/99/9999");

});





</script>
<script>

	 var message = 0;
	 <s:if test="msg == 1 || msg == 2">
	 	message = <s:property value="msg" />;
	 </s:if>
	 if (message == 1) {
		$("#form_error").fadeIn(); 
		$("#form_sucess").fadeOut();
		$("#user\\.name").focus();

	} else if (message == 2) {
		$("#form_sucess").fadeIn();
		$("#form_error").fadeOut();
		$("#user\\.name").focus();
	} 
	 
	 
	function bodyAppend(tagName, innerHTML) {
	    var elm;

	    elm = document.createElement(tagName);
	    elm.innerHTML = innerHTML;
	    document.body.appendChild(elm);
	}

	
</script>
</html>
