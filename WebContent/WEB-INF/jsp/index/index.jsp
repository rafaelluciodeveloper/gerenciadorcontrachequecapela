<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Importa��es CSS -->
        <link href="${pageContext.request.contextPath}/resource/css/bootstrap.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="${pageContext.request.contextPath}/resource/css/style.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="${pageContext.request.contextPath}/resource/css/sweet-alert.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="${pageContext.request.contextPath}/resource/css/jquery-ui.theme.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="${pageContext.request.contextPath}/resource/css/jquery-ui.structure.css" rel="stylesheet" type="text/css" media="screen" />
         <!-- Importa��es JS -->
        <script src="${pageContext.request.contextPath}/resource/js/bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/sweet-alert.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/jquery-1.11.1.min.js"></script> 
        <script src="${pageContext.request.contextPath}/resource/js/jquery-ui.js"></script> 
        <title>Contra Cheque Online </title>
    </head>
    <script type="text/javascript">
        var msg = '${teste}';
        $(document).ready(function () {
            if (msg === 'error') {
                swal("Oops!", "Matr�cula ou Senha Inv�lidos", "error");
            } 
        });
    </script>
    <body>
        <div class="panel panel-primary" id="login">
            <div class="panel-heading" align="center"><b>Contra Cheque Online</b></div>
            <div class="panel-body">
                <div align="center">
                    <img src="${pageContext.request.contextPath}/resource/img/logo_final.png" width="250" height="50" />
                </div>
                <form role="form" method="POST" action="${pageContext.request.contextPath}/autenticar">
                    <div class="form-group">
                        <label for="matricula">Matr�cula</label>
                        <input type="text" class="form-control" id="matricula" placeholder="Informe a Matr�cula" name="usuario.nome" required />
                    </div>
                    <div class="form-group">
                        <label for="senha">Senha</label>
                        <input type="password" class="form-control" id="senha" placeholder="Informe a Senha" name="usuario.senha" required />
                    </div>
                    <div align="center">
                        <button type="submit" class="btn btn-primary" />
                            <span class="glyphicon glyphicon-ok-circle white"></span>
                            Acessar
                        </button>
                    </div>
                </form>
            </div>
            <p align="center">
                <i>Desenvolvido por Padr�o Inform�tica</i>
            </p>
        </div>
    </body>
</html>