using System;
using System.Web;
using System.Web.UI;
using Newtonsoft.Json;
using System.Data;
namespace PankiFoodProject
{

    public partial class CrudVentas : System.Web.UI.Page
    {
        VentasServices.VentasServices conexion = new VentasServices.VentasServices();
        protected string GenerarTablaVentas()
        {
            string tablaHtml = string.Empty;

            // Obtener los datos del listado de ventas y deserializar el JSON
            string jsonDatos = conexion.ObtenerVentas();

            DataSet ds = JsonConvert.DeserializeObject<DataSet>(jsonDatos);
            DataTable dt = ds.Tables[0];

            // Generar las filas de la tabla con los datos de cada venta
            foreach (DataRow row in dt.Rows)
            {
                string id = row["ID"].ToString();
                string fecha = row["FECHAVENTA"].ToString();
                string monto = row["MONTO"].ToString();
                string id_cliente = row["IDCLIENTE"].ToString();
                string id_empleado = row["IDEMPLEADO"].ToString();
                tablaHtml += "<tr>";
                tablaHtml += $"<td>{id}</td>";
                tablaHtml += $"<td>{fecha}</td>";
                tablaHtml += $"<td>{monto}</td>";
                tablaHtml += $"<td>{id_cliente}</td>";
                tablaHtml += $"<td>{id_empleado}</td>";
                tablaHtml += "<td>";
                tablaHtml += $"<button type='button' class='btn btn-danger btn-sm mr-2' data-toggle='modal' data-target='#EliminarModal' onclick='MostrarFormularioEliminar({id}, \"{fecha}\", {monto})'>Borrar</button>";

                tablaHtml += $"<button type='button' class='btn btn-info btn-sm' onclick='MostrarFormularioActualizar({id}, \"{fecha}\", {monto})' data-toggle='modal' data-target='#actualizarModal'>Actualizar</button>";
                tablaHtml += "</td>";
                tablaHtml += "</tr>";
            }

            return tablaHtml;
        }

        public void BuscarAlimento()
        {

        }
    }
}
