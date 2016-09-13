<%--sql语句 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:query dataSource="${hadoopDB}" var="wordRet">
select typename,count(*) as cnt
from TB_ERP_CREDENTIAL 
group by typename
order by cnt desc
limit 20
</sql:query>