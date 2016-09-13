<%--sql语句 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:query dataSource="${hadoopDB}" var="credentialErrorRet">
SELECT
	A.typename,
	round(A.cnt1/B.cnt2*100,2) as cnt
FROM
	(
		(
			SELECT
				typename,
				count(*) AS cnt1
			FROM
				TB_ERP_CREDENTIAL
			WHERE
				nopass <> 0
			GROUP BY
				typename
			ORDER BY
				typename
		) AS A
		INNER JOIN (
			SELECT
				typename,
				count(*) AS cnt2
			FROM
				TB_ERP_CREDENTIAL
			WHERE
				STATUS <> '未审核'
			GROUP BY
				typename
			ORDER BY
				typename
		) AS B ON A.typename = B.typename
	)
ORDER BY
	B.cnt2 DESC
LIMIT 20
</sql:query>