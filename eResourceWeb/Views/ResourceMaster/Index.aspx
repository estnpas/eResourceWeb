<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<eResourceWeb.Models.ResourceMaster>>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Index</title>
</head>
<body>
<% using(Html.BeginForm()) %>
<% { %>
    <p>
        Find by name: <%: Html.TextBox("SearchString") %>
        <input type="submit" value="Search" /></p>


    <p>
<% } %>


        <%: Html.ActionLink("Create New", "Create") %>
    </p>
    <table>
        <tr>
            <th>
                <%: Html.DisplayNameFor(model => model.ResourceName) %>
            </th>
            <th></th>
        </tr>
    
    <% foreach (var item in Model) { %>
        <tr>
           <td>
               <%: Html.ActionLink(item.ResourceName, "Details", new { id=item.ResourceId }) %>
            </td>

             
        </tr>
    <% } %>
    
    </table>
</body>
</html>
