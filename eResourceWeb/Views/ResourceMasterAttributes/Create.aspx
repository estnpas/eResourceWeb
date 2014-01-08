<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<eResourceWeb.Models.ResourceMasterAttributesModel>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Create</title>
</head>
<body>
    <% using (Html.BeginForm()) { %>
        <%: Html.AntiForgeryToken() %>
        <%: Html.ValidationSummary(true) %>
    
        <fieldset>
            <legend>ResourceMasterAttributesModel</legend>
    
            <div class="editor-label">
                <%: Html.LabelFor(model => model.ResourceId) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.ResourceId) %>
                <%: Html.ValidationMessageFor(model => model.ResourceId) %>
            </div>
    
            <div class="editor-label">
                <%: Html.LabelFor(model => model.AttributeId) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.AttributeId) %>
                <%: Html.ValidationMessageFor(model => model.AttributeId) %>
            </div>
    
            <div class="editor-label">
                <%: Html.LabelFor(model => model.AttributeValueId) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.AttributeValueId) %>
                <%: Html.ValidationMessageFor(model => model.AttributeValueId) %>
            </div>
    
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Last_Updated) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Last_Updated) %>
                <%: Html.ValidationMessageFor(model => model.Last_Updated) %>
            </div>
    
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Is_Deleted) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Is_Deleted) %>
                <%: Html.ValidationMessageFor(model => model.Is_Deleted) %>
            </div>
    
            <div class="editor-label">
                <%: Html.LabelFor(model => model.ModifiedBy) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.ModifiedBy) %>
                <%: Html.ValidationMessageFor(model => model.ModifiedBy) %>
            </div>
    
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>
    <% } %>
    
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
</body>
</html>
