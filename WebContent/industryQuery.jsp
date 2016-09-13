<%--sql语句 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:query dataSource="${hadoopDB}" var="industryRet">
	SELECT
	industryname,
		sum(cnt) AS ct
	FROM
		erp.erp_industry
	WHERE
		type = 'a' 
	GROUP BY
		industryname
	ORDER BY
		industryname
</sql:query>