var width = 0;
var height = 0;

function getPosition(type, item, value)
{
    //type = type.toLowerCase();
    item = item.toLowerCase();
    value = value.toLowerCase();

    if(type == 320) //iPhone 5 screen
    {
        if(item == "logo")
        {
            if(value == "x")
            {
                return 5;
            }
            if(value == "y")
            {
                return 15;
            }
            if(value == "width")
            {
                return 70;
            }
            if(value == "height")
            {
                return 70;
            }
        }
        if(item == "title")
        {
            if(value == "x")
            {
                return 78;
            }
            if(value == "y")
            {
                return 30;
            }
            if(value == "width")
            {
                return 469;
            }
            if(value == "height")
            {
                return 71;
            }
            if(value == "fontsize")
            {
                return 19;
            }
        }
    }
    if(type == 375) //iPhone 6
    {
        if(item == "logo")
        {
            if(value == "x")
            {
                return 5;
            }
            if(value == "y")
            {
                return 15;
            }
            if(value == "width")
            {
                return 70;
            }
            if(value == "height")
            {
                return 70;
            }
        }
        if(item == "title") //iPhone 6 Plus
        {
            if(value == "x")
            {
                return 78;
            }
            if(value == "y")
            {
                return 30;
            }
            if(value == "width")
            {
                return 469;
            }
            if(value == "height")
            {
                return 71;
            }
            if(value == "fontsize")
            {
                return 24;
            }
        }
    }
    if(type >= 414)
    {
        if(item == "logo")
        {
            if(value == "x")
            {
                return 13;
            }
            if(value == "y")
            {
                return 12;
            }
            if(value == "width")
            {
                return 85;
            }
            if(value == "height")
            {
                return 85;
            }
        }
        if(item == "title")
        {
            if(value == "x")
            {
                return 110;
            }
            if(value == "y")
            {
                return 25;
            }
            if(value == "width")
            {
                return 469;
            }
            if(value == "height")
            {
                return 71;
            }
            if(value == "fontsize")
            {
                return 24;
            }
        }
    }
}
