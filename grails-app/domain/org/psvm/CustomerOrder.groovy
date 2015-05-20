package org.psvm

class CustomerOrder {

    Date purchaseDate
    BigDecimal amount
    Integer installment

    static hasMany = [payments: Payment, products: Product]

    static belongsTo = [customer: Customer]

    static constraints = {
        amount validator: { val, obj ->

            def a = val >= obj.payments.inject(0.0, {sum, payment -> sum + payment.amount})
            println "Val: ${val}"
            println "Pagamentos: ${obj.payments.inject(0.0, {sum, payment -> sum + payment.amount})}"
            println "### a: $a"
            if (a) {
                return true
            } else {
                'customerOrder.firstIncome.invalid'
            }
//            val >= obj.payments.inject(0.0, {sum, payment -> sum + payment.amount}) ?: 'customerOrder.firstIncome.invalid'

        }
    }

    public BigDecimal getTotalPaid() {
        def sum = 0.0g
        payments.each { payment ->
            sum += payment.amount
        }
        return sum
    }

    public BigDecimal getRemainingDebt() {
        def sum = 0.0g
        payments.each { payment ->
            sum += payment.amount
        }
        return amount - sum
    }

}
