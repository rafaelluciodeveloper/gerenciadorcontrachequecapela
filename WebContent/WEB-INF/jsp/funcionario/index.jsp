<%-- 
    Document   : index
    Created on : 25/10/2014, 02:02:53
    Author     : Rafael
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/resource/css/bootstrap.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="${pageContext.request.contextPath}/resource/css/style.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="${pageContext.request.contextPath}/resource/css/sweet-alert.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="${pageContext.request.contextPath}/resource/css/jquery-ui.theme.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="${pageContext.request.contextPath}/resource/css/jquery-ui.structure.css" rel="stylesheet" type="text/css" media="screen" />
        <script src="${pageContext.request.contextPath}/resource/js/bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/sweet-alert.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/jquery-1.11.1.min.js"></script> 
        <script src="${pageContext.request.contextPath}/resource/js/jquery-ui.js"></script> 
        <script src="${pageContext.request.contextPath}/resource/js/jquery.mask.min.js"></script> 
        <title>Contra Cheque Online</title>
    </head>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnImportar').click(function () {
                $("form").toggle("slow");
            });
        });
    </script>
    <script type="text/javascript">
        var msg = '${msg}';
        $(document).ready(function () {
            if (msg === 'success') {
                swal("OK!", "${msg2}", "success");
            }
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".cnpj").mask("00.000.000/0000-00");
            $("form").hide();
        });
    </script>
    <script type="text/javascript">
        function excluir(id) {
            if (confirm("Deseja remover esse registro?")) {
                "${pageContext.request.contextPath}/empresas/excluir/" + id;
            }
        }
    </script>
    <script type="text/javascript">
        function confirmacao(id) {
            var resposta = confirm("Tem certeza que deseja excluir este Funcionario?");

            if (resposta === true) {
                window.location.href = "/contrachequecapela/funcionarios/excluir/" + id;
            }
        }
    </script>
    <body>
        <div  id="centralizada">
            <div class="panel panel-default" >
                <div class="panel-heading">
                    <h3 class="panel-title" align="center"><b>Funcionarios - [Listagem]</b></h3>
                </div><br/>
                <p align="center">
                    <a href="${pageContext.request.contextPath}/funcionarios/adicionar"><span class="glyphicon glyphicon-plus"></span> Cadastrar</a>
                    <a id="btnImportar">
                        <span class="glyphicon glyphicon-import"></span> 
                        Importar (TXT)</a>
                </p>
                <div id="formImportar" align="center">
                    <form action="${pageContext.request.contextPath}/funcionarios/importar" method="POST" class="form-inline">
                        <label class="form">Caminho</label>
                        <input class="form-control" type="text" name="file" value="C:\temp\funcionarios.txt">
                        <button class="btn btn-primary" type="submit"> 
                            <span class="glyphicon glyphicon-import white"></span> 
                            Importar
                        </button>
                    </form>       
                </div>
                <table class="table table-hover">
                    <tr>
                        <td><b>Matricula</b></td>
                        <td><b>Nome</b></td>
                        <td><b>Cpf</b></td>
                        <td><b>Admissão</b></td>     
                    </tr>
                    <c:forEach items="${funcionarioList}" var="funcionario">
                        <tr>
                            <td>${funcionario.matricula}</td>
                            <td>
                                <div>${funcionario.nome}</div>                       
                            </td>
                            <td>
                                <div class="cpf">${funcionario.cpf}</div>                       
                            </td>
                            <td>${funcionario.admissao}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/funcionarios/editar/${funcionario.id}"><span class="glyphicon glyphicon-pencil"></span></a>
                                <a onclick="confirmacao('${funcionario.id}')" href="#"><span class="glyphicon glyphicon-trash"></span></a>
                            </td>   
                        </tr>
                    </c:forEach>
                </table>
                <div class="panel-footer" align="center"><a href="${pageContext.request.contextPath}/funcionarios">Voltar</a></div>
            </div>  
        </div> 
    </body>
</html>
