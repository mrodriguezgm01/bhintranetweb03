/*
 * Funciones Comunes para la APP. 
 */

function resizeTable(idTable) {
	var elementTable = $("#" + idTable);
	if (elementTable) {
		var newWidth = elementTable.closest(".ui-jqgrid").parent().width();
		elementTable.jqGrid("setGridWidth", newWidth, true);
	}
}

function initDateTimePicker(idDateElement, eventName, handlerMethod) {
	var elementDate = $("#" + idDateElement);
	if (elementDate) {
		elementDate.datetimepicker({
		    locale: "es",
		    format: "DD/MM/YYYY"
		}).on(eventName, handlerMethod);
	}
}

function initDateTimePickerWithDefaultDate(idDateElement, eventName, handlerMethod, dateDefault) {
	var elementDate = $("#" + idDateElement);
	if (elementDate) {
		elementDate.datetimepicker({
			defaultDate: dateDefault,
			locale: "es",
		    format: "DD/MM/YYYY"
		}).on(eventName, handlerMethod);
	}
}
//return date.valueOf() > maxDate.valueOf() ? 'disabled' : '';
function initDateTimePickerWithMaxDate(idDateElement, eventName, eventNameIE, handlerMethod, maxDateString) {
	var elementDate = $("#" + idDateElement);
	if (elementDate) {
		if (isBrowserInternetExplorer()) {
			var maxDate = new Date(maxDateString);
			elementDate.datepicker({	
				locale: "es",
				format: "dd/mm/yyyy",
				onRender: function(date) {
					return parseInt(date.valueOf()) > parseInt(maxDate.valueOf()) ? 'disabled' : '';
				}
			}).on(eventNameIE, handlerMethod);
		}
		else {
			elementDate.datetimepicker({
				maxDate: maxDateString,
				locale: "es",
				format: "DD/MM/YYYY"
			}).on(eventName, handlerMethod);
		}
	}
}

function initDateTimePickerWithDefaultMaxDate(idDateElement, eventName, handlerMethod, defaultDate, maxDate) {
	var elementDate = $("#" + idDateElement);
	if (elementDate) {
		elementDate.datetimepicker({
			defaultDate: defaultDate,
			maxDate: maxDate,
			locale: "es",
		    format: "DD/MM/YYYY"
		}).on(eventName, handlerMethod);
	}
}

function initDateTimePickerWithDefaultMinDateMaxDate(idDateElement, eventName, handlerMethod, defaultDate, minDate, maxDate) {
	var elementDate = $("#" + idDateElement);
	if (elementDate) {
		elementDate.datetimepicker({
			defaultDate: defaultDate,
			minDate: minDate,
			maxDate: maxDate,
			locale: "es",
		    format: "DD/MM/YYYY"
		}).on(eventName, handlerMethod);
	}
}

function initDateTimeOnlyHourLocalTime(idDateElement, eventName, handlerMethod) {
	var elementDate = $("#" + idDateElement);
	if (elementDate) {
		elementDate.datetimepicker({
		    format: "LT"
		}).on(eventName, handlerMethod);
	}
}

function initDateTimeOnlyHourFormat24(idDateElement, eventName, handlerMethod) {
	var elementDate = $("#" + idDateElement);
	if (elementDate) {
		if (!isBrowserInternetExplorer()) {
			elementDate.datetimepicker({
			    format: "HH:mm"
			}).on(eventName, handlerMethod);
		}
		else {
			//elementDate.bfhtimepicker("toggle");
		}
	}
}

function initDateTimePicker123(idDateElement) {
	var elementDate = $("#" + idDateElement);
	if (elementDate) {
		elementDate.datetimepicker({
			inline: true,
            sideBySide: true,
		    format: "LT"
		});
	}
}

function setDateDateTimePicker(idDateElement, valueDate) {
	var dateTimePicker = $("#" + idDateElement);
	if (dateTimePicker) {
		dateTimePicker.data("DateTimePicker").date(valueDate);
	}
}

function setMinDateDateTimePicker(idDateElement, minDate) {
	var dateTimePicker = $("#" + idDateElement);
	if (dateTimePicker) {
		dateTimePicker.data("DateTimePicker").minDate(minDate);
	}
}

