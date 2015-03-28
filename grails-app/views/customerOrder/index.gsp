
<%@ page import="org.psvm.CustomerOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customerOrder.label', default: 'CustomerOrder')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-customerOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-customerOrder" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="amount" title="${message(code: 'customerOrder.amount.label', default: 'Amount')}" />
					
						<th><g:message code="customerOrder.customer.label" default="Customer" /></th>
					
						<g:sortableColumn property="installment" title="${message(code: 'customerOrder.installment.label', default: 'Installment')}" />
					
						<g:sortableColumn property="paidAmount" title="${message(code: 'customerOrder.paidAmount.label', default: 'Paid Amount')}" />
					
						<g:sortableColumn property="purchaseDate" title="${message(code: 'customerOrder.purchaseDate.label', default: 'Purchase Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${customerOrderInstanceList}" status="i" var="customerOrderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${customerOrderInstance.id}">${fieldValue(bean: customerOrderInstance, field: "amount")}</g:link></td>
					
						<td>${fieldValue(bean: customerOrderInstance, field: "customer")}</td>
					
						<td>${fieldValue(bean: customerOrderInstance, field: "installment")}</td>
					
						<td>${fieldValue(bean: customerOrderInstance, field: "paidAmount")}</td>
					
						<td><g:formatDate date="${customerOrderInstance.purchaseDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${customerOrderInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
