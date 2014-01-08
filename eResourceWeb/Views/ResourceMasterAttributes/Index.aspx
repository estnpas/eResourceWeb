<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<eResourceWeb.Models.ResourceMasterAttributesModel>>" %>

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
                <%: Html.DisplayNameFor(model => model.ResourceId) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.AttributeId) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.AttributeValueId) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.Last_Updated) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.Is_Deleted) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.ModifiedBy) %>
            </th>
            <th></th>
        </tr>
    
    <% foreach (var item in Model) { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.ResourceId) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.AttributeId) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.AttributeValueId) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Last_Updated) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Is_Deleted) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.ModifiedBy) %>
            </td>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.Id }) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.Id }) %> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.Id }) %>
            </td>
        </tr>
    <% } %>
    
    </table>
</body>
</html>
