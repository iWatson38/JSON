<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%!
	class Record {
		Date data;
		String message;
		Record(Date data, String message){
			this.data = data;
			this.message = message;
		}				
	};
	ArrayList<Record> records = new ArrayList<Record>();
%>
		
<%
	if(records.size() == 0) {
		records.add(new Record(new Date(2020 - 1901, 06, 21, 10, 00), "Проснулся!"));
		records.add(new Record(new Date(2020 - 1901, 06, 21, 10, 10), "Умылся."));
		records.add(new Record(new Date(2020 - 1901, 06, 21, 10, 20), "Варю кофе ..."));
	}
	String message = request.getParameter("message");
	if (message != null && message.trim().length()!=0) {
		records.add(new Record(new Date(), message));
	}
			
%>

<%
	out.println("[");
	for (Record r : records) {
		out.println("{data: \"" + r.data + "\", message: \"" + r.message + "\"},");
	}
	out.println("]");			
%>