<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function cblCategories_SelectedIndexChanged(s, e) {
            var selected = s.GetSelectedValues();
            var callbackParameter = "";
            for (var i = 0; i < selected.length; i++) {
                if (i !== 0) {
                    callbackParameter += '|';
                }
                callbackParameter += selected[i];
            }
            callbackPanel.PerformCallback(callbackParameter);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    Categories
                </td>
                <td>
                    <dx:ASPxCheckBoxList ID="cblCategories" runat="server" ValueType="System.Int32" Width="100%"
                        DataSourceID="dsCategories" RepeatColumns="4" TextField="CategoryName" ValueField="CategoryID">
                        <clientsideevents selectedindexchanged="cblCategories_SelectedIndexChanged" />
                    </dx:ASPxCheckBoxList>
                    <asp:AccessDataSource ID="dsCategories" runat="server" DataFile="~/App_Data/nwind.mdb"
                        SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:AccessDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    Products
                </td>
                <td>
                    <dx:ASPxCallbackPanel ID="cpUpdateProducts" runat="server" Width="100%" ClientInstanceName="callbackPanel"
                        OnCallback="cpUpdateProducts_Callback">
                        <PanelCollection>
                            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxCheckBoxList ID="cblProducts" runat="server" DataSourceID="dsProducts" RepeatColumns="4"
                                    TextField="ProductName" ValueField="ProductID" ValueType="System.Int32" Width="100%">
                                </dx:ASPxCheckBoxList>
                                <asp:AccessDataSource ID="dsProducts" runat="server" DataFile="~/App_Data/nwind.mdb"
                                    SelectCommand="SELECT [ProductID], [ProductName] FROM [Products] WHERE (False)">
                                </asp:AccessDataSource>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxCallbackPanel>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
