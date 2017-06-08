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
			 		<li><a href = "/credencial/usuario/formCSV">CSV</a></li>
			 		<li><a href = "/credencial/event/indexEvent">EVENTOS</a></li>
			 		<li><a href = "/credencial/usuario/formZebra">ETIQUETA</a></li>
			 		
			 	</ul>
			 </nav>

		</div>
 		
	</section>

	<section id="call">
		
		
		<div class="content cad-usuario">

			<h1 class="titulo-principal">RESULTADOS DO EVENTOS</h1>


			<s:form id="cadastrarEvent" action="save" namespace="event" method="POST" cssClass="formulario_cadastrar_event cad-usuario" data-parsley-validate="true" data-parsley-validation="true" theme="simple" >
				<s:hidden key="event.id" value="%{event.id}" />


				<table class="tabela-relatorio">

						<!--<tr>
							<td class="titulo-evento"> <s:property value="event.name" /></td>

							

							<td class="titulo-td">NOME DO EVENTO:</td>
							<td class="result-relatorio">	<s:property value="event.name" /> </td>
						


							
						</tr>-->

						
						<thead>
							
							<tr>
							 <th colspan="4"><h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="event.name" /></h1></th></tr>

							<tr>
								<th class="total-inscritos" colspan="4"><h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total de inscritos: &nbsp;&nbsp;<s:property value="qtdTotalEvent" /></h2></th>
								

							</tr>

							<th class="total-inscritos" colspan="4"><h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total de credenciados: &nbsp;&nbsp; <s:property value="qtdTotal" /></h2></th>

							</tr>
			
					
						</thead>




						<tr>
							<td class="titulo-td">credenciados por Voucher:</td>
							<td class="result-relatorio">	<s:property value="event.voucher" /> </td>
							<td class="result-relatorio"><s:property value="voucherPercentage" />%</td>


						</tr>
						

				     	<tr>
							<td class="titulo-td"> credenciados por SmartPhone: </td>
							<td class="result-relatorio"><s:property value="event.smartPhone" /></td>
							<td class="result-relatorio"><s:property value="smartPhonePercentage" />%</td>

						</tr>

						<tr>
							<td class="titulo-td">credenciados Manualmente:</td>
							<td class="result-relatorio"><s:property value="event.manual" /></td>
							<td class="result-relatorio"><s:property value="manualPercentage" />%</td>


						</tr>

				




				</table>




		
<!--
				<div class="form-group">
					<div class="col-md-8">
						<label for="name">NOME DO EVENTO:*</label>
						<input type="text" id="event.name" required="true" value="<s:property value="event.name" />"  name="event.name" class="text_input form-control"   data-parsley-pattern="[^0-9]+" data-parsley-pattern-message = "Não utilize números nesse campo." data-parsley-trigger="change" data-parsley-minlength="2" data-parsley-maxlength="50" />
					</div>
					<div class="col-md-4">
						<label for="birthdate">DATA DO EVENTO:*</label>
						<input type="text" name="event.date" value="<s:property value="event.date" />"  id="date" class="text_input form-control"   required="true"  />
					<div class="col-md-8">
						<label for="name">Quantidade credenciado por Voucher:*</label>

						<input type="text" id="event.voucher" required="true" value="<s:property value="event.voucher" />"  name="event.voucher" class="text_input form-control"   data-parsley-pattern="[^0-9]+" data-parsley-pattern-message = "Não utilize números nesse campo." data-parsley-trigger="change" data-parsley-minlength="2" data-parsley-maxlength="50" />

						<input type="text" id="voucherPercentage" required="true" value="<s:property value="voucherPercentage" />"  name="voucherPercentage" class="text_input form-control"   data-parsley-pattern="[^0-9]+" data-parsley-pattern-message = "Não utilize números nesse campo." data-parsley-trigger="change" data-parsley-minlength="2" data-parsley-maxlength="50" />
					</div>




					<div class="col-md-8">
						<label for="name">Quantidade credenciado por Smart Phone:*</label>


						<input type="text" id="event.smartPhone" required="true" value="<s:property value="event.smartPhone" />"  name="event.smartPhone" class="text_input form-control"   data-parsley-pattern="[^0-9]+" data-parsley-pattern-message = "Não utilize números nesse campo." data-parsley-trigger="change" data-parsley-minlength="2" data-parsley-maxlength="50" />
						<input type="text" id="smartPhonePercentage" required="true" value="<s:property value="smartPhonePercentage" />"  name="smartPhonePercentage" class="text_input form-control"   data-parsley-pattern="[^0-9]+" data-parsley-pattern-message = "Não utilize números nesse campo." data-parsley-trigger="change" data-parsley-minlength="2" data-parsley-maxlength="50" />
					</div>



					<div class="col-md-8">
						<label for="name">Qauntidade credenciado Manualmente:*</label>
						<input type="text" id="event.manual" required="true" value="<s:property value="event.manual" />"  name="event.manual" class="text_input form-control"   data-parsley-pattern="[^0-9]+" data-parsley-pattern-message = "Não utilize números nesse campo." data-parsley-trigger="change" data-parsley-minlength="2" data-parsley-maxlength="50" />
						<input type="text" id="manualPercentage" required="true" value="<s:property value="manualPercentage" />"  name="manualPercentage" class="text_input form-control"   data-parsley-pattern="[^0-9]+" data-parsley-pattern-message = "Não utilize números nesse campo." data-parsley-trigger="change" data-parsley-minlength="2" data-parsley-maxlength="50" />
					</div>



					</div>
						<div class="col-md-8">
						<label for="name">Quantidade Total:*</label>
						<input type="text" id="qtdTotal" required="true" value="<s:property value="qtdTotal" />"  name="qtdTotal" class="text_input form-control"   data-parsley-pattern="[^0-9]+" data-parsley-pattern-message = "Não utilize números nesse campo." data-parsley-trigger="change" data-parsley-minlength="2" data-parsley-maxlength="50" />
					</div>
				</div>-->
			</s:form>
		</div>
		
		
		<!-- end div.content -->
	</section>
	<!-- end section#call -->


	<footer style="position:absolute;">
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
