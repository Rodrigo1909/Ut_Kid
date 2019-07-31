<%@ Page Title="" Language="C#" MasterPageFile="~/NinoPrincipal.Master" AutoEventWireup="true" CodeBehind="PrincipalNino.aspx.cs" Inherits="Ut_Kid.Nino.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
     <section class="page-section portfolio" id="portfolio">
         <img class="masthead-avatar mb-5" <img src="../DisenoNino/img/portfolio/bicycle.png"  alt="">

             <h1 class="masthead-heading text-uppercase mb-0">Actividades </h1>
         </section>
    </div>
    <div>
       
    </div>
    <div>
    </div>
    <div>
    </div>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
        
         <div>
             
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
             <asp:Label ID="Label1" runat="server" ForeColor="#990000" Text="Saldo Actual"></asp:Label>
             <br />
             <asp:TextBox ID="txtSaldoActual" runat="server" ForeColor="#9999FF"></asp:TextBox>
             <br />
             <br />
             <asp:Label ID="Label2" runat="server" ForeColor="#990000" Text="Saldo Total"></asp:Label>
             <br />
             <asp:TextBox ID="txtTotal" runat="server" ForeColor="#9999FF"></asp:TextBox>
             <br />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         </div>
          
         
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <center>
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None" Width="431px">
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>
                 <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                 <asp:BoundField DataField="strNombre" HeaderText="strNombre" ReadOnly="True" SortExpression="strNombre" />
                 <asp:BoundField DataField="strApellidoP" HeaderText="strApellidoP" ReadOnly="True" SortExpression="strApellidoP" />
                 <asp:BoundField DataField="strApellidoM" HeaderText="strApellidoM" ReadOnly="True" SortExpression="strApellidoM" />
                 <asp:BoundField DataField="intEdad" HeaderText="intEdad" ReadOnly="True" SortExpression="intEdad" />
                 <asp:BoundField DataField="strSexo" HeaderText="strSexo" ReadOnly="True" SortExpression="strSexo" />
                 <asp:BoundField DataField="strAlergia" HeaderText="strAlergia" ReadOnly="True" SortExpression="strAlergia" />
                 <asp:BoundField DataField="TblModederoNino" HeaderText="Monedero" ReadOnly="True" SortExpression="TblModederoNino" />
             </Columns>
             <EditRowStyle BackColor="#999999" />
             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#E9E7E2" />
             <SortedAscendingHeaderStyle BackColor="#506C8C" />
             <SortedDescendingCellStyle BackColor="#FFFDF8" />
             <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

         </asp:GridView>
              </center>
         <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="Modelo.UtBaseDatoDataContext" EntityTypeName="" Select="new (id, strNombre, strApellidoP, strApellidoM, intEdad, strSexo, strAlergia, TblModederoNino)" TableName="TblNino">
         </asp:LinqDataSource>
          
    </div>
    <div>
       
    </div>
    <div>
    </div>
    <div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