function setMaxDateDateTimePicker(idDateElement, maxDate) {
	var dateTimePicker = $("#" + idDateElement);
	if (dateTimePicker) {
		dateTimePicker.data("DateTimePicker").maxDate(maxDate);
	}
}

function setDefaultDateDateTimePicker(idDateElement, defaultDate) {
	var dateTimePicker = $("#" + idDateElement);
	if (dateTimePicker) {
		dateTimePicker.data("DateTimePicker").defaultDate(defaultDate);
	}
}

function recreateDateTimePicker(idDateElement, eventName, handlerMethod, maxDateString) {
	if (!isBrowserInternetExplorer()) {
		var elementDate = $("#" + idDateElement);
		if (elementDate) {
			elementDate.datetimepicker({
				maxDate: maxDateString,
				locale: "es",
			    format: "DD/MM/YYYY"
			}).on(eventName, handlerMethod);
		}
	}
}

function destroyDateTimePicker(idDateElement) {
	if (!isBrowserInternetExplorer()) {
		var dateTimePicker = $("#" + idDateElement);
		if (dateTimePicker) {
			dateTimePicker.data("DateTimePicker").destroy();
		}
	}
}

function getCurrentDateFormatEsp() {
	
	var today = new Date();
	var dia = today.getDate();
	var mes = today.getMonth() + 1; //January is 0!
	var anio = today.getFullYear();
	
	if (dia < 10) {
		dia = "0" + dia;
	}
	
	if (mes < 10) {
		mes = "0" + mes;
	}
	
	today = dia + "/" + mes + "/" + anio;
	return today;
}

function getCurrentDateFormatEng() {
	
	var today = new Date();
	var dia = today.getDate();
	var mes = today.getMonth() + 1; //January is 0!
	var anio = today.getFullYear();
	
	if (dia < 10) {
		dia = "0" + dia;
	}
	
	if (mes < 10) {
		mes = "0" + mes;
	}
	
	today = anio + "/" + mes + "/" + dia;
	return today;
}

function formatEspDateToEngFormatDate(stringDate) {
	
	var formatDate = "";
	if (stringDate != null) {
		var arrayDate = stringDate.split("/");
		if (arrayDate.length > 2) {
			var dia = arrayDate[0];
			var mes = arrayDate[1];
			var anio = arrayDate[2];
			formatDate = anio + "/" + mes + "/" + dia;
		}
	}
	return formatDate;
}

function formatEspDateToInternationalFormatDate(stringDate) {
	
	var formatDate = "";
	if (stringDate != null) {
		var arrayDate = stringDate.split("/");
		if (arrayDate.length > 2) {
			var dia = arrayDate[0];
			var mes = arrayDate[1];
			var anio = arrayDate[2];
			formatDate = anio + "-" + mes + "-" + dia;
		}
	}
	return formatDate;
}

function formatHourToHHMM(hourString) {
	
	var formatHour = "";
	if (hourString != null) {
		var arrayHour = hourString.split(":");
		if (arrayHour.length >= 2) {
			var hora = arrayHour[0];
			var minutos = arrayHour[1];
			formatHour = hora + ":" + minutos;
		}
	}
	return formatHour;
}

function addMinutosHourFormatHHMM(hourString, numMinutos) {
	
	var hourFinal = "";
	if (hourString != null) {
		var arrayHour = hourString.split(":");
		if (arrayHour.length >= 2) {
			var hora = Number(arrayHour[0]);
			var minutos = Number(arrayHour[1]) + numMinutos;
			var cocienteOperacion = Math.floor(minutos/60);
			var restoOperacion = minutos%60;
			
			if (cocienteOperacion == 0) {
				minutos = restoOperacion;
			}
			else {
				hora += cocienteOperacion;
				minutos = restoOperacion;
			}
			
			if (hora < 10) {
				hora = "0" + hora;
			}
			
			if (minutos < 10) {
				minutos = "0" + minutos;
			}
			
			hourFinal = hora + ":" + minutos;
		}
	}
	return hourFinal;
}

