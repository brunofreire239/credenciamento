<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html lang="pt-br">


<link rel="stylesheet" href="<s:url value="/assets/styles/main.css"/>" />
<link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,600,700,700italic,900,600italic,400italic,300italic,200italic' rel='stylesheet' type='text/css'>
<body class="index">

	<!--============-->
	<!--=== CALL ===-->
	<!--============-->

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


	<footer>
		<div class="content">

		   <div class="logo-rodape"> 
		       <img src="<s:url value="/assets/images/logo.svg"/>" /><br /> 
		   </div>

		   <address>© Copyright 2016 | BF - Bruno Freire</address>

		</div>

	</footer>



	<!--<section id="bg-index">

	</section>-->
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

	 
	function bodyAppend(tagName, innerHTML) {
	    var elm;

	    elm = document.createElement(tagName);
	    elm.innerHTML = innerHTML;
	    document.body.appendChild(elm);
	}

	
</script>
</html>
