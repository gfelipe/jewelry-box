<%@ page import="org.psvm.Product" %>



<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="product.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${productInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'defaultPrice', 'error')} required">
	<label for="defaultPrice">
		<g:message code="product.defaultPrice.label" default="Default Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="defaultPrice" value="${fieldValue(bean: productInstance, field: 'defaultPrice')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="product.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${productInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'picture', 'error')} required">
	<label for="picture">
		<g:message code="product.picture.label" default="Picture" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="picture" name="picture" />

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'salePrice', 'error')} required">
	<label for="salePrice">
		<g:message code="product.salePrice.label" default="Sale Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="salePrice" value="${fieldValue(bean: productInstance, field: 'salePrice')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'stockQuantity', 'error')} required">
	<label for="stockQuantity">
		<g:message code="product.stockQuantity.label" default="Stock Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="stockQuantity" type="number" value="${productInstance.stockQuantity}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="product.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${org.psvm.Product$ProductType?.values()}" keys="${org.psvm.Product$ProductType.values()*.name()}" optionValue="friendlyName" required="" value="${productInstance?.type?.name()}" />

</div>

