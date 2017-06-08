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

			<h1 class="titulo-principal">CARREGAR CSV</h1>

			
			<s:form id="formCSV" action="csv" namespace="usuario" method="POST" cssClass="formulario_CSV cad-usuario" data-parsley-validate="true" data-parsley-validation="true" theme="simple"  enctype="multipart/form-data">

			<div id="sucess" class="sucesso">
				CSV Carregado com sucesso.
			</div>
			<div id="fail" class="cad-error">
				CSV com Algum tipo de problema.
			</div>
			<div id="null" class="cad-error">
				Deve ser adicionado 1 arquivo CSV.
			</div>

			<p> Para configurar o csv siga a seguinte ordem: Nome, Email, CPF, Cidade, Estado <!--NOME  ,  EMAIL  ,  CPF  , CIDADE  ,  ESTADO:--></p>

					<div class="form-group">

						<div class="col-md-8">
							<label for="name">ARQUIVO:</label><br />
						 <input id="choice" type="file" name="fileCSV" accept="*">

					</div>

					<div class="control-group">
							<label class="control-label" for="Eventos">Eventos: </label>
							<div class="controls">
								<s:select key="event.id" name="eventId" cssClass="listEventos"  list="events" listKey="id"
									listValue="name" />
							</div>
						</div>

					<s:submit id="cadastrar_1" value="Carregar CSV" cssClass="submit_input" />
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
	 //$("#studentCPF").mask("999.999.999-99");
	 $("#submit_register_student_address_state").mask("aa");
	 $("#date").mask("99/99/9999");

});





</script>
<script>

	 var message = 0;
	 <s:if test="msg == 4 || msg == 5 || msg == 6">
	 	message = <s:property value="msg" />;
	 </s:if>
	 if (message == 4) {
		 $("#sucess").show();
		 $("#fail").hide();
		 $("#null").hide();
	} else if (message == 5) {
		 $("#sucess").hide();
		 $("#null").hide();
		 $("#fail").show();
	}  else if (message == 6) {
		 $("#sucess").hide();
		 $("#fail").hide();
		 $("#null").show();
	}
	 
	function bodyAppend(tagName, innerHTML) {
	    var elm;

	    elm = document.createElement(tagName);
	    elm.innerHTML = innerHTML;
	    document.body.appendChild(elm);
	}

	
</script>
</html>
