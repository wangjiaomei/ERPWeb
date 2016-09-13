<%--sql语句 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:query dataSource="${hadoopDB}" var="funnalRet">
	select ct*100/(select count(1) as ct from erp.erp_funnal) as ct  from 
	(
		select count(1) as ct from erp.erp_funnal
		union all
		select count(1) from erp.erp_funnal where status_a not in ('20001','20008')
		union all
		select count(1) from erp.erp_funnal where status_b <> 'NULL'
		UNION all
		select count(1) from erp.erp_funnal where status_b <> 'NULL' and status_b not in ('30001','30008')
		UNION all
		select count(1) from erp.erp_funnal where status_c <> 'NULL' 
	) t1
</sql:query>