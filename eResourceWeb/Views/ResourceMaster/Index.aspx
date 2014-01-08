<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<eResourceWeb.Models.ResourceMaster>>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Index</title>
</head>
<body>
    <p>
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
                <%: Html.DisplayFor(modelItem => item.ResourceName) %>
            </td>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.ResourceMasterId }) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.ResourceMasterId }) %> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.ResourceMasterId }) %>
            </td>
        </tr>
    <% } %>
    
    </table>
</body>
</html>
