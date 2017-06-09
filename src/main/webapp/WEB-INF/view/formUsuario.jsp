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


			<h1 class="titulo-principal">CADASTRO DE USUÁRIO</h1>
			
			<div id="email"  class="cad-error">
					Este EMAIL já esta cadastrado.
			</div>
		 

			<s:form id="cadastrarEvent" action="save" namespace="usuario" method="POST" cssClass="formulario_cadastrar_event cad-usuario" data-parsley-validate="true" data-parsley-validation="true"  theme="simple">
						<s:hidden key="user.id" value="%{user.id}" />

					<div class="col-md-8">
						<label for="name">NOME COMPLETO:*</label><br />
						<input type="text" id="user.name" value="<s:property value="user.name" />"  name="user.name" class="text_input form-control"  required="true" data-parsley-pattern="[^0-9]+" data-parsley-pattern-message = "Não utilize números nesse campo." data-parsley-trigger="change" data-parsley-minlength="2" data-parsley-maxlength="50" />
					</div>
					
					<div class="col-md-8">
						<label for="name">Telefone :*</label><br />
						<input type="text"  value="<s:property value="user.telefone" />" style="width:25%; margin-right:25% " type="tel" name="user.telefone" class="text_input form-control"  id="telefone" required="true" pattern="\([0-9]{2}\)[\s][0-9]{4}-[0-9]{4,5}" />
					</div>
					
					<div class="col-md-3">
						<label for="submit_register_student_address_city">CIDADE:*</label><br />
						<input type="text" name="user.city"  id="submit_register_student_address_city" value="<s:property value="user.city" />"  class="text_input form-control"  required="true" data-parsley-maxlength="30" />
					</div>
					
						<div class="col-md-3">
						<label for="submit_register_student_address_city">BAIRRO:*</label><br />
						<input type="text" name="user.bairro"  id="submit_register_student_address_city" value="<s:property value="user.bairro" />"  class="text_input form-control"  required="true" />
					</div>
					
					<div class="col-md-4">
						<label for="studentCPF">RUA:*</label><br />
						<input type="text" name="user.rua" value="<s:property value="user.rua" />"   class="text_input form-control"  required="true"  />
					</div>

					<div class="col-md-4">
						<label for="studentCPF">N°:*</label><br />
						<input style="width:150px;font-size: 17px" type="text" name="user.numero" value="<s:property value="user.numero" />"   class="text_input form-control"  required="true"  />
					</div>
					
					<div class="col-md-4">
						<label for="studentCPF">Edificio:</label><br />
						<input type="text" name="user.edificio" value="<s:property value="user.edificio" />"   class="text_input form-control"    />
					</div>
					
					<div class="col-md-4">
						<label for="studentCPF">Bloco:</label><br />
						<input style="width:150px;font-size: 17px" type="text" name="user.bloco" value="<s:property value="user.bloco" />"   class="text_input form-control"    />
					</div>
					
					<div class="col-md-4">
						<label for="studentCPF">Apartamento:</label><br />
						<input style="width:150px;font-size: 17px" type="text" name="user.apt" value="<s:property value="user.apt" />"   class="text_input form-control"    />
					</div>
					
					<div class="col-md-4">
						<label for="studentCPF">Andar:</label><br />
						<input  style="width:150px;font-size: 17px" type="text" name="user.andar" value="<s:property value="user.andar" />"   class="text_input form-control"    />
					</div>
					
					
					<div class="col-md-4">
						<label for="studentEmail">OBSERVAÇÃO: </label><br />
						<input type="text" name="user.obs" value="<s:property value="user.obs" />"  data-parsley-trigger="change"  class="text_input form-control txt"  />
					</div>
					
					<div class="col-md-4">
						<label for="studentEmail">Valor Padrão: </label><br />
						<input style="width:150px;font-size: 17px" id="valor" type="text" name="user.valor" value="<s:property value="user.valor" />"  data-parsley-trigger="change"  class="text_input form-control txt"  />
					</div>
					
						<div class="control-group">
							<label class="control-label" for="Eventos">OPERADORAS: </label>
							<div class="controls">
								<s:select key="event.id" value="%{user.event.id}" name="eventId" list="events" cssClass="listEventos"  listKey="id"
									listValue="name" />
							</div>
						</div>
					<s:submit id="cadastrar_1" value="Cadastrar Usuário" cssClass="submit_input" />

	</s:form>
		</div>
		<!-- end div.content -->
	</section>

	<footer style="position:relative;">
		<div class="content">

		   <div class="logo-rodape"> 
		       <img src="<s:url value="/assets/images/logo.svg"/>" /><br /> 
		   </div>

		   <address>© Copyright 2016 | BF - Bruno Freire</address>

		</div>

	</footer>

	<!-- end section#call -->
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
	 $("#date").mask("99/99/9999");

});


$("#telefone").mask("(00) 0000-00009");
</script>
<script>

	 var message = 0;
	 <s:if test="msg == 5 || msg == 4 ">
	 	message = <s:property value="msg" />;
	 </s:if>
	 if (message == 5) {
		$("#cpf").show();
		$("#email").hide();
	} else if (message == 4){
		$("#email").show();
		$("#cpf").hide();
	}else  {
		$("#cpf").hide();
		$("#email").hide();
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

</script>
</html>
