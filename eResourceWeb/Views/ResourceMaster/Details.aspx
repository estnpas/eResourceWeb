<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<eResourceWeb.Models.ResourceMaster>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Details</title>

    <link href="<%= ResolveUrl ("~/Content/site.css") %>" rel="stylesheet" type="text/css" /> 
    <link href="<%= ResolveUrl ("~/Content/themes/smoothness/jquery-ui.css") %>" rel="stylesheet" type="text/css">    
    <script src="<%= ResolveUrl ("~/Scripts/jquery-1.8.2.min.js") %>"></script>
    <script src="<%= ResolveUrl ("~/Scripts/jquery-ui-1.8.24.min.js") %>" type="text/javascript"></script>

    <link href="<%= ResolveUrl ("~/Scripts/ludo-jquery-treetable-609b82a/stylesheets/screen.css") %>" rel="stylesheet" media="screen" />
    <link href="<%= ResolveUrl ("~/Scripts/ludo-jquery-treetable-609b82a/stylesheets/jquery.treetable.css") %>" rel="stylesheet" type="text/css" /> 
    <link href="<%= ResolveUrl ("~/Scripts/ludo-jquery-treetable-609b82a/stylesheets/jquery.treetable.theme.default.css") %>" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%= ResolveUrl ("~/Scripts/ludo-jquery-treetable-609b82a/javascripts/src/jquery.treetable.js") %>"></script>

    <script type="text/javascript">
    </script>
</head>
<body>
 

<div>
    <table>
        <tr>
            <td class="display-label">
                <%: Html.DisplayNameFor(model => model.ResourceName) %>
            </td> 
            <td class="display-field">
                 <%: Html.DisplayFor(model => model.ResourceName) %>      
            </td>
        </tr>
        <tr>
            <td class="display-label">
                <%: Html.DisplayNameFor(model => model.ManagerId) %>
            </td> 
            <td class="display-field">
                 <%: Html.DisplayFor(model => model.ManagerName) %>    
            </td>
        </tr>
    </table>
</div>
    <div>
        <table cellpadding="0" cellspacing="0" border="0" class="display" id="skillTable" align="left">
            <thead>
                <tr>
                    <th>Skill-List</th>
                </tr>
            </thead>
            <tbody>
                <col width="25px" />
                <col width="20px" />
                <tr data-tt-id="1">
                    <td>Functional Skills</td>
                    <td></td>
                </tr>
                <% foreach (var skill in Model.skillsList.Where(x => x.SkillGroupName == "Functional Skills")) { %>
                    <tr data-tt-id="<%: skill.SkillGroupId %>-<%: skill.SkillId %>" data-tt-parent-id="<%: skill.SkillGroupId %>">
                        <td class="center">
                            <%: skill.SkillName %>
                        </td>
                        <td>
                            <button id="button-<%: skill.SkillGroupId %>-<%: skill.SkillId %>" 
                                            onclick="location.href='<%: Url.Action("Unassign", "ResourceMaster", new {resourceId=Model.ResourceId,Id=skill.SkillId}) %>'">Unassign</button>
                        </td>
                    </tr>
                <% } %>
                <tr data-tt-id="2">
                    <td>Technical Skills</td>
                    <td></td>
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
    
    <script  language="javascript" type="text/javascript">   
        $("#skillTable").treetable({
                        expandable: true
        });
        $("#skillTable tbody").on("mousedown", "tr", function () {
            $(".selected").not(this).removeClass("selected");
            $(this).toggleClass("selected");
        });

        /*$("button").button({
            icons: {
                primary: "ui-icon-circle-close"
            },
            text: false
        }); */
    </script>
</body>
</html>
