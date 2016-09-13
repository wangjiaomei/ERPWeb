<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>city</title>

</head>
<body>
	<script src="js/build/dist/echarts.js" type="text/javascript"></script>
	<script src="js/jquery-3.0.0.min.js" type="text/javascript"></script>

	<div id="city"
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
			require([ 'echarts','echarts/chart/map' ], function(ec) {
				$.get('js/hunan.json', function(hunanJson) {
					echarts.registerMap('湖南', hunanJson); 
					var chart = echarts.init(document.getElementById('city'));
					chart.setOption({
						title : {
							text : 'ERP'
						},
						tooltip : {
							trigger : 'item',
							formatter : '{b}<br/>{c}'
						},
						toolbox : {
							show : true,
							orient : 'vertical',
							left : 'right',
							top : 'center',
							feature : {
								dataView : {
									readOnly : false
								},
								restore : {},
								saveAsImage : {}
							}
						},
						visualMap : {
							min : 1,
							max : 2000,
							text : [ 'High', 'Low' ],
							realtime : false,
							calculable : true,
							inRange : {
								color : [ 'lightskyblue', 'yellow', 'orangered' ]
							}
						},
						series : [ {
							name : 'ERP',
							type : 'map',
							map : 'hunan',
							itemStyle : {
								normal : {
									label : {
										show : true
									}
								},
								emphasis : {
									label : {
										show : true
									}
								}
							},
							data : [ {
								name : '其他',
								value : 1
							}, {
								name : '娄底市',
								value : 220
							}, {
								name : '岳阳市',
								value : 535
							}, {
								name : '常德市',
								value : 1250
							}, {
								name : '张家界市',
								value : 260
							}, {
								name : '怀化市',
								value : 536
							}, {
								name : '株洲市',
								value : 299
							}, {
								name : '永州市',
								value : 215
							}, {
								name : '湘潭市',
								value : 769
							}, {
								name : '湘西土家族苗族自治州',
								value : 62
							}, {
								name : '益阳市',
								value : 386
							}, {
								name : '衡阳市',
								value : 221
							}, {
								name : '邵阳市',
								value : 683
							}, {
								name : '郴州市',
								value : 359
							}, {
								name : '长沙市',
								value : 2514
							} ]
						} ]
					});
				});
				
			});
	</script>
</body>
</html>
