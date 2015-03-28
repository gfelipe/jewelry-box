package org.psvm

class Payment {

    Integer installment
    BigDecimal amount
    Date dateCreated
    Date datePaid

    static belongsTo = [customerOrder: CustomerOrder]

    static constraints = {
        installment nullable: true
    }
}