function isDate1GreaterThanDate2(date1, date2) {
	//Format date1, date2: 'yyyy/mm/dd';
	//Also you can use valueOf instead getTime
	var flagIsGreater = false;
	if (new Date(date1).getTime() > new Date(date2).getTime()) {
		flagIsGreater = true;
	}
	return flagIsGreater;
}

function isDate1LowerThanDate2(date1, date2) {
	//Format date1, date2: 'yyyy/mm/dd';
	var flagIsLower = false;
	if (new Date(date1).getTime() < new Date(date2).getTime()) {
		flagIsLower = true;
	}
	return flagIsLower;
}

function isDate1EqualsThanDate2(date1, date2) {
	//Format date1, date2: 'yyyy/mm/dd';
	var flagIsEquals = false;
	if (new Date(date1).getTime() == new Date(date2).getTime()) {
		flagIsEquals = true;
	}
	return flagIsEquals;
}

function addEventElement(idElement, eventName, handlerMethod) {
	var element = $("#" + idElement);
	if (element) {
		element.on(eventName, handlerMethod);
	}
}

function addEventElementBySelector(selectorElement, eventName, handlerMethod) {
	var element = $(selectorElement);
	if (element) {
		element.on(eventName, handlerMethod);
	}
}

function removeAllEventsElement(idElement) {
	var element = $("#" + idElement);
	if (element) {
		element.off();
	}
}

function removeAllEventsElementBySelector(selectorElement) {
	var element = $(selectorElement);
	if (element) {
		element.off();
	}
}

function disabledElement(idElement) {
	var element = $("#" + idElement);
	if (element) {
		element.prop("disabled", true);
	}
}

function disabledElementBySelector(selectorElement) {
	var element = $(selectorElement);
	if (element) {
		element.prop("disabled", true);
	}
}

function enabledElement(idElement) {
	var element = $("#" + idElement);
	if (element) {
		element.prop("disabled", false);
	}
}

function getValueInputText(idElement) {
	var element = $("#" + idElement);
	var valueInputText = "";
	if (element && typeof element.val() !== "undefined") {
		valueInputText = element.val();
	}
	return valueInputText;
}

function getUpperCaseValueInputText(idElement) {
	var element = $("#" + idElement);
	var valueInputText = "";
	if (element && typeof element.val() !== "undefined") {
		valueInputText = element.val().toUpperCase();
	}
	return valueInputText;
}

function getUpperCaseValueRadioButon(nameElement){
	var element  = $('input:radio[name='+nameElement+']:checked');
	var txtRadio = "";
	if (element && typeof element.val() !== "undefined") {
		txtRadio = element.val();
	}
	return txtRadio;
}

function getTextSelect(idElement) {
	var element = $("#" + idElement + " option:selected");
	var txtSelect = "";
	if (element && typeof element.text() !== "undefined") {
		txtSelect = element.text();
	}
	return txtSelect;
}

function getUpperCaseTextSelect(idElement) {
	var element = $("#" + idElement + " option:selected");
	var txtSelect = "";
	if (element && typeof element.text() !== "undefined") {
		txtSelect = element.text().toUpperCase();
	}
	return txtSelect;
}

function getUpperCaseValueRadioButon(nameElement){
	var element  = $('input:radio[name='+nameElement+']:checked');
	var txtRadio = "";
	if (element && typeof element.val() !== "undefined") {
		txtRadio = element.val();
	}
	return txtRadio;
}

function getValueStyleElementBySelector(selectorText, specificRuleCss, property) {
	var styleValue = "";
	if (isBrowserInternetExplorer()) {
		styleValue = getValuePropertyOfRuleStyle(specificRuleCss);
		if (styleValue != "") {
			styleValue = trimText(styleValue.toLowerCase());
			property = property.toLowerCase() + ":";
			var flagContainProperty = styleValue.indexOf(property);
			if (flagContainProperty >= 0) {
				var styleValueArray = styleValue.split(property);
				if (styleValueArray.length > 1) {
					var styleValueArrayAuxiliar = styleValueArray[1].split(";");
					if (styleValueArrayAuxiliar.length > 0) {
						styleValue = trimText(styleValueArrayAuxiliar[0]);
					}
				}
			}
		}
	}
	else {
		var element = $(selectorText);
		if (element) {
			styleValue = element.css(property);
		}
	}
	return styleValue;
}

