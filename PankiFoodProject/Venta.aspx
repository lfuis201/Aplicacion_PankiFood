<%@ Page Language="C#" Inherits="PankiFoodProject.Venta" %>
<!DOCTYPE html>
<html>
<head runat="server">
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<title>Venta</title>
</head>
<body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">PankiFood</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Login.aspx">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="InformeVentas">Ventas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Clientes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="CrudAlimentos.aspx">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Login.aspx">Cerrar sesión</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <h1>Formulario de Ventas</h1>
            <form id="form1" runat="server">
                <h2>Bienvenido(a) <% =HttpUtility.HtmlEncode(Request.QueryString["username"]) %>!</h2>
                
                <div class="row">
                  <div class="col-md-4">
                    <div class="form-group">
                            <label class="font-weight-bold">Codigo Usuario:</label>
                            <asp:TextBox id="txtIdUser" runat="server" CssClass="form-control" placeholder="Ingrese el ID del cliente"></asp:TextBox> 
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                            <asp:Button ID="btnBuscarUsuario" runat="server" CssClass="btn btn-outline-secondary btn-buscar-usuario" Text="Buscar" OnClick="btnBuscarUsuario_Click" />
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                            <asp:TextBox id="txtNombreUser" runat="server" CssClass="form-control" ></asp:TextBox> 
                      
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-4">
                    <div class="form-group">
                            <label class="font-weight-bold">Codigo Plato:</label>
                        <asp:TextBox id="txtIdAlimento" runat="server" CssClass="form-control" placeholder="Ingrese el codigo del alimento"></asp:TextBox> 
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                            <asp:Button ID="btnBuscarAlimento" runat="server" CssClass="btn btn-outline-secondary btn-buscar-alimento" Text="Buscar" OnClick="btnBuscarAlimento_Click" />
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                        <asp:TextBox id="txtNombreAlimento" runat="server" CssClass="form-control"></asp:TextBox> 
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-4">
                    <div class="form-group">
                            <label class="font-weight-bold">Precio:</label>
                            <asp:TextBox id="txtPrecioAlimento" runat="server" CssClass="form-control"></asp:TextBox> 
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-4">
                    <div class="form-group">
                            <label class="font-weight-bold">Cantidad:</label>
                                                        <asp:TextBox id="txtCantidad" runat="server" CssClass="form-control"></asp:TextBox> 

                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-4">
                         <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" />
                  </div>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID de Usuario</th>
                            <th>Código del Alimento</th>
                            <th>Precio</th>
                            <th>Cantidad</th>
                           
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Literal ID="tablaProductosLiteral" runat="server"></asp:Literal>
                    </tbody>
                </table>

                

                <asp:Button ID="btnVenta" runat="server" Text="CrearVenta" CssClass="btn btn-primary"/>

            </form>    
            
             
        </div>
	    
        
        <script>
            function agregarProducto() {
                // Obtener los valores ingresados por el usuario
                  var usuario = document.getElementById('txtIdUser').value;
                  var alimento = document.getElementById('txtIdAlimento').value;
                  var precio = document.getElementById('txtPrecioAlimento').value;
                  var cantidad = document.getElementById('cantidad').value;

                // Crear la fila de la tabla con los valores ingresados
                var fila = "<tr><td>" + usuario + "</td><td>" + alimento + "</td><td>" + precio + "</td><td>" + cantidad + "</td></tr>";

                // Agregar la fila a la tabla
                document.getElementById('tablaProductos').innerHTML += fila;

                // Limpiar los campos del formulario
                document.getElementById('txtIdUser').value = '';
                document.getElementById('txtIdAlimento').value = '';
                document.getElementById('txtPrecioAlimento').value = '';
                document.getElementById('cantidad').value = '';

            }
        </script>
</body>
</html>
