function charLeft(obj, obj2, max)
{
   curr = document.getElementById(obj2)
   curr.innerHTML = max - obj.value.length
   if (max - obj.value.length < 101)
   { curr.style.color = 'red'; }
   else { curr.style.color = 'green'; }
}

function DigitsOnly(obj)
{
  var i = obj.value.length-1; 
  var ch = obj.value.charAt(i); 
  if (ch < '0' || ch > '9') 
  {obj.value=obj.value.substring(0, i);}
}

function Telephone(obj)
{
  var i = obj.value.length-1; 
  var ch = obj.value.charAt(i); 
  if ((ch == '(') | (ch == ')') | (ch == '+') | (ch == '-')) { }
  else
  {
    if (ch < '0' || ch > '9') 
    {obj.value=obj.value.substring(0, i);}    
  }
}

