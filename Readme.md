# How to bind ASPxCheckBoxList to the data selected in another ASPxCheckBoxList


<p>This example demonstrates how you can bind <a href="http://documentation.devexpress.com/#AspNet/CustomDocument11669"><u>ASPxCheckBoxList</u></a> to the "Products" whose "Categories" are selected in other ASPxCheckBoxLists.</p><p>To update the "Products" ASPxCheckBoxList, put it and its DataSource control into <a href="http://documentation.devexpress.com/#AspNet/CustomDocument8277"><u>ASPxCallbackPanel</u></a>.</p><p>When the "Categories" ASPxCheckBoxList selection is changed, send a callback to ASPxCallbackPanel to update the "Products" ASPxCheckBoxList data. Use a callback parameter to pass the currently selected categories to the server.</p>

<br/>


