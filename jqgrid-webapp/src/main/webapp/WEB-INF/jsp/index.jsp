<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>A Spring MVC + jqgrid + Jquery example</TITLE>
<META content="text/html; charset=iso-8859-1" http-equiv=Content-Type>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<script src="../include/jquery-1.11.0.min.js" type="text/javascript"></script>

	<link rel="stylesheet"
		href="../stylesheets/jquery-ui.css" />
	<script src="../include/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
	
	<link rel="stylesheet" type="text/css" href="../stylesheets/ui.jqgrid.css" />
	
	<script src="../include/grid.locale-en.js" type="text/javascript"></script>
	<script src="../include/jquery.jqGrid.min.js" type="text/javascript"></script>	

<script>		
	$(document).ready(function() {		
		
		$.when($.getJSON('/jqgridexample/views/web/getemployees')).then(function (data) {
			
			$("#employees").jqGrid({
			    datatype: "local",
			    height: 250,
			    width: 700,
			    colNames: ['EMPLOYEE ID', 'FIRST NAME', 'LAST NAME', 'ADDRESS', 'PHONE'],
			    colModel: [{
			        name: 'empID',
			        index: 'empID',
			        width: 10,
			        sorttype: "int"},
			    {
			        name: 'firstName',
			        index: 'firstName',
			        width: 50},
			    {
			        name: 'lastName',
			        index: 'lastName',
			        width: 50},
			    {
			        name: 'address',
			        index: 'address',
			        width: 100},
			    {
			        name: 'phone',
			        index: 'phone',
			        width: 10}
			    ],
			});

			var names = ['empID', 'firstName', 'lastName', 'address', 'phone'];
			var employeedata = [];

			for (var i = 0; i < data.length; i++) {
			    employeedata[i] = {};
			    employeedata[i][names[0]] = data[i].empID;
			    employeedata[i][names[1]] = data[i].firstName;
			    employeedata[i][names[2]] = data[i].lastName;
			    employeedata[i][names[3]] = data[i].address;
			    employeedata[i][names[4]] = data[i].phone;
			}

			for (var i = 0; i <= employeedata.length; i++) {
			    $("#employees").jqGrid('addRowData', i + 1, employeedata[i]);
			}

			$("#employees").jqGrid('setGridParam', {ondblClickRow: function(rowid,iRow,iCol,e){alert('double clicked');}});
		
		});      
	});	
</script>

</HEAD>
<BODY>	
	<DIV id="container">
		<DIV id="header" style="float : left; margin-left : 20px">			
			<div class="subtitle">A Spring MVC + jqgrid + Jquery example</div>
		</DIV>
		<div id="contentContainer">			
			<DIV id="rightNavPanel" style="float : left; margin-left : 20px">				

							<div class="section">
								<div class="outline">
									<div class="sectionHeader">
										<span class="sectionTitle" style="background-color: BLACK;color: WHITE;padding-left: 250;">Employees Records</span>
									</div>
									<div style="height : 260px; max-height : 260px; width: 100%; display: inline;float: left;margin-right: 0px; overflow : auto;">
										<table id="employees"></table>
										<div id="pager"></div>
									</div>
								</div>
								<!-- end outline div -->
							</div>
							<!-- end section div -->
								
			</DIV>
			<!-- rightNavPanel -->
		</div>
		<!--  end of content container -->
			<DIV id=footer>
			</DIV>			
	</DIV> 	
	
</BODY>
</HTML>
