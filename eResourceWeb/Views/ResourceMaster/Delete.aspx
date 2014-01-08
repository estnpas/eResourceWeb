<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<eResourceWeb.Models.ResourceMaster>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Delete</title>
</head>
<body>
    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>ResourceMaster</legend>
    
        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.ResourceName) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.ResourceName) %>
        </div>
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <%: Html.AntiForgeryToken() %>
        <p>
            <input type="submit" value="Delete" /> |
            <%: Html.ActionLink("Back to List", "Index") %>
        </p>
    <% } %>
    
</body>
</html>
