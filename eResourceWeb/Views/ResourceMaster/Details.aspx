<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<eResourceWeb.Models.ResourceMaster>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Details</title>

    <link href="<%= ResolveUrl ("~/Content/site.css") %>" rel="stylesheet" type="text/css" />      
    <script src="<%= ResolveUrl ("~/Scripts/jquery-1.8.2.min.js") %>"></script>
    <script src="<%= ResolveUrl ("~/Scripts/jquery-ui-1.8.24.min.js") %>" type="text/javascript"></script>

    <script type="text/javascript" src="<%= ResolveUrl ("~/Scripts/DataTables-1.9.4/media/js/jquery.dataTables.min.js") %>"></script>
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
        <table id="skillTable">
            <thead>
                <tr>
                    <th>Skill-Group</th>
                    <th>Skill</th>
                </tr>
            </thead>
            <tbody>
                <% foreach (var skill in Model.skillsList) { %>
                    <tr data-tt-id="1" class="odd gradeX">
                       <td class="center">
                           <%: skill.SkillGroupName %>
                        </td>
                        <td class="center">
                            <%: skill.SkillName %>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <%: Html.ActionLink("Edit", "Edit", new { id=Model.ResourceId }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

    <script>
        $(document).ready(function () {
            $("#skillTable").dataTable();
        });
    </script>
</body>
</html>
