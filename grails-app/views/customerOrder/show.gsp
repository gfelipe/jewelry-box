
<%@ page import="org.psvm.CustomerOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customerOrder.label', default: 'CustomerOrder')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-customerOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-customerOrder" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list customerOrder">

                <g:if test="${customerOrderInstance?.customer}">
                    <li class="fieldcontain">
                        <span id="customer-label" class="property-label"><g:message code="customerOrder.customer.label" default="Customer" /></span>

                        <span class="property-value" aria-labelledby="customer-label"><g:link controller="customer" action="show" id="${customerOrderInstance?.customer?.id}">${customerOrderInstance?.customer?.name}</g:link></span>

                    </li>
                </g:if>

                <g:if test="${customerOrderInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="customerOrder.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${customerOrderInstance}" field="amount"/></span>
					
				</li>
				</g:if>

				<g:if test="${customerOrderInstance?.installment}">
				<li class="fieldcontain">
					<span id="installment-label" class="property-label"><g:message code="customerOrder.installment.label" default="Installment" /></span>
					
						<span class="property-value" aria-labelledby="installment-label"><g:fieldValue bean="${customerOrderInstance}" field="installment"/></span>
					
				</li>
				</g:if>

				<g:if test="${customerOrderInstance?.purchaseDate}">
				<li class="fieldcontain">
					<span id="purchaseDate-label" class="property-label"><g:message code="customerOrder.purchaseDate.label" default="Purchase Date" /></span>

						<span class="property-value" aria-labelledby="purchaseDate-label"><g:formatDate date="${customerOrderInstance?.purchaseDate}" type="date" /></span>

				</li>
				</g:if>

                <li class="fieldcontain">
                    <span id="totalPaid-label" class="property-label">Total Pago</span>
                    <span class="property-value" aria-labelledby="totalPaid-label">
                        ${customerOrderInstance?.totalPaid}
                    </span>
                </li>

                <li class="fieldcontain">
                    <span id="purchaseDate-label" class="property-label">Falta pagar</span>
                    <span class="property-value" aria-labelledby="purchaseDate-label">
                        ${customerOrderInstance?.remainingDebt}
                    </span>
                </li>

                <g:if test="${customerOrderInstance?.payments}">
                    <li class="fieldcontain">
                        <span id="payments-label" class="property-label"><g:message code="customerOrder.payments.label" default="Payments" /></span>

                        <div style="display: inline-block;">
                            <br/>
                            <g:each in="${customerOrderInstance.payments}" var="p">
                                <ul>
                                    <li>
                                        Data: <g:formatDate date="${p?.dateCreated}" type="date" /><br/>
                                        Valor: ${p.amount}
                                    </li>
                                </ul>
                            </g:each>
                        </div>
                    </li>
                </g:if>

                <g:if test="${customerOrderInstance?.products}">
                    <li class="fieldcontain">
                        <span id="products-label" class="property-label"><g:message code="customerOrder.products.label" default="Produtos" /></span>

                        <div style="display: inline-block;">
                            <br/>
                            <g:each in="${customerOrderInstance.products}" var="p">
                                <ul>
                                    <li>
                                        Data: <g:formatDate date="${p?.dateCreated}" type="date" /><br/>
                                        Valor: ${p.amount}
                                    </li>
                                </ul>
                            </g:each>
                        </div>
                    </li>
                </g:if>

			</ol>
			<g:form url="[resource:customerOrderInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
                    <g:link class="create" controller="payment" action="create" id="${customerOrderInstance.id}"><img src="${resource(dir:'images', file:'add.png')}" alt="Adicionar pagamento" /> Adicionar pagamento</g:link>
					<g:link class="edit" action="edit" resource="${customerOrderInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
