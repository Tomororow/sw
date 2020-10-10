
/*
//Cookie取值
function readCookie (name)
{
    var cookieValue = "";
    var search = name + "=";
    if (document.cookie.length > 0)
    {
        offset = document.cookie.indexOf (search);
        if (offset != -1)
        {
            offset += search.length;
            end = document.cookie.indexOf (";", offset);
            if (end == -1)
                end = document.cookie.length;
            cookieValue = unescape (document.cookie.substring (offset, end))
        }
    }
    return cookieValue;
}

//删除
function delCookie(name) { var exp = new Date(); exp.setTime(exp.getTime() - 1); var cval=getCookie(name); if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString(); } 


//Cookie设置值
function writeCookie (name, value, hours)
{
    var expire = "";
    if (hours != null)
    {
        expire = new Date ((new Date ()).getTime () + hours * 3600000);
        expire = "; expires=" + expire.toGMTString ();
    }
    document.cookie = name + "=" + escape (value) + expire;
}
*/

function setCookie(name,value) 
{ 
    var Days = 30; 
    var exp = new Date(); 
    exp.setTime(exp.getTime() + Days*24*60*60*1000); 
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString(); 
} 

function getCookie(name) 
{ 
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
 
    if(arr=document.cookie.match(reg))
 
        return unescape(arr[2]); 
    else 
        return null; 
} 

function delCookie(name) 
{ 
    var exp = new Date(); 
    exp.setTime(exp.getTime() - 1); 
    var cval=getCookie(name); 
    if(cval!=null) 
        document.cookie= name + "="+cval+";expires="+exp.toGMTString(); 
} 
