function timeChange(){$("#date").text(Date())}function applyTax(e){taxValue=e}function feeDetails(){var e=$("#feeDetailTable tr").length-1,a=0,t=0,l=0,o=0,r=0,i=0,n=0;$("#feeDetailTable tr:lt("+e+")").each(function(e,i){var n=$(i),u=n.find("td:eq(4) input").val(),s=n.find("td:eq(5) input").val();(""==u||null==u)&&(u=0),0>s&&(s=0),a=parseFloat(parseFloat(a)+parseFloat(n.find("td:eq(1) input").val())).toFixed(2),t=parseFloat(parseFloat(t)+parseFloat(n.find("td:eq(2) input").val())).toFixed(2),l=parseFloat(parseFloat(l)+parseFloat(n.find("td:eq(3) input").val())).toFixed(2),o=parseFloat(parseFloat(o)+parseFloat(u)).toFixed(2),r=parseFloat(parseFloat(r)+parseFloat(s)).toFixed(2)});var u=$("#hostel").val(),s=$("#transport").val(),v=$("#carryForward").val(),p=$("#lateFee").val(),F=$("#lateFeeWaiver").val(),d=taxValue;(""==u||null==u)&&(u=0),(""==s||null==s)&&(s=0),(""==d||null==d)&&(d=0),(""==v||null==v)&&(v=0,$("#carryForward").val(v)),(""==p||null==p)&&(p=0),(""==F||null==F)&&(F=0);var f=parseFloat(parseFloat(o)+parseFloat(u)+parseFloat(s)+parseFloat(v)).toFixed(2),i=parseFloat(parseFloat(f)*parseFloat(d)/100).toFixed(2);n=parseFloat(parseFloat(f)+parseFloat(p)-parseFloat(F)+parseFloat(i)).toFixed(2),$("#totalDefaultAmount").val(a),$("#totalEarlierPaid").val(t),$("#totalWaiver").val(l),$("#totalReceivingAmount").val(o),$("#amount").val(n),$("#totalRemainingAmount").val(r),$("#tax").val(i),$("#grandTotal").val(n)}function preventWaiverAmount(e){parseFloat(previousValue)>parseFloat($("#lateFee").val())?e.value=0:parseFloat(e.value)>parseFloat($("#lateFee").val())&&(e.value=previousValue)}function checkCurrency(e,a){var t=/^\d+(?:\.\d{0,2})$/,l=/^[0-9]*$/;t.test(a)||l.test(a)||($("#"+e).val(previousValue),t.test(previousValue)||$("#"+e).val("0"))}function traverseTable(e,a,t){previousValue>e?$("#"+t).val("0"):a>e&&$("#"+t).val(previousValue),checkCurrency(t,a);var l=$("#feeDetailTable tr").length-1,o=0,r=0;$("#feeDetailTable tr:lt("+l+")").each(function(e,a){var t=$(a),l=t.find("td:eq(4) input").val();(""==l||null==l)&&(l=0);var i=parseFloat(parseFloat(t.find("td:eq(1) input").val())-parseFloat(t.find("td:eq(2) input").val())-parseFloat(t.find("td:eq(3) input").val())-parseFloat(l)).toFixed(2);t.find("td:eq(5) input").val(i),o=parseFloat(parseFloat(o)+parseFloat(l)).toFixed(2),r=parseFloat(parseFloat(r)+parseFloat(t.find("td:eq(5) input").val())).toFixed(2)}),$("#totalReceivingAmount").val(o),$("#totalRemainingAmount").val(r),feeDetails()}function onTabOut(e){(""==e.value||null==e.value)&&(e.value=0)}function IsNumeric(e,a){previousValue=a,e.shiftKey?e.preventDefault():110==e.keyCode||46==e.keyCode||8==e.keyCode||190==e.keyCode||9==e.keyCode||37==e.keyCode||39==e.keyCode||(e.keyCode<48||e.keyCode>57)&&(e.keyCode<96||e.keyCode>105)&&e.preventDefault()}function sumReciept(e){var a=e/100,t=$("#feeDetailTable tr").length-1,l=0;$("#feeDetailTable tr:lt("+t+")").each(function(e,a){var t=$(a),o=t.find("td:eq(1) input").val();(""==o||null==o)&&(o=0),l=parseFloat(parseFloat(l)+parseFloat(o)).toFixed(2)}),l=parseFloat(l)+($("#lateFee").val()-$("#lateFeeWaiver").val()),$("#totalReceivingAmount").val(l),$("#taxCalculated").val((l*a).toFixed(2))}function checkCurrency1(e,a){var t=/^\d+(?:\.\d{0,2})$/,l=/^[0-9]*$/;t.test(a)||l.test(a)||(e.value=previousValue,t.test(previousValue)||(e.value="0"))}$(function(){setInterval(function(){timeChange()},1e3),feeDetails(),1==$("#feeDetailTable tr").length&&($(".hide-fee-detail").hide(),$(".show-fee-detail").show())});var taxValue,previousValue,specialKeys=new Array;specialKeys.push(8);