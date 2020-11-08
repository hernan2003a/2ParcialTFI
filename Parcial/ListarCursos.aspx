<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarCursos.aspx.cs" Inherits="Parcial.ListarCursos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <center>
        <h5><i class="fa fa-chevron-circle-right"></i>&nbsp;<asp:Label ID="lb_intro" runat="server"  Text="Listado de Cursos"></asp:Label></h5>
    </center>    
    <hr />


    <br />
    <div class="block full">
        <div class="table-responsive">


            <div style="border-top: 1px solid black;"></div>
            <asp:GridView ID="dgvCursos" runat="server" AllowSorting="True"
                AutoGenerateColumns="False" BorderStyle="None"
                CssClass="table table-striped table-hover" AllowPaging="True"
                GridLines="None" PagerStyle-CssClass="pagination-dgv"
                PagerStyle-HorizontalAlign="Right"
                PageSize="100">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Costo" HeaderText="Precio"  />
                    <asp:BoundField DataField="Cupo" HeaderText="Cupo"  />
                    <asp:BoundField DataField="Recaudacion" HeaderText="Recaudaci&oacute;n" />
                </Columns>
             </asp:GridView>

             <span class="lead"><asp:Label ID="txt" runat="server" Text="Recaudaci&oacute;n total:"></asp:Label><strong class="text-danger">
                <asp:Literal ID="txtRecaudacionTotal" runat="server"></asp:Literal></strong> Pesos
            </span>
        </div>
        
         
 
    <br />
    </div>

</asp:Content>
