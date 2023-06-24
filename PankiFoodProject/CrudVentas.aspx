<%@ Page Language="C#" Inherits="PankiFoodProject.CrudVentas" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Listado de Ventas</title>
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
   
</head>
<body>
        
    <form id="form1" runat="server">
        <div class="container">
            <h1>Listado de Ventas</h1>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                            <th>Fecha</th>
                            <th>Monto</th>
                            <th>id_cliente</th>
                            <th>id_empleado</th>
                            <th>Acciones</th>
                            
                    </tr>
                </thead>
                <tbody>
                    <%= GenerarTablaVentas() %>
                </tbody>
            </table>
        </div>
    </form>
       
        <script>
            function agregarProducto() {
                // Obtener los valores ingresados por el usuario
                  var usuario = document.getElementById('usuario').value;
                  var alimento = document.getElementById('alimento').value;
                  var precio = document.getElementById('precio').value;
                  var cantidad = document.getElementById('cantidad').value;

                // Crear la fila de la tabla con los valores ingresados
                var fila = "<tr><td>" + usuario + "</td><td>" + alimento + "</td><td>" + precio + "</td><td>" + cantidad + "</td></tr>";

                // Agregar la fila a la tabla
                document.getElementById('tablaProductos').innerHTML += fila;

                // Limpiar los campos del formulario
                document.getElementById('usuario').value = '';
                document.getElementById('alimento').value = '';
                document.getElementById('precio').value = '';
                document.getElementById('cantidad').value = '';

            }
        </script>
</body>
</html>