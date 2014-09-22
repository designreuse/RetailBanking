<%--
  Created by IntelliJ IDEA.
  User: franklin
  Date: 9/18/14
  Time: 9:38 PM
  To change this template use File | Settings | File Templates.
--%>
<div class="row-fluid">
    <table class="table table-hover">
        <thead>
        <tr>
            <th class="span2">
                Date
            </th>
            <th class="span2">
                From
            </th>
            <th class="span2">
                to
            </th>
            <th class="span2">
                <span class="line"></span>Type
            </th>
            <th class="span2">
                <span class="line"></span>Amount
            </th>
            <th class="span2">
                <span class="line"></span>status
            </th>
            <th class="span2">
                <span class="line"></span>Description
            </th>
        </tr>
        </thead>
        <tbody>
        <!-- row -->


        <% try{
            String sql = "Select * From transactions";
            ResultSet rs = DBM.executeQuery(st,sql);
            while (rs.next()){

        %>
        <tr class="first" id="row<%=rs.getInt(1)%>">
            <td>
                <%=rs.getString(2)%>
            </td>
            <td>
                <%=rs.getString(4)%>
            </td>
            <td>
                <%=rs.getString(5)%>
            </td>
            <td>
                <%=rs.getString(7)%>
            </td>
            <td >
               <span>$ </span></span><%=rs.getDouble(3)%>
            </td>
            <td >
                <%=rs.getString(8)%>
            </td>
            <td class="hidden" id="transactionID">
                <%=rs.getInt(1)%>
            </td>
            <%--<% transactionID=rs.getInt(1);%>--%>
            <td>
                <ul class="actions">
                    <li onclick="sendTransactionID(this.id);" id="<%=rs.getInt(1)%>">
                    <a  data-toggle="modal" data-target="#modalEdit">
                        <i class="table-edit" ></i>
                    </a>
                    </li>
                    <li class="last deleteTransaction" id="<%=rs.getInt(1)%>" ><i class="table-delete"></i></li>
                </ul>
            </td>
        </tr>

        <%
                }

            }catch(Exception e){
                e.printStackTrace();
            }%>



        </tbody>
    </table>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        $(".deleteTransaction").click(function(){
            var tansactionID = this.id;
            $.get("delete_transaction?transactionID="+tansactionID,function(data,status){
                $("#row"+tansactionID).remove();
            });
        });

    });

    function sendTransactionID(id){
        document.getElementById("setTransactionID").setAttribute("value",id);

    }






</script>
