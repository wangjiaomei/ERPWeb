<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>funnel</title>
</head>

<body>
<!-- 2222 -->
<%--1111 --%>
<%@ include file="inc_conn.jsp" %>
<%@ include file="funnalQuery.jsp" %>

<script src="js/build/dist/echarts.js" type="text/javascript"></script>
<div id="funnel" style="height: 400px; width: 75%; border:10px solid #ccc; padding: 10px;"></div>

		<script type="text/javascript">
			var numArr = new Array();
			<c:forEach var="row" items="${funnalRet.rows}" varStatus="idx">
				numArr[${idx.index }] = ${row.ct};
			</c:forEach>			
			// Step:3 conifg ECharts's path, link to echarts.js from current page.
			// Step:3 为模块加载器配置echarts的路径，从当前页面链接到echarts.js，定义所需图表路径
			require.config({
				    paths: {
				//echarts.js所在的路径
				 echarts: 'js/build/dist'
				 }
			});
			// Step:4 require echarts and use it in the callback.
			// Step:4 动态加载echarts然后在回调函数中开始使用，注意保持按需加载结构定义图表路径
			require(['echarts', 'echarts/chart/bar', 'echarts/chart/map', 'echarts/chart/funnel'], function(ec) {//渲染ECharts图表  ，可单独写出来作为回调函数
				var myChart1 = ec.init(document.getElementById('funnel'));
				//加载图表
				option = {
					title : {
						text : 'ERP漏斗图',
						subtext : 'ERP'
					},
					tooltip : {
						trigger : 'item',
						formatter : "{a} <br/>{b} : {c}%"
					},
					toolbox : {
						show : true,
						feature : {
							mark : {
								show : true
							},
							dataView : {
								show : true,
								readOnly : false
							},
							restore : {
								show : true
							},
							saveAsImage : {
								show : true
							}
						}
					},
					legend : {
				        /* orient: 'vertical', */
				        right: 'center',
				        y: 'bottom',
						data : ['线索客户','有效客户', '商机客户', '兴趣客户','订单客户']
					},

					calculable : true,
					series : [{
						name : '漏斗图',	
						type : 'funnel',
						width : '50%',
						data : [{
							value : numArr[0],
							name : '线索客户'
						}, {
							value : numArr[1],
							name : '有效客户'
						}, {
							value : numArr[2],
							name : '商机客户'
						}, {
							value : numArr[3],
							name : '兴趣客户'
						},{
							value : numArr[4],
							name : '订单客户'
						}]
					}]
				};
				myChart1.setOption(option);
			});
		</script>

</body>
</html>