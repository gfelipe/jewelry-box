
<%@ page import="org.psvm.Payment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-payment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-payment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list payment">
			
				<g:if test="${paymentInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="payment.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${paymentInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="payment.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${paymentInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentInstance?.datePaid}">
				<li class="fieldcontain">
					<span id="datePaid-label" class="property-label"><g:message code="payment.datePaid.label" default="Date Paid" /></span>
					
						<span class="property-value" aria-labelledby="datePaid-label"><g:formatDate date="${paymentInstance?.datePaid}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentInstance?.installment}">
				<li class="fieldcontain">
					<span id="installment-label" class="property-label"><g:message code="payment.installment.label" default="Installment" /></span>
					
						<span class="property-value" aria-labelledby="installment-label"><g:fieldValue bean="${paymentInstance}" field="installment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentInstance?.order}">
				<li class="fieldcontain">
					<span id="order-label" class="property-label"><g:message code="payment.order.label" default="Order" /></span>
					
						<span class="property-value" aria-labelledby="order-label"><g:link controller="customerOrder" action="show" id="${paymentInstance?.order?.id}">${paymentInstance?.order?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:paymentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${paymentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
