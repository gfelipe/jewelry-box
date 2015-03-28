<%@ page import="org.psvm.Customer" %>



<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="customer.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" required="" value="${customerInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'birthday', 'error')} required">
    <label for="birthday">
        <g:message code="customer.birthday.label" default="Birthday" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="birthday" precision="day"  value="${customerInstance?.birthday}" relativeYears="[0..-150]" />

</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'addressStreet', 'error')}">
	<label for="addressStreet">
		<g:message code="customer.addressStreet.label" default="Address Street" />
	</label>
	<g:textField name="addressStreet" value="${customerInstance?.addressStreet}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'addressNumber', 'error')}">
    <label for="addressNumber">
        <g:message code="customer.addressNumber.label" default="Address Number" />
    </label>
    <g:textField name="addressNumber" value="${customerInstance?.addressNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'addressComplement', 'error')}">
    <label for="addressComplement">
        <g:message code="customer.addressComplement.label" default="Address Complement" />
    </label>
    <g:textField name="addressComplement" value="${customerInstance?.addressComplement}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'phoneNumber', 'error')}">
	<label for="phoneNumber">
		<g:message code="customer.phoneNumber.label" default="Phone Number" />
	</label>
	<g:textField name="phoneNumber" value="${customerInstance?.phoneNumber}"/>

</div>