<%--sql语句 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:query dataSource="${hadoopDB}" var="credentialPassRet">
select nopass,count(*) as cnt
from TB_ERP_CREDENTIAL 
where status = '审核通过'  and nopass <> '0' 
group by nopass
</sql:query>