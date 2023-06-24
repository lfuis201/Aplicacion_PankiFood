using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using Newtonsoft.Json;
using System.Data;
using System.Web.UI.WebControls;

namespace PankiFoodProject
{

    public partial class CrudAlimentos : System.Web.UI.Page
    {
        AlimentoService.AlimentoService conexion = new AlimentoService.AlimentoService();

        protected string GenerarTablaAlimentos()
        {
            string tablaHtml = string.Empty;

            // Obtener los datos del listado alimento y deserializar el JSON
            string jsonDatos = conexion.Listado_Alimento();

            DataSet ds = JsonConvert.DeserializeObject<DataSet>(jsonDatos);
            DataTable dt = ds.Tables[0];

            // Generar las filas de la tabla con los datos de cada alimento
            foreach (DataRow row in dt.Rows)
            {
                string id = row["ID"].ToString();
                string nombre = row["NOMBRE"].ToString();
                string descripcion = row["DESCRIPCION"].ToString();
                string precio = row["PRECIO"].ToString();

                tablaHtml += "<tr>";
                tablaHtml += $"<td>{id}</td>";
                tablaHtml += $"<td>{nombre}</td>";
                tablaHtml += $"<td>{descripcion}</td>";
                tablaHtml += $"<td>{precio}</td>";
                tablaHtml += "<td>";
                tablaHtml += $"<button type='button' class='btn btn-danger btn-sm mr-2' data-toggle='modal' data-target='#EliminarModal' onclick='MostrarFormularioEliminar({id}, \"{nombre}\", \"{descripcion}\", \"{precio}\")'>Borrar</button>";

                tablaHtml += $"<button type='button' class='btn btn-info btn-sm' onclick='MostrarFormularioActualizar({id}, \"{nombre}\", \"{descripcion}\", {precio})' data-toggle='modal' data-target='#actualizarModal'>Actualizar</button>";
                tablaHtml += "</td>";
                tablaHtml += "</tr>";

            }

            return tablaHtml;
        }

        public void GuardarAlimento(object sender, EventArgs args)
        {
            string nombre = txtNombre.Text;
            string descripcion = txtDescripcion.Text;
            float precio = float.Parse(txtPrecio.Text);

            conexion.Insertar_Alimento(nombre, descripcion, precio);



            txtNombre.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            txtPrecio.Text = string.Empty;
        }

        protected void ActualizarAlimento(object sender, EventArgs e)
        {
            int id = int.Parse(txtIdActualizar.Text);
            string nombre = txtNombreActualizar.Text;
            string descripcion = txtDescripcionActualizar.Text;
            float precio = float.Parse(txtPrecioActualizar.Text);

            conexion.Actualizar_Alimento(id, nombre, descripcion, precio);

        }


        protected void BorrarAlimento(object sender, EventArgs e)
        {
            // Obtener el ID del alimento ingresado
            int idAlimento = int.Parse(lblIdEliminar.Text);

            // eliminar el alimento con el ID especificado
            conexion.Eliminar_Alimento(idAlimento);


        }
    }
}
