var currentParent;
var currentMenu;
var menuToHide;
var fadestep;
var cleared = true;
var browserdetect;
	
	function Pos(thisitem)
	{
		if(typeof(thisitem) != 'object') {thisitem = document.getElementById(thisitem);}
		var ww = thisitem.offsetWidth, hh = thisitem.offsetHeight;
		for (var xx = 50,yy = -5; thisitem != null; xx += thisitem.offsetLeft,yy += thisitem.offsetTop,thisitem = thisitem.offsetParent);
		return {Left:xx, Top:yy, Right:xx + ww, Bottom:yy + hh}
	}	
	
	function ShowMenu(thisitem, menu)
	{
		cleared = false
		currentParent = thisitem;
		if(typeof(menu) != 'object')
			{menu = document.getElementById(menu);}
		if(currentMenu == menu)
			{
				if (!cleared) clearInterval(fadestep);
				currentMenu = null;
			}
		else if(currentMenu != null)
			{
				InstantHide(currentMenu);
				if (!cleared) clearInterval(fadestep);
				currentMenu = null;
			}
		currentMenu = menu;
		browserdetect=menu.filters? "ie" : typeof(menu.style.MozOpacity) == "string" ? "mz" : ""
		if (browserdetect == "ie")
			{currentMenu.filters.alpha.opacity = 100}
		else if (browserdetect == "mz")
			{currentMenu.style.MozOpacity = 1}
		currentMenu.style.left = Pos(currentParent).Left;
		currentMenu.style.top = Pos(currentParent).Bottom;
		currentMenu.style.display = 'block';
	}	
	
	function HoldMenu()
	{
		ShowMenu(currentParent, currentMenu);
	}	
	
	function HideMenu(hideMenu)
	{
		if(typeof(hideMenu) != 'object')
			{hideMenu = document.getElementById(hideMenu);}
		if(menuToHide != hideMenu && menuToHide != null)
			{InstantHide(menuToHide);}
		menuToHide = hideMenu;
		FadeMenu();
	}
	
	function FadeMenu()
	{
		fadestep=setInterval("FadeLevel()",25)
	}
	
	function FadeLevel()
	{
		if (browserdetect == "ie")
			{menuToHide.filters.alpha.opacity-=100}
		else if (browserdetect == "mz")
			{menuToHide.style.MozOpacity-=.1}
		else
			{menuToHide.style.display = 'none';}
			
		if ((menuToHide.style.MozOpacity == 0.0)||(menuToHide.filters.alpha.opacity == 0))
			{
				InstantHide(menuToHide);
				menuToHide = null;
			}
	}
	
	function InstantHide(iHideMenu) {
		clearInterval(fadestep);
		cleared=true
		iHideMenu.style.display = 'none';
	}
		
	function msdelay(mseconds) {
		starttime = new Date()
		while (1) {
			nowtime = new Date()
			diff = nowtime-starttime
			if( diff > mseconds ) {break;}
		}
	}