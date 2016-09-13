<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
<style type="text/css">
.iframecity {
	position: absolute;
	top: 100px;
	left: 100px
}

.iframeindustry {
	position: absolute;
	top: 100px;
	left: 800px
}

.iframefunnal {
	position: absolute;
	top: 600px;
	left: 100px
}
.iframetrend {
	position: absolute;
	top: 1100px;
	left: 100px
}
.div1 {
	position: absolute;
	top: 1470px;
	left: 100px;
	width: 50%;
	border: 10px solid #ccc
}
.iframeerror {
	position: absolute;
	top: 2020px;
	left: 100px
}
</style>
</head>
<body>
	<h1>Welcome to erp website!</h1>

	<!-- 	          <a href="trend.jsp">trend</a>
          <a href="funnal.jsp">funnal</a>
          <a href="industry.jsp">industry</a> -->
	<!--            <a href=credential.jsp>credential</a><hr /> 
            <a href=credentialNo.jsp>credentialNo</a><hr />  -->
	<!--           <a href="citytest.jsp">citytest</a><hr /> -->
<!-- 	  <a href="wordcloud.jsp">wordcloud</a>
	   <a href="credentialError.jsp">credentialError</a> -->
	<!--         <a href="time.jsp">time</a>
        <a href="active.jsp">active</a> -->

	<iframe class="iframecity" src="erpcity.jsp" width="53%" height="450"
		scrolling="no" frameborder="0"></iframe>

	<iframe class="iframeindustry" src="industry.jsp" width="50%"
		height="450" scrolling="no" frameborder="0"></iframe>

	<iframe class="iframefunnal" src="funnal.jsp" width="50%" height="450"
		scrolling="no" frameborder="0"></iframe>

	<iframe class="iframetrend" src="trend.jsp" width="62%" height="320"
		scrolling="no" frameborder="0"></iframe>
	<div  class="div1">
	<iframe  src="credential.jsp" width="48%"
		height="450" scrolling="no" frameborder="0"></iframe>

	<iframe  src="credentialNo.jsp" width="48%"
		height="450" scrolling="no" frameborder="0"></iframe>
	</div>
	
	<iframe class="iframeerror" src="credentialError.jsp" width="80%"
	height="500" scrolling="no" frameborder="0"></iframe>

</body>
</html>