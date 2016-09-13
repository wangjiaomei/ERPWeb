<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wordcloud</title>
</head>

<body>
	<!-- 2222 -->
	<%--1111 --%>
	<%@ include file="inc_conn.jsp"%>
	<%@ include file="wordcloudQuery.jsp"%>

	<script src="js/build/dist/echarts.js" type="text/javascript"></script>
	<div id="wordcloud"
		style="height: 600px; width: 600px; border: 10px solid #ccc; padding: 10px;"></div>
	<script type="text/javascript">
	var wordArr = new Array();
	var wordCnt = new Array();
	<c:forEach var="row" items="${wordRet.rows}" varStatus="idx">
		wordArr[${idx.index }] = '${row.typename}';
		wordCnt[${idx.index }] = '${row.cnt}';
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
		require([ 'echarts', 'echarts/chart/wordCloud' ], function(ec) {//渲染ECharts图表  ，可单独写出来作为回调函数
			var myChart1 = ec.init(document.getElementById('wordcloud'));
			//加载图表
			option = {
				title : {
					text : '客户资质词云分布',
					subtext : 'ERP'
				},
				tooltip : {
					show : true
				},
				series : [ {
					name : 'Google Trends',
					type : 'wordCloud',
					size : [ '80%', '80%' ],
					textRotation : [ 0, 30, 60, 90, -60, -30 ],
					textPadding : 0,
					autoSize : {
						enable : true,
						minSize : 14
					},
					data : [ {
						name : wordArr[0],
						value : wordCnt[0],
						itemStyle : {
							normal : {
								color : '#0080ff'
							}
						}
					}, {
						name : wordArr[1],
						value : wordCnt[1],
						itemStyle : {
							normal : {
								color : '#8bbc21'
							}
						}
					}, {
						name : wordArr[2],
						value : wordCnt[2],
						itemStyle : {
							normal : {
								color : '#C10066'
							}
						}
					}, {
						name : wordArr[3],
						value : wordCnt[3],
						itemStyle : {
							normal : {
								color : '#ffd700'
							}
						}
					}, {
						name : wordArr[4],
						value : wordCnt[4],
						itemStyle : {
							normal : {
								color : '#008b8b'
							}
						}
					}, {
						name : wordArr[5],
						value : wordCnt[5],
						itemStyle : {
							normal : {
								color : '#D200D2'
							}
						}
					}, {
						name : wordArr[6],
						value : wordCnt[6],
						itemStyle : {
							normal : {
								color : '#ff8c00'
							}
						}
					}, {
						name : wordArr[7],
						value : wordCnt[7],
						itemStyle : {
							normal : {
								color : '#ff69b4'
							}
						}
					}, {
						name : wordArr[8],
						value : wordCnt[8],
						itemStyle : {
							normal : {
								color : '#00ff00'
							}
						}
					}, {
						name : wordArr[9],
						value : wordCnt[9],
						itemStyle : {
							normal : {
								color : '#8600FF'
							}
						}
					} ]
				} ]
			};
			myChart1.setOption(option);
		});
	</script>

</body>
</html>