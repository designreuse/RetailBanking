<%--
  Created by IntelliJ IDEA.
  User: franklin
  Date: 9/18/14
  Time: 9:55 PM
  To change this template use File | Settings | File Templates.
--%>
<div class="modal fade hide" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Edit transaction</h4>
            </div>

            <div class="modal-body">
                <form class="form-inline" role="form" action="edit_transaction" method="post">

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
                    <input type="text"  id="setTransactionID" name="getTransactionID">

                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Confirm</button>
                </form>
            </div>

        </div>
    </div>
</div>
