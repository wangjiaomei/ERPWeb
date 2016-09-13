<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc_conn.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>trend</title>
</head>
<body>

	<script src="js/build/dist/echarts.js"
		type="text/javascript"></script>
</head>
<body>

	<div id="trend"
		style="height: 250px; width: 90%; border: 10px solid #ccc; padding: 10px;"></div>
	<script type="text/javascript">
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
		require([ 'echarts', 'echarts/chart/bar', 'echarts/chart/map',
				'echarts/chart/line' ], function(ec) {
			//渲染ECharts图表  ，可单独写出来作为回调函数
			var myChart1 = ec.init(document.getElementById('trend'));
			//加载图表
			option = {
					title : {
						text : '线索客户每周流向图',
						subtext : 'ERP'
					},
				tooltip : {
					trigger : 'axis',
					axisPointer : { // 坐标轴指示器，坐标轴触发有效
						type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
					}
				},
				legend : {
			        right: 'center',
			        y: 'bottom',
					data : [ '本周线索转商机', '本周线索转订单', '本周线索转下周商机', '本周线索转下周订单',
							'无效客户', '待转商机客户' ]
				},
				grid : {
					left : '3%',
					right : '4%',
					bottom : '10%',
					containLabel : true
				},
				xAxis : {
					type : 'value'
				},
				yAxis : {
					type : 'category',
					data : [ '第一周', '第二周' ]
				},
				series : [ {
					name : '本周线索转商机',
					type : 'bar',
					stack : '总量',
					label : {
						normal : {
							show : true,
							position : 'insideRight'
						}
					},
					data : [ 8, 6 ]
				}, {
					name : '本周线索转订单',
					type : 'bar',
					stack : '总量',
					label : {
						normal : {
							show : true,
							position : 'insideRight'
						}
					},
					data : [ 14, 22 ]
				}, {
					name : '本周线索转下周商机',
					type : 'bar',
					stack : '总量',
					label : {
						normal : {
							show : true,
							position : 'insideRight'
						}
					},
					data : [ 2, 4 ]
				}, {
					name : '本周线索转下周订单',
					type : 'bar',
					stack : '总量',
					label : {
						normal : {
							show : true,
							position : 'insideRight'
						}
					},
					data : [ 13, 13 ]
				}, {
					name : '无效客户',
					type : 'bar',
					stack : '总量',
					label : {
						normal : {
							show : true,
							position : 'insideRight'
						}
					},
					data : [ 260, 212 ]
				}
				]
			};
			myChart1.setOption(option);
		});
	</script>
</body>
</html>
