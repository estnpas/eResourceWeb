<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<eResourceWeb.Models.ResourceMaster>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Details</title>

    <link href="<%= ResolveUrl ("~/Content/site.css") %>" rel="stylesheet" type="text/css" />      
    <script src="<%= ResolveUrl ("~/Scripts/jquery-1.8.2.min.js") %>"></script>
    <script src="<%= ResolveUrl ("~/Scripts/jquery-ui-1.8.24.min.js") %>" type="text/javascript"></script>

    <link href="<%= ResolveUrl ("~/Scripts/ludo-jquery-treetable-609b82a/stylesheets/screen.css") %>" rel="stylesheet" media="screen" />
    <link href="<%= ResolveUrl ("~/Scripts/ludo-jquery-treetable-609b82a/stylesheets/jquery.treetable.css") %>" rel="stylesheet" type="text/css" /> 
    <link href="<%= ResolveUrl ("~/Scripts/ludo-jquery-treetable-609b82a/stylesheets/jquery.treetable.theme.default.css") %>" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%= ResolveUrl ("~/Scripts/ludo-jquery-treetable-609b82a/javascripts/src/jquery.treetable.js") %>"></script>

    <!--<link href="<%= ResolveUrl ("~/Scripts/DataTables-1.9.4/media/css/jquery.dataTables_themeroller.css") %>" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%= ResolveUrl ("~/Scripts/DataTables-1.9.4/media/js/jquery.dataTables.min.js") %>"></script>-->
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
    <div>
        <table cellpadding="0" cellspacing="0" border="0" class="display" id="skillTable" width="30%" align="left">
            <thead>
                <tr>
                    <th>Skill-List</th>
                </tr>
            </thead>
            <tbody>
                <tr data-tt-id="1">
                    <td>Functional Skills</td>
                </tr>
                <% foreach (var skill in Model.skillsList.Where(x => x.SkillGroupName == "Functional Skills")) { %>
                    <tr data-tt-id="<%: skill.SkillGroupId %>-<%: skill.SkillId %>" data-tt-parent-id="<%: skill.SkillGroupId %>">
                    <!--<tr data-tt-id="1" class="odd gradeX">
                       <td class="center">
                           <%: skill.SkillGroupName %>
                        </td>-->
                        <td class="center">
                            <%: skill.SkillName %>
                        </td>
                    </tr>
                <% } %>
                <tr data-tt-id="2">
                    <td>Technical Skills</td>
                </tr>
                <% foreach (var skill in Model.skillsList.Where(x => x.SkillGroupName == "Technical Skills")) { %>
                    <tr data-tt-id="<%: skill.SkillGroupId %>-<%: skill.SkillId %>" data-tt-parent-id="<%: skill.SkillGroupId %>">
                        <td class="center">
                            <%: skill.SkillName %>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    
        <table>
            <tr>
                <td><%: Html.ActionLink("Edit", "Edit", new { id=Model.ResourceId }) %> |</td>
                <td><%: Html.ActionLink("Back to List", "Index") %></td>
            </tr>
        </table>
    

    <script>   
        $("#skillTable").treetable({
                        expandable: true
        });
        /*$(document).ready(function () {
            $("#skillTable").dataTable({
                "bJQueryUI": true
            });
        });*/
    </script>
</body>
</html>
