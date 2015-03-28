
<%@ page import="org.psvm.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-customer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list customer">

                <g:if test="${customerInstance?.name}">
                    <li class="fieldcontain">
                        <span id="name-label" class="property-label"><g:message code="customer.name.label" default="Name" /></span>

                        <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${customerInstance}" field="name"/></span>

                    </li>
                </g:if>

                <g:if test="${customerInstance?.birthday}">
                    <li class="fieldcontain">
                        <span id="birthday-label" class="property-label"><g:message code="customer.birthday.label" default="Birthday" /></span>

                        <span class="property-value" aria-labelledby="birthday-label"><g:formatDate date="${customerInstance?.birthday}" /></span>

                    </li>
                </g:if>

                <g:if test="${customerInstance?.addressStreet}">
                    <li class="fieldcontain">
                        <span id="addressStreet-label" class="property-label"><g:message code="customer.addressStreet.label" default="Address Street" /></span>

                        <span class="property-value" aria-labelledby="addressStreet-label"><g:fieldValue bean="${customerInstance}" field="addressStreet"/></span>

                    </li>
                </g:if>

                <g:if test="${customerInstance?.addressNumber}">
				<li class="fieldcontain">
					<span id="addressNumber-label" class="property-label"><g:message code="customer.addressNumber.label" default="Address Number" /></span>
					
						<span class="property-value" aria-labelledby="addressNumber-label"><g:fieldValue bean="${customerInstance}" field="addressNumber"/></span>
					
				</li>
				</g:if>

                <g:if test="${customerInstance?.addressComplement}">
                    <li class="fieldcontain">
                        <span id="addressComplement-label" class="property-label"><g:message code="customer.addressComplement.label" default="Address Complement" /></span>

                        <span class="property-value" aria-labelledby="addressComplement-label"><g:fieldValue bean="${customerInstance}" field="addressComplement"/></span>

                    </li>
                </g:if>

				<g:if test="${customerInstance?.phoneNumber}">
				<li class="fieldcontain">
					<span id="phoneNumber-label" class="property-label"><g:message code="customer.phoneNumber.label" default="Phone Number" /></span>
					
						<span class="property-value" aria-labelledby="phoneNumber-label"><g:fieldValue bean="${customerInstance}" field="phoneNumber"/></span>
					
				</li>
				</g:if>

                <g:if test="${customerInstance?.customerOrders}">
                    <li class="fieldcontain">
                        <span id="payments-label" class="property-label"><g:message code="customer.customerOrders.label" default="Pedidos" /></span>

                        <div style="display: inline-block;">
                            <br/>
                            <g:each in="${customerInstance?.customerOrders}" var="co">
                                <ul>
                                    <li>
                                        <g:link class="create" controller="customerOrder" action="show" id="${co.id}">#${co.id}</g:link><br/>
                                        Pago: ${co.totalPaid}<br/>
                                        Pago: ${co.remainingDebt}<br/>
                                        Total: ${co.amount}
                                    </li>
                                </ul>
                            </g:each>
                        </div>
                    </li>
                </g:if>

			</ol>
			<g:form url="[resource:customerInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
                    <g:link class="create" controller="customerOrder" action="create" id="${customerInstance.id}"><img src="${resource(dir:'images', file:'add.png')}" alt="Adicionar pedido" /> Adicionar novo pedido</g:link>
					<g:link class="edit" action="edit" resource="${customerInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
