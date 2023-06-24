<%@ Page Language="C#" Inherits="PankiFoodProject.CrudVenta"%>

<!DOCTYPE html>
<html>
<head runat="server">
	<title>CrudVenta</title>
            <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
</head>
    
<body>
        <div class="container">
             <h1>Formulario de Ventas</h1>
        	<form id="form1" runat="server">
                    <div class="row">
                          <div class="col-md-4">
                            <div class="form-group">
                                <asp:TextBox id="lblIdUsuario" runat="server" CssClass="form-control" placeholder="Ingrese el Código del Alimento"></asp:TextBox>
                            </div>
                          </div>
                          <div class="col-md-4">
                            <div class="form-group">
                                
                              
                            </div>
                          </div>
                          <div class="col-md-4">
                            <div class="form-group">
                                     
                                <asp:TextBox id="txtNombreUser" runat="server" CssClass="form-control"readonly="true"></asp:TextBox>
                              
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-4">
                            <div class="form-group">
                              <input type="text" class="form-control" id="alimento" placeholder="Ingrese el Código del Alimento">
                            </div>
                          </div>
                          <div class="col-md-4">
                            <div class="form-group">
                            </div>
                          </div>
                          <div class="col-md-4">
                            <div class="form-group">
                              <asp:TextBox id="txtAlimento" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-4">
                            <div class="form-group">
                              <input type="number" class="form-control" id="precio" placeholder="Ingrese el Precio">
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-4">
                            <div class="form-group">
                              <input type="number" class="form-control" id="cantidad" placeholder="Ingrese la Cantidad">
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-4">
                            <button type="button" class="btn btn-primary" onclick="agregarProducto()">Agregar</button>
                          </div>
                        </div>
                
                
                <h2>Productos</h2>
                <table class="table">
                  <thead>
                    <tr>
                      <th>ID de Usuario</th>
                      <th>Código del Alimento</th>
                      <th>Precio</th>
                      <th>Cantidad</th>
                    </tr>
                  </thead>
                  <tbody id="tablaProductos">
                    <!-- Aquí se agregarán las filas de los productos -->
                  </tbody>
                </table>
                    
        	</form>
        </div>
        
        
</body>
</html>
