<%@ page import="org.psvm.CustomerOrder" %>

    <script>
        $(function(){

            var result = [
                    {
                        "value": "Anel de prata",
                        "data": {
                            "class": "org.psvm.Product",
                            "id": 1,
                            "code": "25",
                            "defaultPrice": 10,
                            "name": "Anel de prata",
                            "picture": [],
                            "salePrice": 1,
                            "stockQuantity": 3,
                            "type": {
                                "enumType": "org.psvm.Product$ProductType",
                                "name": "RING"
                            }
                        }
                    },
                    {
                        "value": "Anel de ouro",
                        "data": {
                            "class": "org.psvm.Product",
                            "id": 2,
                            "code": "22",
                            "defaultPrice": 10,
                            "name": "Anel de ouro",
                            "picture": [],
                            "salePrice": 1,
                            "stockQuantity": 3,
                            "type": {
                                "enumType": "org.psvm.Product$ProductType",
                                "name": "RING"
                            }
                        }
                    }
                ];

            var autocompleteOptions = { dataType: 'jsonp', width: 400, minChars: 2, autoSelectFirst: false, triggerSelectOnValidInput: false,
                lookup: function (query, done) {
                    $.ajax({
                        url: '/jewelsApp/product/autocomplete?query=' + query,
                        type: 'GET',
                        dataType: 'json',
                        async: 'false'
                    }).done(function(result){
                        done(result);
                    });
                },
                onSelect: function (product) {
                    console.log('onselect');console.log(product);
                    addProduct(product.data);
                }
            };

            $('#productSearch').autocomplete(autocompleteOptions);

            $(document.body).on('click', '.remove', function(e){
                console.log('BEPBLABLAPBSK');
                e.preventDefault();
                $(this).parent().remove();
            });

        });

        function addProduct(product) {
            console.log(product);
            var productInfo = $('.productInfo').clone().removeClass('productInfo').show().prependTo('#products');
            productInfo.find('input[type=hidden]').val(product.id);
            productInfo.find('label').html(product.name);
        }
    </script>

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

<div class="fieldcontain">
    <label for="firstIncome">
        Buscar produtos
    </label>

    <g:field type="text" name="productSearch" />
    <div id="products"></div>
</div>

<div class="hidden productInfo">
    <label></label>
    <g:hiddenField name="productId" />
    <button class="remove">Remover</button>
</div>