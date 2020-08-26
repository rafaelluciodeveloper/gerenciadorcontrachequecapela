<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=ISO-8859-1" language="java" import="java.sql.*" errorPage="" %> 
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
        <title>Contra Cheque Online </title>
    </head>
    <body>
        <div  id="centralizada">
            <div class="panel panel-default" >
                <div class="panel-heading">
                    <h3 class="panel-title" align="center"><b>Empresa -  [Cadastrando]</b></h3>
                </div>
                <div>
                    <form action="${pageContext.request.contextPath}/empresas/salvar" method="POST" >
                        <div class="form-group">
                            <label>Cod Empresa</label>
                            <input type="text" name="empresa.cod_empresa" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>Cnpj</label>
                            <input type="text" name="empresa.cnpj"  class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>Razão Social</label>
                            <input type="text" name="empresa.razaosocial"  class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>Endereço</label>
                            <input type="text" name="empresa.endereco"  class="form-control" />
                        </div>
                        <div align="center">
                            <button type="submit" class="btn btn-primary" >
                                <span class="glyphicon glyphicon-ok-circle"></span>
                                Cadastrar</button>   
                        </div>
                        <br/> 
                    </form>
                    <div class="panel-footer" align="center"><a href="${pageContext.request.contextPath}/empresas">Voltar</a></div>
                </div>        
            </div>         
    </body>
</html>
