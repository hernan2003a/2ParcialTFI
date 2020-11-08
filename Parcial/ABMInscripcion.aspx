<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ABMInscripcion.aspx.cs" Inherits="Parcial.ABMInscripcion" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 
     <asp:Panel ID="PanelCursoCompleto" Visible="false" runat="server">
        <div class="alert alert-danger">
            <p>Se quiera inscribir un alumno a un curso completo</p>
        </div>
    </asp:Panel>

    <asp:Panel ID="PanelFueraFecha" Visible="false" runat="server">
        <div class="alert alert-danger">
            <p>Se quiere inscribir un alumno fuera de fecha</p>
        </div>
    </asp:Panel>
    
    <asp:Panel ID="PanelExistente" Visible="false" runat="server">
        <div class="alert alert-success">
            <p>Ya esta Inscripto</p>
        </div>
    </asp:Panel>
    <br />
    <asp:PlaceHolder ID="dt" Visible="true" runat="server">
        <hr />

        <asp:HiddenField Value="0" ID="iptCodigo" runat="server" />
        <div class="container-flParciald form" style="background: #f8f9fa;">
            <br />
            <div class='form-group clearfix'>
                <div class='row'>
                    <div class='col-md-1'>
                        <label><asp:Label ID="Label1" runat="server"  Font-Bold="true" Text="Alumno"></asp:Label></label>
                    </div>
                    <div class='col-md-5'>
                        <asp:DropDownList ID="ddlAlumno" runat="server" > </asp:DropDownList>
                        <asp:RequiredFieldValidator ForeColor="red" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Campo requerido" ControlToValidate="ddlAlumno"></asp:RequiredFieldValidator>
                    </div>
                </div>
              
                <div class='row'>
                    <div class='col-md-1'>
                        <label><asp:Label ID="Label4" runat="server"  Font-Bold="true" Text="Curso"></asp:Label></label>
                    </div>
                    <div class='col-md-5'>
                      <asp:DropDownList ID="ddlCurso" runat="server"> </asp:DropDownList> 
                      <asp:RequiredFieldValidator ForeColor="red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo requerido" ControlToValidate="ddlCurso"></asp:RequiredFieldValidator>
                    </div>
                </div>
              
                <div class='row'>
                    <div class='col-md-1'>
                        <label><asp:Label ID="Label2" runat="server"  Font-Bold="true" Text="Beca"></asp:Label></label>
                    </div>
                    <div class='col-md-5'>
                    <asp:DropDownList ID="ddlBeca" runat="server">  </asp:DropDownList>
                        <asp:RequiredFieldValidator ForeColor="red" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo requerido" ControlToValidate="ddlBeca"></asp:RequiredFieldValidator>
                    </div>
                </div>
              
                <div class='row'>
                    <div class="col-md-1">
                        <label><asp:Label ID="lblfecha" runat="server" Font-Bold="true" Text="Fecha Tope:"></asp:Label></label>
                    </div>
                    <div class='col-md-5'>
<script type="text/javascript">
    function CheckDate(sender, args) {
        if ('<%= Calendario.SelectedDate == DateTime.MinValue %>' == "True") {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }
</script>


<asp:Calendar ID="Calendario" runat="server" />
<asp:CustomValidator ID="CV1" runat="server" ErrorMessage="Debe Seleccionar una Fecha" ClientValidationFunction="CheckDate" />

                     
                    </div>
                </div>
            </div>
        </div>
    </asp:PlaceHolder>








         <a href="~/AdminEmpleado.aspx" runat="Server" Height="26px" Width="68px" class="btn btn-danger pull-right">Volver</a>
        <asp:Button ID="btnGuardar" runat="server" Style="margin-right: 10px;" CssClass="btn btn-success  pull-right" Text="Guardar" OnClick="btnGuardar_Click" Height="35px" Width="85px" />
     <br />

    <br />
    <br />
</asp:Content>
