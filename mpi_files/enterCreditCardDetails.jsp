<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" errorPage="/error.jsp"%>
<jsp:useBean id="transactionDetails" scope="request" type="com.creditguard.common.transactions.TransactionDetails" />
<%@ page import="java.text.DecimalFormat" %>
<%@ include file="/merchantPages/ResponsiveWebSources/includes/main.jsp" %>
<%! DecimalFormat formatter = new DecimalFormat("0.00"); %>
<%
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=9">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="expires" content="-1">
<script src="merchantPages/ResponsiveWebSources/js/<%=lang%>.js"></script>
<script src="merchantPages/ResponsiveWebSources/js/main.js"></script>
<meta name="viewport" content="width=device-width">
<link href="merchantPages/ResponsiveWebSources/css/normalize.css" rel="stylesheet" type="text/css" />
<link href="merchantPages/ResponsiveWebSources/css/grid.css" rel="stylesheet" type="text/css" />
<link href="merchantPages/ResponsiveWebSources/css/responsive.main.rtl.css" rel="stylesheet" type="text/css" />
<%=responsiveEngCSS%>
<link href="merchantPages/myname/css/cgdesign.css" rel="stylesheet" type="text/css" />
<title><%=pageTitle%></title>
</head>
<body onload="onLoad();">
<div id="main-container" class="container">
<div class="grid_12 row2 sep"></div>
<div class="inner-container">
<div class="grid_12 row2 sep"></div>
<form id="creditForm" onsubmit="return validateFormTrack2CardNo();" method="POST" action="ProcessCreditCard">
<input type="hidden" name="txId" value="<%=mpiTxnId%>" />
<input type="hidden" name="lang" value="<%=lang%>" />
<input type="hidden" name="cardNumber" id="cardNumber" value="" autocomplete="off" />
<input type="hidden" name="track2" id="track2" value="" autocomplete="off" />
<input type="hidden" name="last4d" value="" autocomplete="off" />
<input type="hidden" name="transactionCode" value="Phone" autocomplete="off" />
<input type="hidden" id="listPaymentsInterestValues" name="listPaymentsInterestValues" value="<%=listPaymentsInterestValues%>" />
<input type="hidden" id="listNumberOfPaymentsValues" name="listNumberOfPaymentsValues" value="<%=listNumberOfPaymentsValues%>" />
<div>
<div class="grid_12 row3 td_style_1">
<%=paymentDetails%>
</div>
<div class="grid_12 row4">
<div class="grid_1 row4 td_style_fieldName">
<%=DynamicPaymentAmount%>:
</div>
<div id="amount" class="grid_3 row4 td_style_fieldValue">
<%=amountForDisplay%> <%=currency%>
</div>
<div class="hidden_fields">
<div class="responsive_page_line_break"></div>
<div class="grid_1 row4 td_style_fieldName">
<%=paymentCEmail%>:
</div>
<div class="grid_3 row4 td_style_fieldValue responsive_value_field_width_limit">
<%=customerEmail%>
</div>
<div class="grid_12 row5">
<div class="grid_1 row5 td_style_fieldName">
<%=paymentCurrency%>:
</div>
<div class="grid_3 row5 td_style_fieldValue">
<%=currency%>
</div>
<div class="responsive_page_line_break"></div>
<div class="grid_1 row5 td_style_fieldName">
<%=paymentOrderId%>:
</div>
<div class="grid_3 row5 td_style_fieldValue responsive_value_field_width_limit">
<%=orderId%>
</div>
</div>
<div class="grid_12 row6">
<div class="grid_1 row6 td_style_fieldName">
<%=paymentDesc%>:
</div>
<div class="grid_8 row6 td_style_fieldValue responsive_value_field_width_limit">
<%=description%>
</div>
</div>
<div class="grid_12 row7 td_style_1">
<%=CCDetails%>
</div>
</div>
</div>
<div class="grid_12 row8">
<div class="grid_1 row8 td_style_fieldName">
<%=CCNumber%>:
</div>
<div class="grid_8 row8 td_style_fieldValue card-number">
<input type="text" id="Track2CardNo" name="Track2CardNo" maxlength="80" width="100%" dir="ltr" autocomplete="off" onkeyup="limitInput(this,80)" onchange="return validateTrack2CardNo();" disabled />
</div>
<div class="grid_4 row8 td_style_invalidField invalid_field_place_holder">&nbsp;</div>
<div class="grid_8 row8 td_style_invalidField" id="invalidCardNumber">&nbsp;</div>
<div class="grid_4 row8 td_style_invalidField invalid_field_place_holder">&nbsp;</div>
<div class="grid_8 row8 td_style_invalidField" id="invalidTrack2">&nbsp;</div>
</div>
<div class="grid_12 row9 date-section">
<div class="grid_1 row9 td_style_fieldName">
<%=CCExp%>:
</div>
<div class="grid_8 row9 td_style_fieldValue">
<select id="expYear" class="expYear" name="expYear" onchange="validateExpDateOnChange();" disabled >
<%=expYear%>
</select>
-
<select id="expMonth" class="expMonth" name="expMonth" onchange="validateExpDateOnChange();" disabled >
<option value=""></option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
</select>
</div>
<div class="grid_1 row9 invalid_field_place_holder">&nbsp;</div>
<div class="grid_8 row9 td_style_invalidField" id="invalidCardExp">&nbsp;</div>
</div>
<div class="grid_12 row10">
<div class="grid_1 row10 td_style_fieldName">
CVV:
</div>
<div class="grid_8 row10 td_style_fieldValue">
<input type="text" pattern="[0-9]*" name="cvv" id="cvv"  class="cvv-form" maxlength="4" style="width: 50px;" dir="ltr" autocomplete="off" onkeyup="limitInput(this,4)" onchange="return validateCvv();" disabled />
<span id="qm" class="cvv-help" onmouseover="showHideCVVhelp();" onmouseout="showHideCVVhelp();" style="cursor:pointer;"/>?</span>
<div id="CVVhelp" style="display: none; position: absolute; border: 1px #cccccc solid; padding: 10px; background: white;">
<img src="merchantPages/ResponsiveWebSources/images/cvv.jpg" />
</div>
</div>
<div class="grid_4 row10 td_style_invalidField invalid_field_place_holder">&nbsp;</div>
<div class="grid_8 row10 td_style_invalidField" id="invalidCvv">&nbsp;</div>
</div>
<div class="grid_12 row12">
<div class="grid_1 row12 td_style_fieldName">
<%=CCPId%>:
</div>
<div class="grid_8 row12 td_style_fieldValue id-customer">
<input type="text" pattern="[0-9]*" id="personalId" name="personalId" maxlength="9" dir="ltr" autocomplete="off" onkeyup="limitInput(this,9)" onchange="return validatePersonalId()" disabled />
</div>
<div class="grid_4 row12 td_style_invalidField invalid_field_place_holder">&nbsp;</div>
<div class="grid_8 row12 td_style_invalidField" id="invalidPersonalId">&nbsp;</div>
</div>
<div id="divPayments" style="display:<%=showPayments%>"; >
<div class="grid_12 rowPayments first-row-payment";>
<div class="grid_4 rowPayments td_style_fieldPayments td_style_fieldName"><%=numberOfPaymentsLabel%></div>
<div class="grid_3 rowPayments td_style_fieldValue td-number-of-payment">
<%=NumberOfPaymentvalue%>
<select id="numberOfPayments" class="numberOfPayments" name="numberOfPayments" style="display:<%=showSelectNumberOfPayments%>" onchange=<%=onchangeNumberOfPayments%>>
<%=NumberOfPaymentsOptions%>
</select>
</div>
<div class="grid_12 row12 td_style_invalidField" style="width: 100%;" id="invalidNumberOfPayments">&nbsp;</div>
</div>
<div class="grid_12 rowPayments"  style="display:<%=showFirstAndPeriodicalPayment%>"; >
<div class="grid_4 rowPayments td_style_fieldPayments td_style_fieldName"><%=FirstPaymentLabel%></div>
<div class="grid_2 rowPayments td_style_fieldValue td_style_steps_payment">
<div id="firstPaymentDisp" class="data_style_payment" disabled="disabled" ><%=getFirstPayment()%></div>
</div>
<div class="responsive_page_line_break"></div>
<div class="grid_4 rowPayments td_style_fieldPayments td_style_fieldName"><%=periodicalPaymentLabel%></div>
<div class="grid_2 rowPayments td_style_fieldValue td_style_steps_payment">
<div id="periodicalPaymentDisp" class="data_style_payment" disabled="disabled" ><%=getPeriodicalPayment()%></div>
</div>
</div>
<div class="grid_12 rowPayments" style="display:<%=showPaymentsInterest%>">
<div class="responsive_page_line_break"></div>
<div class="grid_4 rowPayments td_style_fieldPayments"><%=paymentsInterestLabel%></div>
<div class="grid_2 rowPayments td_style_fieldValue">
<div id="paymentsInterestDisp" disabled="disabled" class="data_style_payment" ><%=paymentsInterest%></div>
</div>
</div>
</div>
<div id="form_buttons" class="grid_12 row13 td_style_fieldValue form_buttons">
<%=getCancelBtnHTML("Cancel")%>
<input type="submit" id="submitBtn" class="submitBtn" value="<%=formSend%>" disabled />
</div>
</div>
</form>
<%=getPayPalHTML()%>
<div id="loading" class="loading_invisible"><p id="loadingMsg" class="loading_invisible"></p></div>
<div class="grid_12 row14 pci-images-wrapper" height="100%" style="max-height: 3em;">
<img class="row14 pci_image" src="merchantPages/myname/images/gotrust.jpg" alt="gotrust logo" title="gotrust logo"/>
<img class="row14 pci_image" src="merchantPages/myname/images/MaterCard.jpg" alt="master card logo" title="master card logo"/>
<img class="row14 pci_image" src="merchantPages/myname/images/Visa.jpg" alt="visa logo" title="visa logo"/>
<img class="row14 pci_image" src="merchantPages/myname/images/Pci.jpg" alt="pci logo" title="pci logo"/>
</div>
</div>
</div>
</body>
</html>
