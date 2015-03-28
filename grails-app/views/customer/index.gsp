
<%@ page import="org.psvm.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-customer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

                        <g:sortableColumn property="name" title="${message(code: 'customer.name.label', default: 'Name')}" />

                        <g:sortableColumn property="addressNumber" title="${message(code: 'customer.addressNumber.label', default: 'Address Number')}" />
					
						<g:sortableColumn property="addressStreet" title="${message(code: 'customer.addressStreet.label', default: 'Address Street')}" />
					
						<g:sortableColumn property="birthday" title="${message(code: 'customer.birthday.label', default: 'Birthday')}" />

                        <g:sortableColumn property="addressComplement" title="${message(code: 'customer.addressComplement.label', default: 'Address Complement')}" />

						<g:sortableColumn property="phoneNumber" title="${message(code: 'customer.phoneNumber.label', default: 'Phone Number')}" />

                        <th>Criar Pedido</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${customerInstanceList}" status="i" var="customerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${customerInstance.id}">${fieldValue(bean: customerInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: customerInstance, field: "addressNumber")}</td>
					
						<td>${fieldValue(bean: customerInstance, field: "addressStreet")}</td>
					
						<td><g:formatDate date="${customerInstance.birthday}" /></td>
					
						<td>${fieldValue(bean: customerInstance, field: "addressComplement")}</td>
					
						<td>${fieldValue(bean: customerInstance, field: "phoneNumber")}</td>

                        <td><a href="${createLink(controller: 'customerOrder', action: 'create', id: customerInstance.id)}">x</a></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${customerInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