function getValuePropertyOfRuleStyle(specificRuleCss) {
	//Tener en cuenta que IE modifica el orden de las reglas
	//.container.generalModalContainer ---> .generalModalContainer.container
	var styleSheetArray = document.styleSheets;
	var cssText = "";
	for (var i = 0; i < styleSheetArray.length; i++) {
		var mySheet = document.styleSheets[i];
		var myRules = mySheet.cssRules ? mySheet.cssRules : mySheet.rules;
		for (var j = 0; j < myRules.length; j++) {
			if (typeof myRules[j].selectorText !== "undefined" && myRules[j].selectorText.toLowerCase() == specificRuleCss.toLowerCase()) {
				cssText = (myRules[j].cssText) ? myRules[j].cssText : myRules[j].style.cssText;
				return cssText;
			}
		}
	}
	return cssText;
}

function getStyleDocument(className) {
	var classes = document.styleSheets[0].rules || document.styleSheets[0].cssRules;
	for (var x = 0; x < classes.length; x++) {
		if (classes[x].selectorText == className) {
			(classes[x].cssText) ? alert(classes[x].cssText) : alert(classes[x].style.cssText);
		}
	}
}

function getDataAttributeSelect(idElement, attributeElement) {
	var selectElement = document.getElementById(idElement);
	var dataAttribute = "";
	if (selectElement) {
		dataAttribute = selectElement.options[selectElement.selectedIndex].getAttribute(attributeElement);
	}
	return dataAttribute;
}

function setTituloPage(tituloPage) {
	$(document).attr("title", tituloPage);
}

function setValueInputText(idElement, textValue) {
	var element = $("#" + idElement);
	if (element) {
		element.val(textValue);
	}
}

function setTextLabel(idElement, textValue) {
	var element = $("#" + idElement);
	if (element) {
		element.text(textValue);
	}
}

function setHtmlElement(idElement, htmlText) {
	var element = $("#" + idElement);
	if (element) {
		element.html(htmlText);
	}
}

function setStyleElement(idElement, property, valueProperty) {
	var element = $("#" + idElement);
	if (element) {
		element.css(property, valueProperty);
	}
}

function setValueCheckbox(idElement, value) {
	var element = $("#" + idElement);
	if (element) {
		element.prop("checked", value);
	}
}

function removeClassByClass(classElement, classRemove) {
	var element = $("." + classElement);
	if (element) {
		element.removeClass(classRemove);
	}
}

function showElement(idElement) {
	var element = $("#" + idElement);
	if (element) {
		element.css("display", "block");
	}
}

function showElementByClass(classElement) {
	var element = $("." + classElement);
	if (element) {
		element.css("display", "block");
	}
}

function hideElement(idElement) {
	var element = $("#" + idElement);
	if (element) {
		element.css("display", "none");
	}
}

function hideElementByClass(classElement) {
	var element = $("." + classElement);
	if (element) {
		element.css("display", "none");
	}
}

function consoleBrowser(consoleText) {
	if (window.console && window.console.log) {
		console.log(consoleText);
	}
}

function trimText(textValue) {
	if (textValue != null) {
		return textValue.replace(/^\s+|\s+$/g, '');
	}
}

function redondearNumeros(numeroDecimales, numero) {
	var numeroRedondeado = Math.round(numero*Math.pow(10, numeroDecimales))/Math.pow(10, numeroDecimales);
	return numeroRedondeado;
}

var validarCharacterNumeric = function(event) {
	var keyCode = window.event ? event.keyCode : event.which;
	
	if (keyCode == 8 || (keyCode >= 48 && keyCode <= 57)) {
		return true;
	}
	
	return false;
}

var validarCharacterAlfanumeric = function(event) {
	var keyCode = window.event ? event.keyCode : event.which;
	if (keyCode == 8 || keyCode == 241 || (keyCode >= 48 && keyCode <= 57) || (keyCode >= 65 && keyCode <= 90) || (keyCode >= 97 && keyCode <= 122)) {
		return true;
	}
	return false;
}

