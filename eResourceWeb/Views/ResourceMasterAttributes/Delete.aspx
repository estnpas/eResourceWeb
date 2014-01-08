<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<eResourceWeb.Models.ResourceMasterAttributesModel>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Delete</title>
</head>
<body>
    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>ResourceMasterAttributesModel</legend>
    
        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.ResourceId) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.ResourceId) %>
        </div>
    
        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.AttributeId) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.AttributeId) %>
        </div>
    
        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.AttributeValueId) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.AttributeValueId) %>
        </div>
    
        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Last_Updated) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Last_Updated) %>
        </div>
    
        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Is_Deleted) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Is_Deleted) %>
        </div>
    
        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.ModifiedBy) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.ModifiedBy) %>
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
