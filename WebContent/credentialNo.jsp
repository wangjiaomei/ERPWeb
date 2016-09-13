<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>credentialNo</title>

</head>
<body>
	<script src="js/build/dist/echarts.js" type="text/javascript"></script>
	<%@ include file="inc_conn.jsp"%>
	<%@ include file="credentialNoQuery.jsp"%>

	<div id="credentialNo"
		style="height: 400px; width: 85%; border: 0px solid #ccc; padding: 10px;"></div>
	<script type="text/javascript">
	/* 重申后审核未通过 */
	var passNoArr = new Array();
	var passNoCnt = new Array();
	<c:forEach var="ert" items="${credentialNoPassRet.rows}" varStatus="idx">
		passNoArr[${idx.index }] = ${ert.nopass};
		passNoCnt[${idx.index }] = ${ert.cnt};		 
	</c:forEach>
		// Step:3 conifg ECharts's path, link to echarts.js from current page.
		// Step:3 为模块加载器配置echarts的路径，从当前页面链接到echarts.js，定义所需图表路径
		require.config({
			paths : {
				//echarts.js所在的路径
				echarts : 'js/build/dist'
			}
		});
		// Step:4 require echarts and use it in the callback.
		// Step:4 动态加载echarts然后在回调函数中开始使用，注意保持按需加载结构定义图表路径
		require([ 'echarts', 'echarts/chart/pie' ], function(ec) {
			//渲染ECharts图表  ，可单独写出来作为回调函数
			var myChart1 = ec.init(document.getElementById('credentialNo'));
			//加载图表
			option = {
				title : {
					text : '客户资质重申后仍未通过',
					subtext : 'ERP',
					x : 'left'
				},
				tooltip : {
					trigger : 'item',
					formatter : "{a} <br/>{b} : {c} ({d}%)"
				},
				legend : {
			        right: 'center',
			        y: 'bottom',
					data : [ '重申'+passNoArr[0]+'次', '重申'+passNoArr[1]+'次', '重申'+passNoArr[2]+'次', '重申'+passNoArr[3]+'次']
				},
				series : [ {
					name : '资质审核',
					type : 'pie',
					radius : '55%',
					center : [ '50%', '50%' ],
					data : [ {
						value : passNoCnt[0],
						name : '重申'+passNoArr[0]+'次'
					}, {
						value : passNoCnt[1],
						name : '重申'+passNoArr[1]+'次'
					}, {
						value : passNoCnt[2],
						name : '重申'+passNoArr[2]+'次'
					}, {
						value : passNoCnt[3],
						name : '重申'+passNoArr[3]+'次'
					}],
					itemStyle : {
						emphasis : {
							shadowBlur : 10,
							shadowOffsetX : 0,
							shadowColor : 'rgba(0, 0, 0, 0.5)'
						}
					}
				}]
			};
			myChart1.setOption(option);
		});
	</script>
</body>
</html>