var validarCharacterAlfanumericWithEspacio = function(event) {
	var keyCode = window.event ? event.keyCode : event.which;
	if (keyCode == 8 || keyCode == 241 || keyCode == 32 || (keyCode >= 48 && keyCode <= 57) || (keyCode >= 65 && keyCode <= 90) || (keyCode >= 97 && keyCode <= 122)) {
		return true;
	}
	return false;
}

var validarCharacterCurrency = function(event) {
	var keyCode = window.event ? event.keyCode : event.which;
	if (keyCode == 8 || keyCode == 46 || (keyCode >= 48 && keyCode <= 57)) {
		return true;
	}
	return false;
}

var validarCharacterHour = function(event) {
	var keyCode = window.event ? event.keyCode : event.which;
	if (keyCode == 8 || (keyCode >= 48 && keyCode <= 58)) {
		return true;
	}
	return false;
}

var validarCharacterDate = function(event) {
	var keyCode = window.event ? event.keyCode : event.which;
	if (keyCode == 8 || (keyCode >= 47 && keyCode <= 57)) {
		return true;
	}
	return false;
}

var validarCharacterDestino = function(event) {
	var keyCode = window.event ? event.keyCode : event.which;
	if (keyCode == 8 || keyCode == 241 || keyCode == 32 || keyCode == 45 || (keyCode >= 48 && keyCode <= 57) || (keyCode >= 65 && keyCode <= 90) || (keyCode >= 97 && keyCode <= 122)) {
		return true;
	}
	return false;
}

var validarCharacterTextArea = function(event) {
	var keyCode = window.event ? event.keyCode : event.which;
	if (keyCode == 13) {
		return false;
	}
	return true;
}

function isValidoFormatDate(valueDate) {
	var formatDate = /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/;
	var isValid = formatDate.test(valueDate);
	if (isValid && (valueDate.indexOf("-") > -1)) {
		isValid = false;
	}
    return isValid;
}

function isValidoFormatHour(valueHour) {
	var formatHour = /^([0-1]?[0-9]|2[0-3]):([0-5][0-9])(:[0-5][0-9])?$/;
	var isValid = formatHour.test(valueHour);
	if (isValid && valueHour.length != 5) {
		isValid = false;
	}
    return isValid;
}

function isValidoFormatYear(valueYear) {
	var formatYear = /^([0-9][0-9][0-9][0-9])?$/;
	var isValid = formatYear.test(valueYear);
    return isValid;
}

function setCookie(c_name, value) {
	
	var exdate = new Date();
	var time = exdate.getTime();
	
	if(value != null) {
		time = time + 3600000;
	}
	else {
		time = time - 3600000;
	}
	exdate.setTime(time);
	//var c_value = escape(value) + "; expires=" + exdate.toUTCString() + "; domain=" + document.domain + "; path=/";
	var c_value;
	c_value = escape(value) + "; expires=" + exdate.toUTCString() + contextPathUrl + "/";
	document.cookie = c_name + "=" + c_value;
}

function getCookie(c_name) {
	
	var i,x,y,ARRcookies = document.cookie.split(";");
	for (i=0; i < ARRcookies.length; i++) {
		x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
		y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
		x = x.replace(/^\s+|\s+$/g,"");
		if (x == c_name) {
			return unescape(y);
		}
	}
	return null;
}

function deleteCookie(key) {
	setCookie(key, null);
}

function obtenerHeightJqGridDiv(heightJqGrid, numRowsTituloTable, flagWithTituloJqGrid) {
	
	var heightJqGridTotal = heightJqGrid;
	var heightAdicionalJqGrid = 64;
	var heightTituloJqGrid = 33;
	
	if (numRowsTituloTable == 1 || numRowsTituloTable == 2) {
		heightAdicionalJqGrid = 64 + 5*(numRowsTituloTable - 1); //Este factor solo funciona para 1 y 2
	}
	heightJqGridTotal += heightAdicionalJqGrid;
	
	if (flagWithTituloJqGrid) {
		heightJqGridTotal += heightTituloJqGrid;
	}
	
	return heightJqGridTotal;
}

