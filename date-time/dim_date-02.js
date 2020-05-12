//Create a Locale according to the specified language code
var locale = new java.util.Locale(
    language.getString()
,   country.getString()
);

//Create a calendar, use the specified initial date
var calendar = new java.util.GregorianCalendar(locale);
calendar.setTime(init_date.getDate());

//set the calendar to the current date by adding DaySequence days
calendar.add(calendar.DAY_OF_MONTH,DaySequence.getInteger() - 1);

//get the calendar date
var date = new java.util.Date(calendar.getTimeInMillis());

//en-us example: 9/3/07
var date_short  = java.text.DateFormat.getDateInstance(
                      java.text.DateFormat.SHORT
                  ,   locale
                  ).format(date);
//en-us example: Sep 3, 2007 
var date_medium = java.text.DateFormat.getDateInstance(
                      java.text.DateFormat.MEDIUM
                  ,   locale
                  ).format(date);
//en-us example: September 3, 2007
var date_long   = java.text.DateFormat.getDateInstance(
                      java.text.DateFormat.LONG
                  ,   locale
                  ).format(date);
//en-us example: Monday, September 3, 2007
var date_full   = java.text.DateFormat.getDateInstance(
                      java.text.DateFormat.FULL
                  ,   locale
                  ).format(date);

//day in year: 1..366
var simpleDateFormat   = java.text.SimpleDateFormat("D",locale);
var day_in_year        = simpleDateFormat.format(date);
//day in month: 1..31
simpleDateFormat.applyPattern("d");
var day_in_month       = simpleDateFormat.format(date);
//en-us example: "Monday"
simpleDateFormat.applyPattern("EEEE");
var day_name           = simpleDateFormat.format(date);
//en-us example: "Mon"
simpleDateFormat.applyPattern("E");
var day_abbreviation   = simpleDateFormat.format(date);
//week in year, 1..53
simpleDateFormat.applyPattern("ww");
var week_in_year       = simpleDateFormat.format(date);
//week in month, 1..5
simpleDateFormat.applyPattern("W");
var week_in_month      = simpleDateFormat.format(date);
//month number in year, 1..12
simpleDateFormat.applyPattern("MM");
var month_number       = simpleDateFormat.format(date);
//en-us example: "September"
simpleDateFormat.applyPattern("MMMM");
var month_name         = simpleDateFormat.format(date);
//en-us example: "Sep"
simpleDateFormat.applyPattern("MMM");
var month_abbreviation = simpleDateFormat.format(date);
//2 digit representation of the year, example: "07" for 2007
simpleDateFormat.applyPattern("y");
var year2              = simpleDateFormat.format(date);
//4 digit representation of the year, example:  2007
simpleDateFormat.applyPattern("yyyy");
var year4              = "" + simpleDateFormat.format(date);
//handling Quarters is a DIY
var quarter_name = "Q";
var quarter_number;
switch(parseInt(month_number)){
    case 1: case 2: case 3: quarter_number = "1"; break;
    case 4: case 5: case 6: quarter_number = "2"; break;
    case 7: case 8: case 9: quarter_number = "3"; break;
    case 10: case 11: case 12: quarter_number = "4"; break;
}
quarter_name += quarter_number;

//get the local yes/no values
// var yes = local_yes.getString();
// var no = local_no.getString();
var yes = "Y";
var no = "N";

//initialize for week calculations
var first_day_of_week = calendar.getFirstDayOfWeek();
var day_of_week = java.util.Calendar.DAY_OF_WEEK;

//find out if this is the first day of the week
var is_first_day_in_week;
if(first_day_of_week==calendar.get(day_of_week)){
    is_first_day_in_week = yes;
} else {
    is_first_day_in_week = no;
}

//calculate the next day
calendar.add(calendar.DAY_OF_MONTH,1);
//get the next calendar date
var next_day = new java.util.Date(calendar.getTimeInMillis());

//find out if this is the first day of the week
var is_last_day_in_week;
if(first_day_of_week==calendar.get(day_of_week)){
    is_last_day_in_week = yes;
} else {
    is_last_day_in_week = no;
}

//find out if this is the first day of the month
var is_first_day_of_month;
if(day_in_month == 1){
    is_first_day_in_month = yes;
} else {
    is_first_day_in_month = no;
}

//find out if this is the last day in the month
var is_last_day_of_month;
if(java.text.SimpleDateFormat("d",locale).format(next_day)==1){
    is_last_day_in_month = yes;
} else {
    is_last_day_in_month = no;
}

//date = year4 + "-" + month_number + "-" + day_in_month
var year_quarter            = year4 + "-" + quarter_name;
var year_month_number       = year4 + "-" + month_number;
var year_month_abbreviation = year4 + "-" + month_abbreviation;

var date_key = year4 + month_number + (day_in_month<10?"0":"") + day_in_month;


//版权声明：本文为CSDN博主「3coco」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
//原文链接：https://blog.csdn.net/qq_38241583/article/details/88702112