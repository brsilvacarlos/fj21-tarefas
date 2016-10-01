<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<body>
	<h3>Adicionar tarefas</h3>
	<form:errors path="tarefa.descricao" />
	<form action="<c:url value="/tarefa/adiciona"/>" method="post">
		Descrição: <br>
		<textarea rows="3" cols="100" name="descricao"></textarea> <br>
		<input type="submit" value="Adicionar">
	</form>
</body>
</html>