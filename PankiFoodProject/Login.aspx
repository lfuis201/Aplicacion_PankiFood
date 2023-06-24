<%@ Page Language="C#" Inherits="PankiFoodProject.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Iniciar sesión</title>
</head>
<body class="d-flex align-items-center justify-content-center">
    <form id="form1" runat="server"  class="border p-4 rounded">
        <h2 class="text-center">Login PankiFood</h2>
        <div class="form-group">
            <label for="txtUsername">Usuario:</label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtPassword">Contraseña:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="text-center">
            <asp:Button ID="btnLogin" runat="server" Text="Iniciar sesión" OnClick="btnLogin_Click" CssClass="btn btn-primary" />
        </div>
    </form>
        
</body>
</html>