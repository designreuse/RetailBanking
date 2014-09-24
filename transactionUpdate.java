  String sqlSenderUpdate="update account set balance= balance-? where accountnumber = ?";
            String sqlReceiverUpdate="update account set balance= balance+? where accountnumber = ?";
            PreparedStatement send = DBM.getPreState(con,sqlSenderUpdate);
            send.setDouble(1,Double.parseDouble(request.getParameter("amount")));
            send.setInt(2,Integer.parseInt(request.getParameter("from")));
            send.executeUpdate();
            PreparedStatement receive = DBM.getPreState(con,sqlReceiverUpdate);
            receive.setDouble(1,Double.parseDouble(request.getParameter("amount")));
            receive.setInt(2,Integer.parseInt(request.getParameter("to")));
            receive.executeUpdate();



 <button id="submit" class="btn-glow inverse pull-right">Submit</button>

        $(function(){
            $("#submit").click(function(){
                $.post("transfer",{
                   from:$("input[name=from]").val(),
                   to:$("input[name=to]").val(),
                    amount:$("input[name=amount]").val(),
                    description:$("input[name=description]").val()
                },
                function(data){
                    $.html(data);

                }
                );
            });
        });
        
         response.getWriter().println("<script type='application/javascript'>alert(\"not enough balance, please make sure it's more than 0!\");location.href='transfer.jsp';</script>");
            
