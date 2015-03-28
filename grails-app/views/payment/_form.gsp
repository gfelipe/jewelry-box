<%@ page import="org.psvm.Payment" %>



<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="payment.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: paymentInstance, field: 'amount')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'datePaid', 'error')} required">
	<label for="datePaid">
		<g:message code="payment.datePaid.label" default="Date Paid" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="datePaid" precision="day"  value="${paymentInstance?.datePaid}"  />

</div>

<g:hiddenField name="customerOrder" value="${paymentInstance.customerOrder.id}" />