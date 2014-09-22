<%--
  Created by IntelliJ IDEA.
  User: franklin
  Date: 9/18/14
  Time: 8:35 PM
  To change this template use File | Settings | File Templates.
--%>
<!-- Modal -->


<div class="modal fade hide" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Add transaction</h4>
            </div>

            <div class="modal-body">
                <form class="form-inline" role="form" action="add_transaction" method="post">

                    <label for="from" >from: </label><input id="from" name="from" type="text" class="form-control" placeholder="Send from" >
                    <label for="to" >to: </label><input id="to" name="to" type="text" class="form-control" placeholder="Send to">
                    <hr/>
                    <label for="dateTransfer" >Date: </label><input id="dateTransfer" name="dateTransfer" type="datetime-local" class="form-control" placeholder="Date">

                    <label for="pickType" >Type: </label>
                    <select class="form-control" name="pickType" id="pickType" style="height:40px">
                        <option>Credit</option>
                        <option>Debit</option>
                        <option>Deposit</option>
                        <option>Withdraw</option>
                        <option>transfer</option>
                        <option>Check</option>
                    </select>
                    <hr/>
                    <label for="amount">Amount" </label>
                    <input type="text" class="form-control" id="amount" name="amount" placeholder="Amount">
                    <hr/>
                    <label for="description" >Description: </label><textarea  name="description" style="width:400px;" class="form-control col" rows="2" id="description"></textarea>
                    <hr/>

                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Confirm</button>
                </form>
            </div>

        </div>
    </div>
</div>


<!--save submitted info to db-->
<%--<%--%>
    <%--String sqlAddMoney = "insert into transactions values(null,?,?,?,?,?,?,?)";--%>
    <%--PreparedStatement ps =DBM.getPreState(con,sqlAddMoney);--%>
    <%--try{--%>

        <%--ps.setString(1,request.getParameter("dateTransfer"));--%>
        <%--ps.setDouble(2,Double.parseDouble(request.getParameter("amount")));--%>
        <%--ps.setString(3,request.getParameter("from"));--%>
        <%--ps.setString(4,request.getParameter("to"));--%>
        <%--ps.setString(5,request.getParameter("description"));--%>
        <%--ps.setString(6,request.getParameter("pickType"));--%>
        <%--ps.setString(7,"P");--%>
        <%--ps.executeUpdate();--%>
    <%--}catch(Exception e){--%>
        <%--e.printStackTrace();--%>
    <%--}--%>

<%--%>--%>
