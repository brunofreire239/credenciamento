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

				<h1 class="titulo-principal">CADASTRO DE USUÁRIO</h1>


				<div class="col-md-4 cad-usuario" >

							
							<a href="/credencial/usuario/formUsuario">
								<span class="btn-incluir">
						    	Incluir Novo		
							    </span>
							</a>
						<div id="sucess" class="sucesso">
						Usuário cadastrado com sucesso.
						</div>
						<div id="edit" class="sucesso">
						Usuário Alterado com sucesso.
						</div>
						<div id="remove" class="cad-error">
						Usuário Removido com sucesso.
						</div>
							<table class="tabela">
								<thead>
									<tr>
										<th  class="titulo" width=75>ID:</th>
										<th class="titulo">Nome:</th>
										<th class="titulo">Operadora:</th>
										<th class="titulo acao">Editar</th>
										<th class="titulo acao">excluir</th>
									</tr>
								</thead>
						<tbody>
								<s:subset source="usuarios" >
									<s:iterator status="stat">
										<tr>
											<td><s:property value="id" /></td>
											<td><s:property value="name" /></td>
											<td><s:property value="event.name" /></td>
											<td class="titulo acao">
											<s:url id="updateUsur" action="updateUser" var="updateUser">
														<s:param name="id">
															<s:property value="id" />
														</s:param>
													</s:url>
													<s:a href="%{updateUser}" cssClass="update">
														<i class="icon-pencil">&nbsp;	
													<img src="../assets/images/ico-atualizar.jpg" alt=""></i>
													</s:a>&nbsp;	
												
											</td>

											<td class="titulo acao">
													<s:url id="deleteUser" action="deleteUser" var="deleteUser">
														<s:param name="id">
															<s:property value="id" />
														</s:param>
													</s:url>
													<s:a href="%{deleteUser}" cssClass="delete">
														<i class="icon-pencil">&nbsp;	
													<img src="../assets/images/ico-delete.jpg" alt=""></i>
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


	<%-- <footer style="position:absolute;">
		<div class="content">

		   <div class="logo-rodape"> 
		       <img src="<s:url value="/assets/images/logo.svg"/>" /><br /> 
		   </div>
		   <address>© Copyright 2016 | BF - Bruno Freire</address>
		</div>
	</footer> --%>
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
</script>
<script>

	 var message = 0;
	 <s:if test="msg == 1 || msg == 2 || msg == 3">
	 	message = <s:property value="msg" />;
	 </s:if>
	 if (message == 1) {
		 $("#sucess").show();
		 $("#edit").hide();
		 $("#remove").hide();
	} else if (message == 2) {
		$("#sucess").hide();
		$("#remove").hide();
		$("#edit").show();
	} else if (message == 3) {
		$("#sucess").hide();
		$("#remove").show();
		$("#edit").hide();
	}else{
		$("#sucess").hide();
		$("#remove").hide();
		$("#edit").hide();
	}  
</script>
</html>