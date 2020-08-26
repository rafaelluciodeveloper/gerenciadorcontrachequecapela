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
        <title>Contra Cheque Online - Cadastro Empresas </title>
    </head>
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
        });
    </script>
    <script type="text/javascript">
        function confirmacao(id) {
            var resposta = confirm("Tem certeza que deseja excluir esta Empresa?");

            if (resposta === true) {
                window.location.href = "/contrachequecapela/empresas/excluir/" + id;
            }
        }
    </script>
    <body>
        <div  id="centralizada">
            <div class="panel panel-default" >
                <div class="panel-heading">
                    <h3 class="panel-title" align="center"><b>Empresas - [Listagem]</b></h3>
                </div><br/>
                <p align="center">
                    <a href="${pageContext.request.contextPath}/empresas/adicionar"><span class="glyphicon glyphicon-plus"></span> Adicionar</a>
                </p>
                <table class="table table-hover">
                    <tr>
                        <td><b>Cod. Empresa</b></td>
                        <td><b>Cnpj</b></td>
                        <td><b>Razão Social</b></td>
                    </tr>
                    <c:forEach items="${empresaList}" var="empresa">
                        <tr>
                            <td>${empresa.cod_empresa}</td>
                            <td>
                                <div class="cnpj">${empresa.cnpj}</div>                       
                            </td>
                            <td>${empresa.razaosocial}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/empresas/editar/${empresa.id}"><span class="glyphicon glyphicon-pencil"></span></a>
                                <a href="#" onclick="confirmacao('${empresa.id}')"><span class="glyphicon glyphicon-trash"></span></a>
                            </td>   
                        </tr>
                    </c:forEach>
                </table>

                <div class="panel-footer" align="center"><a href="${pageContext.request.contextPath}/empresas">Voltar</a></div>

            </div>
        </div>          
    </body>
</html>
