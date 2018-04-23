<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeFile="client.aspx.cs" Inherits="client" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Client Coursework Website </title>
</head>
<body>
<style>
    table {
    margin-bottom:10px;
    text-align: center;
    font-size:16px;
    }
    th{
    background-color:#1D2731;
    color: white;
    height:50px;
    }
    tr:hover{
    background-color:#D9B310; 
    padding: 10px;
    }
    td {
    padding-top:10px;
    padding-bottom:10px;
    border-top: 1px dotted;
    }
    h1 {
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-style:oblique;
    color:ivory;
    }
    footer {
    font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
    font-size: 18px;
    font-weight: bold;
    padding: 20px;
    color:ivory;
    }
    body {
    background-color:#0B3C5D;
    }
</style>    
    <h1> Welcome to the Client website!</h1>

    <form id="form1" runat="server">
        <asp:scriptmanager runat="server"></asp:scriptmanager>
    <div>
         <ajaxToolkit:TabContainer ID="TC" runat="server" ActiveTabIndex="0" EnableTheming="True">

        <ajaxToolkit:TabPanel runat="server" HeaderText="View All" ID="All" Width="1000px" ScrollBars="Vertical">
            <ContentTemplate>
                <h2> Here you can view all the CDs in our collection. </h2> <br />
                <table style="margin: auto;">
                <asp:Repeater ID="DatabaseFields" runat="server">
                    <HeaderTemplate>
                        <tr>
                            <th>Album Title</th>
                            <th>Artist</th>
                            <th>Track Count</th>
                            <th>Record Label</th>
                            <th>Release Date</th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="CDLabel" runat="server" width="500px" Text='<%# Eval("AlbumName") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="ArtistLabel" width="300px" runat="server" Text='<%# Eval("Artist") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="TrackLabel" runat="server" width="150px" Text='<%# Eval("TrackCount") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="RLLabel" runat="server" width="350px" Text='<%# Eval("RecordLabel") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="DateLabel" runat="server" width="150px" Text='<%# Eval("ReleaseDate").ToString().Substring(0,11) %>'></asp:Label>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                </table>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>


        <ajaxToolkit:TabPanel runat="server" HeaderText="Search Collection" ID="Search" Width="1000px" Height="650px">
            <ContentTemplate>
                <h2> Alternatively, you can search for a specific CD. </h2>
                <br /> 
                <asp:Label ID="CDLabel" runat="server" Text="Album Name: "></asp:Label><asp:TextBox ID="CD" runat="server"></asp:TextBox>
                <asp:Button ID="SearchParam" runat="server" Text="Search >" OnClick="LoadView" /> <br /> <br /> <br />

                <asp:GridView ID="QueryGV" runat="server" BackColor="White" BorderColor="#CCCCCC" HorizontalAlign="Center" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="1000px">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="White" ForeColor="Black"></PagerStyle>

                    <RowStyle HorizontalAlign="Center" ></RowStyle>

                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
                </asp:GridView>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

    </ajaxToolkit:TabContainer>
  </div>
        <br />
        <footer> <%: DateTime.Now.Year %> - Created by B00261936 </footer>
    </form>
</body>
</html>
