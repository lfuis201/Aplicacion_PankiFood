using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using Newtonsoft.Json;
using System.Data;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;


namespace PankiFoodProject
{

    public partial class Venta : System.Web.UI.Page
    {

        ClientesServices.ClientesServices conexion = new ClientesServices.ClientesServices();
        AlimentoService.AlimentoService alimento = new AlimentoService.AlimentoService();
        localhost.DetalleVentasServices detalle = new localhost.DetalleVentasServices();

        private List<Dictionary<string, object>> listaVentas;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Verificar si la variable de sesión existe
            if (Session["ListaVentas"] == null)
            {
                // Si no existe, inicializar la lista de ventas
                listaVentas = new List<Dictionary<string, object>>();
                // Guardar la lista de ventas en la variable de sesión
                Session["ListaVentas"] = listaVentas;
            }
            else
            {
                // Si la variable de sesión existe, obtener la lista de ventas almacenada
                listaVentas = (List<Dictionary<string, object>>)Session["ListaVentas"];
            }


        }

        protected void btnBuscarUsuario_Click(object sender, EventArgs e)
        {
            int idUsuario = int.Parse(txtIdUser.Text);





            string jsonDatos = conexion.ListarClientePorId(idUsuario);
            JObject cliente = JObject.Parse(jsonDatos);
            string nombreCliente = cliente["Nombre"].ToString();

            txtNombreUser.Text = nombreCliente;


        }

        protected void btnBuscarAlimento_Click(object sender, EventArgs e)
        {
            int idAlimento = int.Parse(txtIdAlimento.Text);
            string jsonDatos = alimento.ObtenerAlimentoPorId(idAlimento);


            JArray alimentos = JArray.Parse(jsonDatos);

            JObject alimento1 = (JObject)alimentos[0];
            string nombreAlimento = alimento1["NOMBRE"].ToString();
            string PrecioAlimento = alimento1["PRECIO"].ToString();
            txtNombreAlimento.Text = nombreAlimento;
            txtPrecioAlimento.Text = PrecioAlimento;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            // Obtener los valores de los campos de texto
            int id = Convert.ToInt32(txtIdUser.Text);
            int idVenta = Convert.ToInt32(txtIdAlimento.Text);

            int idAlimento = Convert.ToInt32(txtIdAlimento.Text);
            int cantidad = Convert.ToInt32(txtCantidad.Text);
            decimal precioUnitario = Convert.ToDecimal(txtPrecioAlimento.Text);
            string fechaVenta = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss");
            decimal monto = precioUnitario * cantidad;
            int idCliente = Convert.ToInt32(txtIdUser.Text);
            Dictionary<string, object> venta = new Dictionary<string, object>
            {
                { "ID", id },
                { "IDVENTA", idVenta },
                { "IDALIMENTO", idAlimento },
                { "CANTIDAD", cantidad },
                { "PRECIOUNITARIO", precioUnitario },

            };

            // Agregar el diccionario a la lista de ventas
            listaVentas.Add(venta);

            // Actualizar la variable de sesión con la lista de ventas actualizada
            Session["ListaVentas"] = listaVentas;

            // Mostrar la lista de ventas actualizada en la tabla
            tablaProductosLiteral.Text = MostrarListaVentas();

            // Limpiar los campos de texto para permitir agregar más ventas
            LimpiarCamposTexto();

        }

        protected string MostrarListaVentas()
        {
            string tablaHtml = string.Empty;

            // Generar las filas de productos y agregarlas al elemento <tbody>
            foreach (Dictionary<string, object> venta in listaVentas)
            {
                // Obtener los valores de los atributos de la venta
                int id = Convert.ToInt32(venta["ID"]);
                int idVenta = Convert.ToInt32(venta["IDVENTA"]);
                int idAlimento = Convert.ToInt32(venta["IDALIMENTO"]);
                int cantidad = Convert.ToInt32(venta["CANTIDAD"]);
                decimal precioUnitario = Convert.ToDecimal(venta["PRECIOUNITARIO"]);
               

                tablaHtml += "<tr>";
                tablaHtml += $"<td>{id}</td>";
                tablaHtml += $"<td>{idAlimento}</td>";
                tablaHtml += $"<td>{precioUnitario}</td>";
                tablaHtml += $"<td>{cantidad}</td>";

                tablaHtml += "</tr>";
            }

            tablaHtml += "</tbody>";
            tablaHtml += "</table>";

            return tablaHtml;
        }


        protected void LimpiarCamposTexto()
        {
            txtIdUser.Text = string.Empty;
            txtIdAlimento.Text = string.Empty;
            txtNombreAlimento.Text = string.Empty;
            txtPrecioAlimento.Text = string.Empty;
            txtCantidad.Text = string.Empty;
        }

        protected void btnVenta_Click(object sender, EventArgs e)
        {
            // Recorrer la lista de ventas y crear la venta correspondiente para cada elemento
            foreach (Dictionary<string, object> venta in listaVentas)
            {
                int idVenta = Convert.ToInt32(venta["IDVENTA"]);
                int idAlimento = Convert.ToInt32(venta["IDALIMENTO"]);
                int cantidad = Convert.ToInt32(venta["CANTIDAD"]);
                float precioUnitario = Convert.ToSingle(venta["PRECIOUNITARIO"]);
              

                // Utilizar el servicio o método necesario para crear la venta
               
                detalle.CrearDetalleVenta(idVenta, idAlimento, cantidad, precioUnitario);
               
            }

            // Limpiar la lista de ventas y la variable de sesión

            Session["ListaVentas"] = null;

            // Mostrar un mensaje de éxito o redireccionar a otra página
            // ...
        }

    }
}
