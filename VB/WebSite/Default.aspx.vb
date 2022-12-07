Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub cpUpdateProducts_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase)
		If String.IsNullOrEmpty(e.Parameter) Then
			Return
		End If

		Dim selection() As String = e.Parameter.Split("|"c)
		Dim filter As String = String.Empty

		For i As Integer = 0 To selection.Length - 1
			filter &= String.Format(" OR ([CategoryID] = {0})", selection(i))
		Next i

		dsProducts.SelectCommand = String.Format("SELECT [ProductID], [ProductName] FROM [Products] WHERE (False{0})", filter)
		cblProducts.DataBind()
	End Sub
End Class
