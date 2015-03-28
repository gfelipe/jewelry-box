<%@ page import="org.psvm.CustomerOrder" %>



<div class="fieldcontain ${hasErrors(bean: customerOrderInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="customerOrder.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: customerOrderInstance, field: 'amount')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: customerOrderInstance, field: 'customer', 'error')} required">
	<label for="customer">
		<g:message code="customerOrder.customer.label" default="Customer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="customer" name="customer.id" from="${org.psvm.Customer.list()}" optionKey="id" optionValue="name" required="" value="${customerOrderInstance?.customer?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: customerOrderInstance, field: 'installment', 'error')} required">
	<label for="installment">
		<g:message code="customerOrder.installment.label" default="Installment" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="installment" type="number" value="${customerOrderInstance.installment}" required=""/>

</div>

<div class="fieldcontain">
	<label for="firstIncome">
		Entrada
	</label>

	<g:field name="firstIncome" type="text" />

</div>

<div class="fieldcontain ${hasErrors(bean: customerOrderInstance, field: 'purchaseDate', 'error')} required">
	<label for="purchaseDate">
		<g:message code="customerOrder.purchaseDate.label" default="Purchase Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="purchaseDate" precision="day"  value="${customerOrderInstance?.purchaseDate}"  />

</div>

