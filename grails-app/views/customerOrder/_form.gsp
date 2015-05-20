<%@ page import="org.psvm.CustomerOrder" %>

    <script>
        $(function(){

            var autocompleteOptions = { dataType: 'jsonp', width: 400, minChars: 2, autoSelectFirst: true, triggerSelectOnValidInput: false,
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
                    addProduct(product.data);
                }
            };

            $('#productSearch').autocomplete(autocompleteOptions);

            $(document.body).on('click', '.remove', function(e){
                e.preventDefault();

                recalculateOrderTotalAmountSub(parseFloat($(this).siblings('.totalPrice').html()));
                recalculateOrderTotalAmountInputSub(parseFloat($(this).siblings('.totalPrice').html()));

                $(this).parent().remove();
            });

            $(document.body).on('click', '.incQuantity', function(e){
                e.preventDefault();
                var quantity = $(this).siblings('.quantity');
                var currentQuantity = parseInt(quantity.html());
                var currentPrice = parseFloat($(this).siblings('.totalPrice').html());
                $(this).siblings('.totalPrice').html(currentPrice + parseFloat($(this).siblings('.unitPrice').html()));
                quantity.html(currentQuantity + 1);

                recalculateOrderTotalAmount(parseFloat($(this).siblings('.unitPrice').html()));
                recalculateOrderTotalAmountInput(parseFloat($(this).siblings('.unitPrice').html()));

            });

            $(document.body).on('click', '.decQuantity', function(e){
                e.preventDefault();
                var quantity = $(this).siblings('.quantity');
                if (parseInt(quantity.html()) == 1) {
                    $(this).parent().remove();
                } else {
                    var currentQuantity = parseInt(quantity.html());
                    var currentPrice = parseFloat($(this).siblings('.totalPrice').html());
                    $(this).siblings('.totalPrice').html(currentPrice - parseFloat($(this).siblings('.unitPrice').html()));
                    quantity.html(currentQuantity - 1);
                }
                recalculateOrderTotalAmountSub(parseFloat($(this).siblings('.unitPrice').html()));
                recalculateOrderTotalAmountInputSub(parseFloat($(this).siblings('.unitPrice').html()));
            });

        });

        function addProduct(product) {

            var exists = false;

            $('.productId').each(function() {
                if ($(this).val() == product.id) {
                    exists = true
                }
            });


            if (exists) {

                var existentProduct = $('#product-' + product.id);
                var currentQuantity = parseInt(existentProduct.find('.quantity').html());
                var currentPrice = parseFloat(existentProduct.find('.totalPrice').html());

                existentProduct.find('.quantity').html(currentQuantity + 1);
                existentProduct.find('.totalPrice').html(currentPrice + parseFloat(existentProduct.find('.unitPrice').html()));

            } else {

                var productInfo = $('.hiddenProduct').clone().removeClass('hiddenProduct').addClass('productInfo').show().attr('id', 'product-' + product.id).prependTo('#products');

                productInfo.find('input[type=hidden]').val(product.id);
                productInfo.find('.name').html(product.name);
                productInfo.find('.quantity').html(1);
                productInfo.find('.unitPrice').html(product.defaultPrice);
                productInfo.find('.totalPrice').html(product.defaultPrice);

            }

            recalculateOrderTotalAmount(product.defaultPrice);
            recalculateOrderTotalAmountInput(product.defaultPrice);

        }

        function recalculateOrderTotalAmount(price) {
            var orderAmount = $('#orderAmount');
            var totalAmount = parseFloat(orderAmount.html()) + price;
            orderAmount.html(totalAmount);
        }

        function recalculateOrderTotalAmountInput(price) {
            var orderAmount = $('#amount');
            var totalAmount = parseFloat(orderAmount.val()) + price;
            orderAmount.val(totalAmount);
        }

        function recalculateOrderTotalAmountSub(price) {
            var orderAmount = $('#orderAmount');
            var totalAmount = parseFloat(orderAmount.html()) - price;
            orderAmount.html(totalAmount);
        }

        function recalculateOrderTotalAmountInputSub(price) {
            var orderAmount = $('#amount');
            var totalAmount = parseFloat(orderAmount.val()) - price;
            orderAmount.val(totalAmount);
        }

    </script>

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
	<g:field name="installment" type="number" value="${customerOrderInstance.installment ?: 1}" required=""/>

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

<div class="hidden hiddenProduct" style="padding-left: 25%" >
    <strong><span class="name"></span><br/></strong>
    Preço unitário: <span class="unitPrice"></span><br/>
    Quantidade: <span class="quantity"></span> <a href="#" class="incQuantity">[+]</a> <a href="#" class="decQuantity">[-]</a><br/>
    Subtotal: <span class="totalPrice"></span>
    <g:hiddenField name="productId" class="productId" />
    <button class="remove">Remover</button>
</div>


<div class="fieldcontain ${hasErrors(bean: customerOrderInstance, field: 'amount', 'error')} required">
    <label for="amount">
        <g:message code="customerOrder.amount.label" default="Amount" />
        <span class="required-indicator">*</span>
    </label>
    <span id="orderAmount">0.0</span>
    <g:hiddenField name="amount" value="0.0"/>
</div>