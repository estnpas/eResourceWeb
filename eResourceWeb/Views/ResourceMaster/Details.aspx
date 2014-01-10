<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<eResourceWeb.Models.ResourceMaster>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Details</title>
</head>
<body>
    <style>
         .right {
          text-align: right;
          margin-right: 1em;
        }

        .left {
          text-align: left;
          margin-left: 1em;
        }
    </style>
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
    <div>
        <table style="width: 800px; table-layout: fixed;">
            <col width="300px"/>
            <col width="500px"/>
            <tr>
                <th>Group</th>
                <th>Skill</th>
            </tr>
            <% foreach (var skill in Model.skillsList) { %>
                <tr>
                   <td align="center">
                       <%: skill.SkillGroupName %>
                    </td>
                    <td align="center">
                        <%: skill.SkillName %>
                    </td>
                </tr>
            <% } %>
        </table>
        <%: Html.ActionLink("Edit", "Edit", new { id=Model.ResourceId }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
</body>
</html>
