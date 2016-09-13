<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="hadoopDB" 
	driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://192.168.50.125/erp?useUnicode=true&characterEncoding=utf8"
    user="root"  
    password="root"/>