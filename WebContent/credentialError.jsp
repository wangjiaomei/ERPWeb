<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>error</title>
</head>

<body>
	<!-- 2222 -->
	<%--1111 --%>
	<%@ include file="inc_conn.jsp"%>
	<%@ include file="credentialErrorQuery.jsp"%>

	<script src="js/build/dist/echarts.js" type="text/javascript"></script>
	<div id="error"
		style="position:absolute;left:10px; height: 500px; width: 80%; border: 10px solid #ccc; padding: 10px;"></div>

	<script type="text/javascript">
 			var errorArr = new Array();
			var errorAcnt = new Array();
			<c:forEach var="row" items="${credentialErrorRet.rows}" varStatus="idx">
				errorArr[${idx.index }] = '${row.typename}';
				errorAcnt[${idx.index }] = ${row.cnt};	
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
			require(['echarts', 'echarts/chart/line'], function(ec) {//渲染ECharts图表  ，可单独写出来作为回调函数
				var myChart1 = ec.init(document.getElementById('error'));
				//加载图表
				option = {
    title: {
        text: 'ERP资质重申率',
        subtext: 'ERP'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:['重申率']
    },
    toolbox: {
        show: true,
        feature: {
            dataZoom: {
                yAxisIndex: 'none'
            },
            dataView: {readOnly: false},
            magicType: {type: ['line', 'bar']},
            restore: {},
            saveAsImage: {}
        }
    },
    xAxis:  {
        type: 'category',
        boundaryGap: false,
        data: errorArr,
		axisLabel: {
			rotate: 45,
			textStyle: {
				fontSize: 12
			}
		}
    },
	grid: { // 控制图的大小，调整下面这些值就可以，
        x: 107,
        x2: 100,
        y2: 170,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
    },
    yAxis: {
        type: 'value',
        axisLabel: {
            formatter: '{value} %'
        }
    },
    series: [
        {
            name:'重申率',
            type:'line',
            data:errorAcnt,
            markPoint: {
                data: [
                    {type: 'max', name: '最大值'},
                    {type: 'min', name: '最小值'}
                ]
            },
            markLine: {
                data: [
                    {type: 'average', name: '平均值'}
                ]
            }
        }
    ]
};
				
				myChart1.setOption(option);
			});
		</script>

</body>
</html>