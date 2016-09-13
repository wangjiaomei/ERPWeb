<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>active</title>

</head>
<body>
	<script src="js/build/dist/echarts.js" type="text/javascript"></script>

	<div id="industry"
		style="height: 400px; width: 600px; border: 10px solid #ccc; padding: 10px;"></div>
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
			var myChart1 = ec.init(document.getElementById('active'));
			//加载图表
			option = {
				title : {
					text : '某服务商2016年1月市场活动详情',
					x : 'center'
				},
				calculable : false,
				tooltip : {
					show : true,
					axisPointer : {
						type : 'shadow'
					},
					feature : {
						mark : {
							show : true
						},
						dataView : {
							show : true,
							readOnly : false
						},
						magicType : {
							show : true,
							type : [ 'line', 'bar', 'stack', 'tiled' ]
						},
						restore : {
							show : true
						},
						saveAsImage : {
							show : true
						}
					}
				},
				axis : {
					splitLine : {
						show : false
					},
					splitArea : {
						show : false
					}
				},
				calculable : true,
				yAxis : [ {
					type : "category",
					splitLine : {
						show : true
					},
					data : [ "活动1", "活动2", "活动3", "活动4", "活动5" ]
				} ],
				xAxis : [ {
					type : 'value',
					axisLabel : {
						formatter : function(value) {
							var end_time = 1518428800000;
							var start_time = 1451600000000;
							var date = new Array();
							var i = 3;
							while (end_time > start_time) {
								var date_formatter = new Date(start_time);
								var date_time = (date_formatter.getFullYear()
										+ "-" + (date_formatter.getMonth() + 1)
										+ "-" + date_formatter.getDate());
								date.push(date_time);
								start_time = start_time + i * 24 * 60 * 60
										* 1000;
							}
							return date[value * 1];
						}
					},
				} ],
				series : [ {
					name : "辅助",
					type : "bar",
					stack : "总",
					itemStyle : {
						normal : {
							barBorderColor : 'rgba(0,0,0,0)',
							color : 'rgba(0,0,0,0)'
						},
						emphasis : {
							barBorderColor : 'rgba(0,0,0,0)',
							color : 'rgba(0,0,0,0)'
						}
					},
					data : [ 0, 1, 2, 3, 4 ]
				}, {
					type : "bar",
					stack : "总",
					data : [ 5, 0, 0, 0, 0 ]
				}, {
					type : "bar",
					stack : "总",
					data : [ 0, 1, 0, 0, 0 ]
				}, {
					type : "bar",
					stack : "总",
					data : [ 0, 0, 2, 0, 0 ]
				}, {
					type : "bar",
					stack : "总",
					data : [ 0, 0, 0, 3, 0 ]
				}, {
					type : "bar",
					stack : "总",
					data : [ 0, 0, 0, 0, 4 ]
				} ]
			};
			myChart1.setOption(option);
		});
	</script>
</body>
</html>
