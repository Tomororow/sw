<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/base.jsp"%>

var dom2 = document.getElementById("container3");
var myChart = echarts.init(dom2);
var app = {};
option = null;
var base = +new Date(2018,0,26,0,0,0);
var oneDay =1000;
var date = [];

var data = [Math.random() * 300];

var a=[];

$.ajax({
		url:"${ctx}/site_water_dynamic_info/one_day_data",
		data: {devicewaterCode:'111'},
		type: "post",
		async: false,//非异步
		success: function(msg){
			//alert("aaa");
			//alert(JSON.stringify(msg));
			//alert(JSON.stringify(msg[1].waterLevel));
			for(var i=0;i<msg.length;i++){
				a.push(msg[i].waterLevel);
			}
		}
	});
data = a;


for (var i = 0; i < 86400; i++) {
    var now = new Date(base += oneDay);
    date.push([now.getHours(), now.getMinutes(), now.getSeconds()].join(':'));
  // data.push(a[i]);
}

option = {
    tooltip: {
        trigger: 'axis',
        
        position: function (pt) {
            return [pt[0], '100%'];
        }
    },
    title: {
        left: 'center',
        text: '当天水位图',
    },
    toolbox: {
        feature: {
            dataZoom: {
                yAxisIndex: 'none'
            },
            restore: {},
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: date,
        splitLine: {
	        show: true,
	    }
    },
    yAxis: {
        type: 'value',
        boundaryGap: [0, '100%']
	   
    },
    dataZoom: [{
        type: 'inside',
        start: 0,
        end: 10
    }, {
        start: 0,
        end: 10,
        handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
        handleSize: '80%',
        handleStyle: {
            color: '#fff',
            shadowBlur: 3,
            shadowColor: 'rgba(0, 0, 0, 0.6)',
            shadowOffsetX: 2,
            shadowOffsetY: 2
        }
    }],
    series: [
        {
            name:'模拟数据',
            type:'line',
            smooth:true,
            symbol: 'none',
            sampling: 'average',
            itemStyle: {
                normal: {
                    color: 'rgb(255, 70, 131)'
                }
            },
            areaStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                        offset: 0,
                        color: 'rgb(255, 158, 68)'
                    }, {
                        offset: 1,
                        color: 'rgb(255, 70, 131)'
                    }])
                }
            },
            data: data
        }
    ]
};
;


if (option && typeof option === "object") {
    myChart.setOption(option, true);
}