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

    <link href="<%= ResolveUrl ("~/Scripts/select2-3.4.5/select2.css") %>" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%= ResolveUrl ("~/Scripts/select2-3.4.5/select2.js") %>"></script>

    <script type="text/javascript">

        $(function () {

            //  Create the dialog to enter the skill
            $("#addskill-dialog-form").dialog({
                autoOpen: false,
                height: 300,
                width: 350,
                modal: true,
                buttons: {
                    "Assign": function () {
                        var bValid = true;

                        //  Add in some cool validation

                        //  If valid, post....
                        if (bValid) {
                            alert("Post the form....");

                            var assignResourceSkill = {
                                ResourceId: <%: Model.ResourceId %>,
                                SkillName: document.getElementById("skillName").value
                            };

                            //  Post me baby
                            $.ajax({url: '<%: Url.Action(
                                                            "Assign",
                                                            "ResourceMaster")%>',
                                    type: "POST",
                                    contentType: "application/json;charset=utf-8",
                                    data: JSON.stringify(assignResourceSkill)
                            });

                            $(this).dialog("close");
                        }
                    },
                    Cancel: function () {
                        $(this).dialog("close");
                    }
                },
                close: function () {
                    
                }
            });

            //  Open the dialog box when clicked
            $("#add-skill")
                    .button()
                        .click(function () {
                            $("#addskill-dialog-form").dialog("open");
                        });

            //  Establish the drop-down list of the available skills
            var skillList = [
                      "ActionScript",
                      "AppleScript",
                      "Asp",
                      "BASIC",
                      "C",
                      "C++",
                      "Clojure",
                      "COBOL",
                      "ColdFusion",
                      "Erlang",
                      "Fortran",
                      "Groovy",
                      "Haskell",
                      "Java",
                      "JavaScript",
                      "Lisp",
                      "Perl",
                      "PHP",
                      "Python",
                      "Ruby",
                      "Scala",
                      "Scheme"
            ];
            $("#skillName").select2(); 
        });
    </script>
</head>
<body>
 
    <!--  Dialog box for attaching a Skill to a Resource -->
    <div id="addskill-dialog-form" title="Assign a Skill">
          <form id="assignskill-form" >
              <fieldset>
                <label for="skillName">Skill</label>
                <select id="skillName" data-placeholder="Choose a Skill...." class="chosen-select" style="width:350px;" tabindex="1">
                    <option>.net</option>
                    <option>java</option>
                </select>
              </fieldset>
          </form>
    </div>
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
                        <td>
                            <button id="button-<%: skill.SkillGroupId %>-<%: skill.SkillId %>" 
                                            onclick="location.href='<%: Url.Action("Unassign", "ResourceMaster", new {resourceId=Model.ResourceId,Id=skill.SkillId}) %>'">Unassign</button>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <table>
        <tr>
            <td><button id="add-skill">Assign Skill</button></td>
            <td><%: Html.ActionLink("Back to List", "Index") %></td>
        </tr>
    </table>
    
    <script language="javascript" type="text/javascript">   
        $("#skillTable").treetable({
                        expandable: true
        });
        $("#skillTable tbody").on("mousedown", "tr", function () {
            $(".selected").not(this).removeClass("selected");
            $(this).toggleClass("selected");
        });
    </script>
</body>
</html>
