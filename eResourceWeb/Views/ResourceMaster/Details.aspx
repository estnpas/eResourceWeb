<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<eResourceWeb.Models.ResourceMaster>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Details</title>
</head>
<body>
    <fieldset>
        <legend>Resource</legend>
    
        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.ResourceName) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.ResourceName) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.ManagerId) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.ManagerName) %>
        </div>
    </fieldset>
    <p>
    
        <%: Html.ActionLink("Edit", "Edit", new { id=Model.ResourceId }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
</body>
</html>
