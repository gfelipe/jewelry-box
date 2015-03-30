
<%@ page import="org.psvm.Product" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-product" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list product">
			
				<g:if test="${productInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="product.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${productInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.defaultPrice}">
				<li class="fieldcontain">
					<span id="defaultPrice-label" class="property-label"><g:message code="product.defaultPrice.label" default="Default Price" /></span>
					
						<span class="property-value" aria-labelledby="defaultPrice-label"><g:fieldValue bean="${productInstance}" field="defaultPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="product.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.picture}">
				<li class="fieldcontain">
					<span id="picture-label" class="property-label"><g:message code="product.picture.label" default="Picture" /></span>
					<img src="data:image/png;base64, ${productInstance?.picture.encodeAsBase64()}" alt="${productInstance?.name}" />;
				</li>
				</g:if>
			
				<g:if test="${productInstance?.salePrice}">
				<li class="fieldcontain">
					<span id="salePrice-label" class="property-label"><g:message code="product.salePrice.label" default="Sale Price" /></span>
					
						<span class="property-value" aria-labelledby="salePrice-label"><g:fieldValue bean="${productInstance}" field="salePrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.stockQuantity}">
				<li class="fieldcontain">
					<span id="stockQuantity-label" class="property-label"><g:message code="product.stockQuantity.label" default="Stock Quantity" /></span>
					
						<span class="property-value" aria-labelledby="stockQuantity-label"><g:fieldValue bean="${productInstance}" field="stockQuantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="product.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${productInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:productInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${productInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
