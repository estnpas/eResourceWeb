<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<eResourceWeb.Models.ResourceMaster>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Edit</title>
</head>
<body>
    <% using (Html.BeginForm()) { %>
        <%: Html.AntiForgeryToken() %>
        <%: Html.ValidationSummary(true) %>
    
        <fieldset>
            <legend>ResourceMaster</legend>
    
            <%: Html.HiddenFor(model => model.ResourceMasterId) %>
    
            <div class="editor-label">
                <%: Html.LabelFor(model => model.ResourceName) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.ResourceName) %>
                <%: Html.ValidationMessageFor(model => model.ResourceName) %>
            </div>
    
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>
    <% } %>
    
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
</body>
</html>
