<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ABMAlumno.aspx.cs" Inherits="Parcial.ABMAlumno" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />
        <asp:Panel ID="PanelExistente" Visible="false" runat="server">
        <div class="alert alert-success">
            <p>Ya existe el Alumno</p>
        </div>
        </asp:Panel>
    <asp:PlaceHolder ID="dt" Visible="true" runat="server">
        <hr />

        <asp:HiddenField Value="0" ID="iptCodigo" runat="server" />
        <div class="container-flParciald form" style="background: #f8f9fa;">
            <br />
            <div class='form-group clearfix'>
                <div class='row'>
                    <div class='col-md-1'>
                        <label>
                            <asp:Label ID="Label1" runat="server"  Text="Nombre y Apellido"></asp:Label></label>
                    </div>
                    <div class='col-md-5'>
                        <asp:TextBox ID="txtNombre" runat="server" ClientIDMode="Static" reqParcialred="reqParcialred" MaxLength="50" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="red" ID="ReqParcialredFieldValidator_txtNombre" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
                    </div>
                    <div class='col-md-1'>
                        <label>
                            <asp:Label ID="lbLegajo" runat="server"  Text="Legajo"></asp:Label></label>
                    </div>
                    <div class='col-md-5'>
                        <asp:TextBox ID="txtLegajo" runat="server" ClientIDMode="Static" reqParcialred="reqParcialred" MaxLength="50" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="red" ID="ReqParcialredFieldValidator_txtLegajo" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtLegajo"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ErrorMessage="Ingrese un Legajo válido con numeros" ID="RegularExpressionValidator1" ForeColor="red"
                                ControlToValidate="txtLegajo"              
                                ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                        
                        </div>
                       
                        </div>
                </div>
                <!-- /row -->
            </div>
    </asp:PlaceHolder>
            
        


         <a href="~/ABMAlumno.aspx" runat="Server" class="btn btn-danger pull-right">
            Volver</a>
        <asp:Button ID="btnGuardar" runat="server" Style="margin-right: 10px;" CssClass="btn btn-success  pull-right" Text="Guardar" OnClick="btnGuardar_Click" />
  
    <br />
    <br />
    <br />
</asp:Content>
