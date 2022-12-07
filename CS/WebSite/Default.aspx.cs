using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page {
    protected void cpUpdateProducts_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (String.IsNullOrEmpty(e.Parameter))
            return;

        string[] selection = e.Parameter.Split('|');
        string filter = String.Empty;

        for (int i = 0; i < selection.Length; i++)
        {
            filter += String.Format(" OR ([CategoryID] = {0})", selection[i]);
        }

        dsProducts.SelectCommand = String.Format("SELECT [ProductID], [ProductName] FROM [Products] WHERE (False{0})", filter);
        cblProducts.DataBind();
    }
}
