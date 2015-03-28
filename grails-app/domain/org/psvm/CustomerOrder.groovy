package org.psvm

class CustomerOrder {

    Date purchaseDate
    BigDecimal amount
    Integer installment

    static hasMany = [payments: Payment, products: Product]

    static belongsTo = [customer: Customer]

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
