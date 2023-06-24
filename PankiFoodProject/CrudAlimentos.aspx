<%@ Page Language="C#" Inherits="PankiFoodProject.CrudAlimentos" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />

    <title>ListarAlimento</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />

</head>
<body>
        <!-- navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand fas fa-utensils" href="#"> PankiFood</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link " href="#">Inicio</a>
                    </li>
                </ul>
            </div>
        </nav>
        
        <div class="container">
            
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h2>CRUD Alimentos</h2>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#agregarModal">Agregar</button>            </div>
            
            <form id="form1" runat="server">
            <div class="container">
                <table class="table table-striped table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>Descripcion</th>
                            <th>Precio</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%= GenerarTablaAlimentos() %>
                    </tbody>
                </table>
            </div>
        </form>
        </div>
        
        
        <!-- Modal de Agregar -->

        <div class="modal fade" id="agregarModal" tabindex="-1" role="dialog" aria-labelledby="agregarModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="agregarModalLabel">Agregar Alimento</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form runat="server">
                        <div class="form-group">
                            <label for="nombre">Nombre:</label>
                            <asp:TextBox id="txtNombre" runat="server" placeholder="Ingrese el nombre" CssClass="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="descripcion">Descripción:</label>
                            <asp:TextBox id="txtDescripcion" runat="server" TextMode="MultiLine" Rows="3" placeholder="Ingrese la descripción" CssClass="form-control"/>
                            
                        </div>
                        <div class="form-group">
                            <label for="precio">Precio:</label>
                            <asp:TextBox id="txtPrecio" runat="server" CssClass="form-control"  placeholder="Ingrese el precio" TextMode="Number"></asp:TextBox>

                            <!--<input type="number" class="form-control" id="precio" placeholder="Ingrese el precio" step="0.01" min="0"  value="1.00"> -->

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            <asp:Button id="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="GuardarAlimento" />
                        </div>
                    </form>
                </div>
                
            </div>
        </div>
    </div>
        
    <!-- Modal de Actualizar -->
    <div class="modal fade" id="actualizarModal" tabindex="-1" role="dialog" aria-labelledby="actualizarModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="actualizarModalLabel">Actualizar Alimento</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form runat="server">
                        <div class="form-group" style="display: none;"> 
                            <label for="IdActualizar">Id:</label>
                            <asp:TextBox id="txtIdActualizar" runat="server" CssClass="form-control"/>

                        </div>
                        <div class="form-group">
                            <label for="nombreActualizar">Nombre:</label>
                            <asp:TextBox id="txtNombreActualizar" runat="server" placeholder="Ingrese el nombre" CssClass="form-control"/>

                        </div>
                        <div class="form-group">
                            <label for="descripcionActualizar">Descripción:</label>
                            <asp:TextBox id="txtDescripcionActualizar" runat="server" placeholder="Ingrese la Descripcion" CssClass="form-control"/>

                        </div>
                        <div class="form-group">
                            <label for="precioActualizar">Precio:</label>
                            <asp:TextBox id="txtPrecioActualizar" runat="server" CssClass="form-control" placeholder="Ingrese el precio"></asp:TextBox>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CssClass="btn btn-primary" OnClick="ActualizarAlimento" />

                        </div>
                    </form>
                </div>
                
            </div>
        </div>
    </div>
        
    <!-- Modal de Eliminar -->
    <div class="modal fade" id="EliminarModal" tabindex="-1" role="dialog" aria-labelledby="eliminarModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="eliminarModalLabel">Esta seguro de eliminar este Alimento?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form runat="server">
                        <div class="form-group" style="display: none;">
                            <label for="idEliminar">Id:</label>
                            <asp:TextBox id="lblIdEliminar" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="nombreEliminar">Nombre:</label>
                            <asp:TextBox ID="lblNombreEliminar" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="descripcionEliminar">Descripción:</label>
                            <asp:TextBox ID="lblDescripcionEliminar" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="precioEliminar">Precio:</label>
                            <asp:TextBox ID="lblPrecioEliminar" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="BorrarAlimento" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
         <script>
            function MostrarFormularioActualizar(id, nombre, descripcion, precio) {
                document.getElementById("txtIdActualizar").value = id;
                document.getElementById("txtNombreActualizar").value = nombre;
                document.getElementById("txtDescripcionActualizar").value = descripcion;
                document.getElementById("txtPrecioActualizar").value = parseFloat(precio).toFixed(2);
            };
            
            function MostrarFormularioEliminar(id, nombre, descripcion, precio) {
                document.getElementById("lblIdEliminar").value = id;
                document.getElementById("lblNombreEliminar").value = nombre;
                document.getElementById("lblDescripcionEliminar").value = descripcion;
                document.getElementById("lblPrecioEliminar").value = precio;
            }
            
        </script>
</body>
</html>