function isVerticalScrollbarVisible() {
	var flagVisible = false;
	var heightBody = $("body").height();
	var heightWindows = $(window).height();
	if (heightBody > heightWindows) {
		flagVisible = true;
	}
	return flagVisible;
}

function isBrowserInternetExplorer() {
	var flagIsInternetExplorer = false;
	var userAgentClient = navigator.userAgent;
	var patronNavegador = new Array();
	patronNavegador[0] = /MSIE/;
	
	if (patronNavegador[0].test(userAgentClient)) {
		flagIsInternetExplorer = true;
	}
	return flagIsInternetExplorer;
}

function removeDuplicateComponents() {
	if (isBrowserInternetExplorer()) {
		var elementsHtml = getElementsByClassName("divHtml5ComponentGeneralClass");
		if (elementsHtml) {
			for (var x = 0; x < elementsHtml.length; x++) {
				var elementHtml = elementsHtml[x];
				if (elementHtml && elementHtml.parentNode) {
					elementHtml.parentNode.removeChild(elementHtml);
				}
			}
		}
		removeClassByClass("divIeComponentGeneralClass", "divIeComponentGeneralClass");
	}
	else {
		$(".divIeComponentGeneralClass").remove();
	}
}

function removeClassCheckbox() {
	if (!isBrowserInternetExplorer()) {
		var element = $(".checkboxSelectAllDivClase .checkboxSelectAllInputClase.checkboxIeComponentGeneralClase");
		if (element) {
			element.removeClass("checkboxIeComponentGeneralClase");
		}
	}
}

function showTooltip() {
	var element = $("[data-toggle='tooltip']");
	if (element) {
		element.tooltip();
	}
}

function getElementsByClassName(className) {
	//classname: divHtml5ComponentGeneralClass
	//Nota: el compilador tienen problemas despues de 580 lines aprox.
	//IE9: document.getElementsByClassName("divHtml5ComponentGeneralClass");
    var elements = [];
    var re = new RegExp("(^| )" + className + "( |$)");
    var els = document.body.getElementsByTagName("*");
    for (var i = 0, j = els.length; i < j; i++) {
		if (re.test(els[i].className)) {
			elements.push(els[i]);
		}
	}
    return elements;
}

function triggerResizeEvent() {
	if (!isBrowserInternetExplorer()) {
		setTimeout(function() {
			window.dispatchEvent(new Event("resize"));
		}, 500);
	}
	else {
		setTimeout(function() {
			$(window).trigger("resize");
		}, 500);
	}
}

function sendPost(idName, urlController, action, valueVariableSendPost, text) {
	var  formEnvio = "<form id='"+idName+"'  name='"+idName+"'  method='POST' action='"+urlController+".htm'>" +
	"<input type='hidden' name='action' id='action' value='"+action+"'></input>"+
	"<input type='hidden' name='variableSendPost' id='variableSendPost' value='"+valueVariableSendPost+"'></input>"+
	"<a class=\"jqGridGeneralLinkClass\" onclick=\"javascript:clickSendPost('"+idName+"');\">"+text+"</a></form>";
	return formEnvio;
}

function clickSendPost(idName){
	$("#"+idName).submit();
}

function initSelectOption(idSelect, optionPosicion){
	$("#"+idSelect).prop("selectedIndex",optionPosicion);
}

function setSelectValueOption(idSelect, Text){
	$("#"+idSelect).val(Text);
}

function  sendPostImprimir(idName, url, action ,variableSendPost, text){
	var  formEnvio = "<form id='"+idName+"'  name='"+idName+"'  method='POST' action='"+url+".htm'>" +
	"<input type='hidden' name='action' id='action' value='"+action+"'></input>"+
	"<input type='hidden' name='variableImprimirSendPost' id='variableImprimirSendPost' value='"+variableSendPost+"'></input>"+
	"<a class=\"jqGridGeneralLinkClass\" onclick=\"javascript:clickEventImprimir('"+idName+"');\"><img src='/a/imagenes/lupa.png' width='24px' height='25px' ></a></form>";
	return formEnvio;
}

function clickEventImprimir(idName){
	$("#"+idName).submit();
}

