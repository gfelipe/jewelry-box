
<%@ page import="org.psvm.Payment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-payment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-payment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="amount" title="${message(code: 'payment.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'payment.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="datePaid" title="${message(code: 'payment.datePaid.label', default: 'Date Paid')}" />
					
						<g:sortableColumn property="installment" title="${message(code: 'payment.installment.label', default: 'Installment')}" />
					
						<th><g:message code="payment.order.label" default="Order" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${paymentInstanceList}" status="i" var="paymentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${paymentInstance.id}">${fieldValue(bean: paymentInstance, field: "amount")}</g:link></td>
					
						<td><g:formatDate date="${paymentInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${paymentInstance.datePaid}" /></td>
					
						<td>${fieldValue(bean: paymentInstance, field: "installment")}</td>
					
						<td>${fieldValue(bean: paymentInstance, field: "order")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${paymentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
