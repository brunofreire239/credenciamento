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
			 		<li><a href = "/credencial/event/indexEvent">OPERADORA</a></li>
			 		<li><a href = "/credencial/usuario/formZebra">FICHA</a></li>
			 		
			 	</ul>
			 </nav>

		</div>
 		
	</section>

	<section id="call">
		
		
		<div class="content cad-usuario">

			<h1 class="titulo-principal">OPERADORAS</h1>
				<div class="col-md-4 cad-usuario">

					<a href="/credencial/event/formEvent">	
						<span class="btn-incluir">
						    	Incluir Novo
						</span>
					</a>	
					<div id="sucess"  class="sucesso">
					Operadora cadastrado com sucesso.
					</div>
					<div id="edit"  class="sucesso">
					Operadora Alterado com sucesso.
					</div>
					<table class="tabela">
								<thead>
									<tr>
										<th  class="titulo" width=75>ID:</th>
										<th class="titulo">Titulo:</th>
										<th class="tcenter acao">editar</th>
									
									</tr>
								</thead>
						<tbody>
								<s:subset source="events" >
									<s:iterator status="stat">
										<tr>
											<td><s:property value="id" /></td>
											<td><s:property value="name" /></td>
											<td class="titulo acao">
											<s:url id="updateEvent" action="updateEvent" var="updateEvent">
														<s:param name="id">
															<s:property value="id" />
														</s:param>
													</s:url>
													<s:a href="%{updateEvent}" cssClass="update">
														<i class="icon-pencil">&nbsp;&nbsp;&nbsp;		
													<img src="../assets/images/ico-atualizar.jpg" alt=""></i>
													</s:a>&nbsp;	
											
										
											<s:url id="deleteEvent" action="deleteEvent" var="deleteEvent">
														<s:param name="id">
															<s:property value="id" />
														</s:param>
													</s:url>
													<s:a href="%{deleteEvent}" cssClass="delete">
														<i class="icon-pencil">Delete</i>
													</s:a>&nbsp;
													</td>	
										</tr>
									</s:iterator>
									</s:subset>
						        <tbody>
											
					</table>

		    </div>	
		</div>
		
		
		<!-- end div.content -->
	</section>
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
	 $("#submit_register_student_address_state").mask("aa");
	 $("#date").mask("99/99/9999");

});





</script>
<script>
	 var messageEvent = 0;
	 <s:if test="messageEvent == 1 || messageEvent == 2">
	 messageEvent = <s:property value="messageEvent" />;
	 </s:if>
	 if (messageEvent == 1) {
		$("#sucess").show();
		$("#edit").hide();
	} else if(messageEvent == 2){
		$("#sucess").hide();
		$("#edit").show();
	} 
	 
	function bodyAppend(tagName, innerHTML) {
	    var elm;

	    elm = document.createElement(tagName);
	    elm.innerHTML = innerHTML;
	    document.body.appendChild(elm);
	}

	
</script>
</html>
