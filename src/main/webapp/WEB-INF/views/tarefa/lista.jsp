<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<script type="text/javascript" src="resources/js/jquery.js"></script>
</head>
<body>

	<script type="text/javascript">
		function finalizaAgora(id){
			$.post("finalizaTarefa", {'id' : id}, function(){
				//selecionando o elemento HTML atrav�s da ID e alterando o HTML dele
				$("#tarefa_"+id).html("Finalizado");
			});
		}
	</script>

	<a href="novaTarefa">Criar uma nova tarefa</a>

	<br>
	<br>

	<table>
		<tr>
			<th>Id</th>
			<th>Descri��o</th>
			<th>Finalizado?</th>
			<th>Data de finaliza��o</th>
		</tr>
		<c:forEach items="${tarefas }" var="tarefa">
			<tr>
				<td>${tarefa.id }</td>
				<td>${tarefa.descricao }</td>
<%-- 				<c:if test="${tarefa.finalizado eq false }"> --%>
<!-- 					<td>N�o finalizado</td> -->
<%-- 				</c:if> --%>
				<c:if test="${tarefa.finalizado eq true }">
					<td>Finalizado</td>
				</c:if>
				<c:if test="${tarefa.finalizado eq false }">
					<td id="tarefa_${tarefa.id }"><a href="#"
						onclick="finalizaAgora(${tarefa.id})"> Finalizar agora! </a></td>
				</c:if>
				<td><fmt:formatDate value="${tarefa.dataFinalizacao.time }"
						pattern="dd/MM/yyyy" /></td>
				<td><a href="mostraTarefa?id=${tarefa.id }">Alterar</a></td>
				<td><a href="removeTarefa?id=${tarefa.id }">Remover</a></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>