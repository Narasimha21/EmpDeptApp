/**
 * 
 */

$(document).ready(function() {
	$("#addB").click(function() {

		$("#formadd").show();
		$("#dform").hide();
		$("#resultId").hide();
		$("#Uemp").hide();
		$("#empF").hide();

	});

	$("#updateB").click(function() {
		$("#fieldId").removeAttr("disabled");
		$("#saveB").show();
		
	});

	
	$("#saveB").click(function() {
		
		$("#form2").submit();
		
	});
	
	/*$("#deleteB").click(function() {
		
		$("#fieldId").removeAttr("disabled");
		document.getElementById("fieldId").disabled=false;
		$("#Demp").show();
		$("#empF").hide();
		$("#formadd").hide();
		$("#addB").hide();
		$("#searchId").hide();
		$("#searchB").hide();
		$("#updateB").hide();
		$("#resultId").hide();
		$("#deleteB").hide();
		
	});*/
	$("#searchB").click(function() {
		$("#formadd").hide();
		$("#addB").hide();
		$("#deleteB").show();
		$("#updateB").show();
		$("#empS").show();
		$("#searchId").hide();
		$("#searchB").hide();
		$("#resultId").hide();
		$("#empF").hide();
		
	});

});