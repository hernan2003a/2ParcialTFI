<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ABMCurso.aspx.cs" Inherits="Parcial.ABMCurso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <br />
        <h2><i class="fa fa-chevron-circle-right"></i>&nbsp;<asp:Label ID="lb_intro" runat="server" style="Font-Bold;" Text="ABM DE CURSOS"></asp:Label></h2>
    <hr />

     <div class="block full">

<h3><i class="fa fa-chevron-circle-right"></i>&nbsp;
        <asp:Label ID="lb_AltaCurso" runat="server"  Text="Alta De Curso"></asp:Label>
        <asp:Label ID="lb_ModificarCurso" runat="server"  Text="Modificar Curso"></asp:Label>
</h3>





<form>
              <div class='form-group '>
                       <asp:PlaceHolder ID="dt" Visible="true" runat="server">
                                <hr />
                                <div class="container-fluid form" style="background: #f8f9fa;">
                                    <br />
                                           <div class='col-md-1'>
                                                <label><asp:Label ID="Label3" runat="server"  Text="Nombre"></asp:Label></label>
                                           </div>
                                           <div class='col-md-5'>
                                                <asp:TextBox ID="txtNombre" runat="server" ClientIDMode="Static" MaxLength="50" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ForeColor="red" ID="RequiredFieldValidator_txtNombre" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
                                           </div>
                                           <div class='col-md-1'>
                                                <label><asp:Label ID="lbCosto" runat="server"  Text="Costo"></asp:Label></label>
                                           </div>
                                           <div class='col-md-5'>
                                                <asp:TextBox ID="txtCosto" runat="server" ClientIDMode="Static" MaxLength="50" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ForeColor="red" ID="RequiredFieldValidator_txtCosto" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtCosto"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator runat="server" ErrorMessage="Ingrese un Costo válido con numeros sin decimales" ID="RegularExpressionValidator1" ForeColor="red"
                                                        ControlToValidate="txtCosto"              
                                                        ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                           </div>
                                           <div class='col-md-1'>
                                                <label><asp:Label ID="Label1" runat="server"  Text="Cupo"></asp:Label></label>
                                           </div>
                                           <div class='col-md-5'>
                                                <asp:TextBox ID="txtCupo" runat="server" ClientIDMode="Static" MaxLength="50" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ForeColor="red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtCupo"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator runat="server" ErrorMessage="Ingrese un Costo válido con numeros sin decimales" ID="RegularExpressionValidator2" ForeColor="red"
                                                        ControlToValidate="txtCupo"              
                                                        ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                           </div>
                                           <div class="col-md-1">
                                                <label><asp:Label ID="lblfecha" runat="server" Font-Bold="true" Text="Fecha Inicio:"></asp:Label></label>
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
                        </asp:PlaceHolder>
                        <div style="text-align: left" class="col-md-3">
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnNuevo_Click" />
                        </div>
                </div>
       <br />
        <br />
        <br />
        <br />

</form>

<form>
  <div class="form-group">
    <label><asp:Label ID="Label4" runat="server"  Text="Nombre Curso"></asp:Label></label>
    <asp:TextBox ID="txtBuscarCurso" runat="server" MaxLength="20" CssClass="form-control input-sm" ></asp:TextBox>
  </div>
  <div class="form-group">
    <asp:Button ID="Button1" runat="server" Text="Buscar"  CausesValidation="False"  CssClass="btn btn-success" OnClick="btnBuscar_Click" />
    <a href="~/ABMCurso.aspx" runat="server" class="btn btn-danger"><asp:Label ID="Label5" runat="server"  CausesValidation="False"  Text="Limpiar Filtro"></asp:Label> </a>
  </div>
</form>

    <br />
    <div class="block full col-md-12">
        <div class="table-responsive">
            <span class="lead"><asp:Label ID="txt" runat="server" Text="SE HAN ENCONTRADO"></asp:Label><strong class="text-danger">
                <asp:Literal ID="txtCantRegistros" runat="server"></asp:Literal></strong> REGISTROS
            </span>
            <span class="help-block pull-right"><asp:Label ID="lb_mostrando" runat="server" Text="MOSTRANDO 10 REGISTROS"></asp:Label> </span>
            <div style="border-top: 1px solid black;"></div>
            <asp:GridView ID="DgvCurso" runat="server" AllowSorting="True"
                AutoGenerateColumns="False" BorderStyle="None"
                CssClass="table table-striped table-hover" AllowPaging="True"
                GridLines="None" PagerStyle-CssClass="pagination-dgv"
                PagerStyle-HorizontalAlign="Right"
                OnPageIndexChanging="DgvCurso_PageIndexChanging"
                      OnRowEditing="DgvCurso_RowEditing" 
                 PageSize="10" OnSelectedIndexChanged="DgvCurso_SelectedIndexChanged" OnRowCommand="DgvCurso_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" Visible="false" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre Curso" />
                    <asp:BoundField DataField="Costo" HeaderText="Precio"  />
                    <asp:BoundField DataField="Cupo" HeaderText="Cupo"  />

                    <%--<asp:CommandField ShowEditButton="True" EditText="EDITAR" ControlStyle-CssClass="btn btn-xs btn-success" HeaderText="Editar" />--%>
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" CommandArgument='<%# Eval("Id") %>' runat="server" Text="Editar"  CssClass="btn btn-xs btn-success"  CausesValidation="False"  CommandName="EditedRow" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                       <div class="modal" id="myModal<%#Eval("Id").ToString()%>">
                            <div class="modal-dialog" >
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> AVISO</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                     <div class="modal-body text-center">
                                         <p>
                                                <asp:Label ID="Label2"  runat="server" Text="¿Confirma Eliminar el Registro?"></asp:Label>
                                         </p>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:LinkButton ID="btnDelete" CommandArgument='<%# Eval("Id") %>' runat="server" Text="Si"  CssClass="btn btn-success"  CausesValidation="False"  CommandName="DeletedRow" />

                                       <%--<asp:Button   runat="server" ID="btnDelete" CssClass="btn btn-success"  OnClick="btnEliminarClick" CausesValidation="False" Text="SI"/>
                                       --%> <button type="button" class="btn btn-danger cancel"  data-dismiss="modal">NO</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="btn btn-xs btn-danger" data-toggle="modal" data-target="#myModal<%#Eval("Id").ToString()%>">
                                    ELIMINAR
                            </button>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
            </asp:GridView>
        </div>
        
         
 
    <br />
    </div>
</div>
</asp:Content>
