<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>日历</title>
    <link href="/fullcalendar/fullcalendar.css" rel="stylesheet"/>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        /* 日历 */
        #calendar {
            margin: 40px auto;
            padding: 0 10px;
        }

        /* Event 参数 className 的值 */
        .done:before {
            content: "【 已完成 】";
            background-color: yellow;
            color: green;
            text-align: center;
            font-weight: bold;
            width: 100%;
        }

        /* Event 参数 className 的值 */
        .doing:before {
            content: "【 未完成 】";
            background-color: yellow;
            color: red;
            text-align: center;
            font-weight: bold;
        }

    </style>
</head>
<body>
<div id="calendar"></div>

</body>
<script src="/fullcalendar/lib/jquery.min.js"></script>
<script src="/fullcalendar/lib/moment.min.js"></script>
<script src="/fullcalendar/fullcalendar.min.js"></script>
<script src="/fullcalendar/locale/zh-cn.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //初始化FullCalendar
        $('#calendar').fullCalendar({
            //设置头部信息，如果不想显示，可以设置header为false
            header: {
                //日历头部左边：初始化切换按钮
                left: 'prev,next today',
                //日历头部中间：显示当前日期信息
                center: 'title',
                //日历头部右边：初始化视图
                right: 'month,agendaWeek,agendaDay'
            },
            //设置是否显示周六和周日，设为false则不显示
            weekends: true,
            //日历初始化时显示的日期，月视图显示该月，周视图显示该周，日视图显示该天，和当前日期没有关系
            defaultDate: '2019-01-01',
            //月视图下日历格子宽度和高度的比例
            aspectRatio: 1.35,
            //月视图的显示模式，fixed：固定显示6周高；liquid：高度随周数变化；variable: 高度固定
            weekMode: 'liquid',
            //初始化时的默认视图，month、agendaWeek、agendaDay
            defaultView: 'month',
            //设置为true时，如果数据过多超过日历格子显示的高度时，多出去的数据不会将格子挤开，而是显示为 +...more ，点击后才会完整显示所有的数据
            eventLimit: true,
            //点击天
            dayClick: function(date,allDay,jsEvent,view){
               console.log("日期：",date.format('YYYY-MM-DD HH:mm'))
            },
            //点击事件
            eventClick : function( event ){
                //do something here...
                console.log('eventClick中选中Event的id属性值为：', event.id);
                console.log('eventClick中选中Event的title属性值为：', event.title);
                console.log('eventClick中选中Event的start属性值为：', event.start.format('YYYY-MM-DD HH:mm'));
                console.log('eventClick中选中Event的end属性值为：', event.end==null?'空':event.end.format('YYYY-MM-DD HH:mm'));
                console.log('eventClick中选中Event的color属性值为：', event.color);
                console.log('eventClick中选中Event的className属性值为：', event.className);
                // ...
            },
            //日程数据
            events: function(start,end,timezone, callback) {
            var date = this.getDate().format('YYYY-MM');
            $.ajax({
                url: '../version/selectall',
                type: "post",
                success: function(json) { // 获取当前月的数据
                    console.log("数据=",json)
                    var events = [];
                    if (json) {
                        $.each(json,function(i,c) {
                                events.push({
                                    id:c.id,
                                    title:c.product.name+'('+c.product.paltform+')'+c.versionCode ,
                                    start: c.createTime , // will be parsed
                                    color: 'green'
                                });
                            });
                    }
                    callback(events);
                }
            });
        }

        });


    });
</script>
</html>