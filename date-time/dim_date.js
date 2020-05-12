//-----------------------------------------------------
//--注意需要根据定义修改 language、country、init_date
//--需要在前一步定义这些变量，可以使用生成记录组件生成
//-----------------------------------------------------

//locale
var locale = new java.util.Locale(language.getString(),country.getString());
//calendar
var calendar = new java.util.GregorianCalendar(locale);
//设置时间
calendar.setTime(init_date.getDate());
//设置日历为当前日期
calendar.add(calendar.DAY_OF_MONTH,DaySequence.getInteger()-1);
//获取日期
var date = new java.util.Date(calendar.getTimeInMillis());
//短日期
var date_short = java.text.DateFormat.getDateInstance(java.text.DateFormat.SHORT,locale).format(date);
//中日期
var date_medium = java.text.DateFormat.getDateInstance(java.text.DateFormat.MEDIUM,locale).format(date);
//长日期
var date_long = java.text.DateFormat.getDateInstance(java.text.DateFormat.LONG,locale).format(date);
//全日期
var date_full = java.text.DateFormat.getDateInstance(java.text.DateFormat.FULL,locale).format(date);


var date_value = java.text.DateFormat.getDateInstance().format(date);


//简单格式化
var simpleDateFormat = java.text.SimpleDateFormat("D",locale);
//获取天在年中第几天
var day_in_year= simpleDateFormat.format(date);
//建立格式器
simpleDateFormat.applyPattern("d");
//获取天在月的第几天
var day_in_month = simpleDateFormat.format(date);

//en-us example: "Mon" 原脚本中没有此定义
simpleDateFormat.applyPattern("E");
var day_abbreviation   = simpleDateFormat.format(date);

//星期格式器
simpleDateFormat.applyPattern("EEEE");
//获取星期名称
var day_name = simpleDateFormat.format(date);
//星期缩写格式器
simpleDateFormat.applyPattern("EEEE");
//获取星期名称
var day_name = simpleDateFormat.format(date);
//一年第几周的格式器
simpleDateFormat.applyPattern("ww");
//获取一年的第几周
var week_in_year = simpleDateFormat.format(date);
//月第几周的格式器
simpleDateFormat.applyPattern("W");
//获取月的第几周
var week_in_month = simpleDateFormat.format(date);
//月份
simpleDateFormat.applyPattern("MM");
//获取月份
var month_number = simpleDateFormat.format(date);
//月份名称
simpleDateFormat.applyPattern("MMMM");
//获取月的名称
var month_name = simpleDateFormat.format(date);
//月的缩写
simpleDateFormat.applyPattern("MMM");
//获取月的缩写
var month_abbreviation = simpleDateFormat.format(date);
//两位数年份
simpleDateFormat.applyPattern("yy");
//获取两位数年份
var year2 = simpleDateFormat.format(date);
//四位数年份
simpleDateFormat.applyPattern("yyyy");
//获取四位数年份
var year4 = simpleDateFormat.format(date);

//季度名称
var quarter_name = "Q";
//季度
var quarter_number;
switch(parseInt(month_number)){
       case 1:
       case 2:
       case 3:
             quarter_number = "1";
       break;
       case 4:
       case 5:
       case 6:
             quarter_number = "2";
       break;
       case 7:
       case 8:
       case 9:
             quarter_number = "3";
       break;
       case 10:
       case 11:
       case 12:
             quarter_number = "4";
       break;
}

quarter_name += quarter_number;

//get the local yes/no values
// var yes = local_yes.getString();
// var no = local_no.getString();
//定义常量,用于判断是否为周的第一天/最后一天
var yes = "Y";
var no = "N";

//获取周的第一天
var first_day_of_week = calendar.getFirstDayOfWeek();
var day_of_week = java.util.Calendar.DAY_OF_WEEK;
//判断是否为周的第一天
var is_first_day_of_week;
if(first_day_of_week == calendar.get(day_of_week)){
       is_first_day_of_week = yes;
}else{
       is_first_day_of_week = no;
}

//日历的下一天
calendar.add(calendar.DAY_OF_MONTH,1);
//获取下一天
var next_day = new java.util.Date(calendar.getTimeInMillis());
//判断是否为下一天
var is_last_day_of_week;
if(first_day_of_week == calendar.get(day_of_week)){
       is_last_day_of_week = yes;
}else{
       is_last_day_of_week = no;
}

//是否为月的第一天
var is_first_day_in_month;
if(day_in_month == 1){
       is_first_day_in_month = yes;
}else{
       is_first_day_in_month = no;
}

//是否为月的最后一天
var is_last_day_in_month;
if(java.text.SimpleDateFormat("d",locale).format(next_day) == 1){
       is_last_day_in_month = yes;
}else{
       is_last_day_in_month = no;
}

//年-季度
var year_quarter = year4 + "-" + quarter_name;

//年-月份
var year_month_number = year4+ "-" + month_number;

//年-月缩写
var year_month_abbreviation = year4 + "-" + month_abbreviation;

//日期代理键 , 唯一键
var date_key = year4 + month_number + (day_in_month < 10 ? "0" : "") + day_in_month;



//版权声明：本文为CSDN博主「3coco」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
//原文链接：https://blog.csdn.net/qq_38241583/article/details/88702112
//