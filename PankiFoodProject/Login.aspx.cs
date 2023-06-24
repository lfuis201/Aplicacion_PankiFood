using System;
using System.Web;
using System.Web.UI;
namespace PankiFoodProject
{

    public partial class Login : System.Web.UI.Page
    {

        LoginServices.LoginServices login = new LoginServices.LoginServices();

        protected string ErrorMessage { get; set; }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string nombreUsuario = txtUsername.Text;
            string contraseña = txtPassword.Text;

            // Llamar al método web VerificarCredencialesWebService
            bool credencialesValidas = login.VerificarCredencialesWebService(nombreUsuario, contraseña);

            if (credencialesValidas)
            {
               
                // Inicio de sesión exitoso
                // Redirigir a la página crudventas.aspx
                string redirectUrl = $"Venta.aspx?username={HttpUtility.UrlEncode(nombreUsuario)}";
                Response.Redirect(redirectUrl);
            }
            else
            {
                // Las credenciales no son válidas
                // Mostrar un mensaje de error al usuario o realizar alguna acción adicional
                // Las credenciales no son válidas
                // Mostrar un mensaje de error al usuario
                ErrorMessage = "Credenciales inválidas";
            }
        }


    }
}
