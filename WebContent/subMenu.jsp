<style type="text/css">
ul li a
{
cursor:pointer;
}
</style>
<script type="text/javascript">
function submitForm(s)
{
	var f=document.subMenuForm;
	
if(s=="homeMenu")
{
	f.action="homeMenu";	
}
if(s=="shiftLogs")
{
	f.action="shiftLogs";
}
if(s=="locations")
{
	f.action="locations";
}
f.submit();
}

</script>
<form name="subMenuForm" method="post" action="">
<ul>
  <li style="margin-right:100px"><a class="active">Option10</a></li>
  <li><a>Option8</a></li>
  <li><a>Option7</a></li>
  <li><a>Option6</a></li>
  <li><a>Option5</a></li>
  <li><a>Shift Logs</a></li>
  <li><a onclick="javascript:return submitForm('shiftLogs')">Daily Log</a></li>  
  <li><a onclick="javascript:return submitForm('locations')">My Sites</a></li>
  <li><a onclick="javascript:return submitForm('homeMenu')">Home</a></li>  
</ul> 
</form>