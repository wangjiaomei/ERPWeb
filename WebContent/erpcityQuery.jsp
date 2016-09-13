<%--sql语句 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:query dataSource="${hadoopDB}" var="cityRet">
	SELECT
		cityname,
		sum(cnt) AS ct
	FROM
		erp.erp_city
	WHERE
		type = 'a'
	GROUP BY
		cityname
	ORDER BY
		cityname DESC
</sql:query>