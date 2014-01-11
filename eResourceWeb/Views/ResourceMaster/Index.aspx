<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<eResourceWeb.Models.ResourceMaster>>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Index</title>

    <link href="<%= ResolveUrl ("~/Content/site.css") %>" rel="stylesheet" type="text/css" />      
    <script src="<%= ResolveUrl ("~/Scripts/jquery-1.8.2.min.js") %>"></script>
    <script src="<%= ResolveUrl ("~/Scripts/jquery-ui-1.8.24.min.js") %>" type="text/javascript"></script>

    <link href="<%= ResolveUrl ("~/Scripts/DataTables-1.9.4/media/css/jquery.dataTables_themeroller.css") %>" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%= ResolveUrl ("~/Scripts/DataTables-1.9.4/media/js/jquery.dataTables.min.js") %>"></script>

</head>
<body>
    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>


    <table class="display" id="ResourceTable" style="width:40%" >
        <thead>
            <tr>
            <th>
                <%: Html.DisplayNameFor(model => model.ResourceName) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.Email) %>
            </th>
                </tr>
        </thead>
    <tbody>
    <% foreach (var item in Model) { %>
        <tr>
           <td>
               <%: Html.ActionLink(item.ResourceName, "Details", new { id=item.ResourceId }) %>
            </td>
            <td>
                <%: item.Email %>
            </td>
        </tr>
    <% } %>
    </tbody>
    </table>



        <script>
            $(document).ready(function () {
                $('#ResourceTable').dataTable(
                    { "sPaginationType": "two_button" }
                    );
            });
    </script>
</body>
</html>
